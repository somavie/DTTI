"use client";

import {
  Button,
  Input,
  Spinner,
  Modal,
  ModalBody,
  Select,
  SelectItem,
  ModalContent,
  ModalHeader,
} from "@nextui-org/react";
import React, { useCallback } from "react";
import { Formik, FormikHelpers } from "formik";
import api from "../../helpers/api";
import { GrupoSchema } from "@/helpers/schemas"; // Defina o esquema de validação para Grupo
import { GrupoGrsType } from "@/helpers/types";

interface AddGrupoProps {
  editingGrupo: GrupoGrsType | null;
  onCloseAndRefresh: () => void;
  isOpen: boolean;
  onOpenChange: (open: boolean) => void;
}

interface GrupoForm {
  id: number;
  nome: string;
  qtds: number;
}

export const AddGrupo = ({
  editingGrupo,
  onCloseAndRefresh,
  isOpen,
  onOpenChange,
}: AddGrupoProps) => {

  const initialValues: GrupoForm = {
    id: editingGrupo?.id || 0,
    nome: editingGrupo?.nome || "",
    qtds: editingGrupo?.qtds || 0,
  };

  const handleGrupoSubmit = useCallback(
    async (values: GrupoForm, { resetForm }: FormikHelpers<GrupoForm>) => {
      try {
        if (editingGrupo) {
          await api.put(`/grupos/${editingGrupo.id}`, values);
        } else {
          await api.post("/grupos", values);
        }

        resetForm();
        onCloseAndRefresh();
        onOpenChange(false);
      } catch (error) {
        console.error("Erro ao criar/atualizar grupo:", error);
      }
    },
    [editingGrupo, onCloseAndRefresh, onOpenChange]
  );

  return (
    <Modal isOpen={isOpen} onOpenChange={onOpenChange} placement="top-center">
      <ModalContent>
        {(onClose) => (
          <>
            <ModalHeader className="flex flex-col gap-1">
              {editingGrupo ? "Editar Grupo" : "Cadastrar Grupo"}
            </ModalHeader>
            <ModalBody>
              <Formik
                initialValues={initialValues}
                enableReinitialize
                validationSchema={GrupoSchema}
                onSubmit={handleGrupoSubmit}
              >
                {({ values, errors, touched, handleChange, handleSubmit }) => (
                  <>
                    <div className="flex flex-col gap-4 mb-4">
                      <Input
                        variant="bordered"
                        label="Nome"
                        value={values.nome}
                        isInvalid={!!errors.nome && !!touched.nome}
                        errorMessage={errors.nome}
                        onChange={handleChange("nome")}
                        placeholder="Digite o nome da grupo"
                      />
                      <Input
                        variant="bordered"
                        type="number"
                        label="qtds"
                        value={values.qtds.toString()}
                        isInvalid={!!errors.qtds && !!touched.qtds}
                        errorMessage={errors.qtds}
                        onChange={handleChange("qtds")}
                        placeholder="Digite o qtds da grupo"
                      />
                    </div>
                    <Button
                      onPress={() => {
                        handleSubmit();
                        onClose();
                      }}
                      variant="flat"
                      color="primary"
                      className="w-full bg-blue-600 hover:bg-blue-700 text-white"
                    >
                      {editingGrupo ? "Atualizar Grupo" : "Cadastrar Grupo"}
                    </Button>
                  </>
                )}
              </Formik>
            </ModalBody>
          </>
        )}
      </ModalContent>
    </Modal>
  );
};
