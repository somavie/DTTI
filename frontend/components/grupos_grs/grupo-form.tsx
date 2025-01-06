"use client";

import {
  Button,
  Input,
  Modal,
  ModalBody,
  ModalContent,
  ModalHeader,
} from "@nextui-org/react";
import React, { useCallback } from "react";
import { Formik, FormikHelpers } from "formik";
import api from "../../helpers/api";
import { GrupoSchema } from "@/helpers/schemas";
import { GrupoType } from "@/helpers/types";

interface GrupoFormProps {
  editingGrupo: GrupoType | null;
  onCloseAndRefresh: () => void;
  isOpen: boolean;
  onOpenChange: (open: boolean) => void;
}

interface GrupoFormValues {
  id: number;
  nome: string;
  codname: string;
}

export const GrupoForm = ({
  editingGrupo,
  onCloseAndRefresh,
  isOpen,
  onOpenChange,
}: GrupoFormProps) => {
  const initialValues: GrupoFormValues = {
    id: editingGrupo?.id || 0,
    nome: editingGrupo?.nome || "",
    codname: editingGrupo?.codname || "",
  };

  const handleGrupoSubmit = useCallback(
    async (values: GrupoFormValues, { resetForm }: FormikHelpers<GrupoFormValues>) => {
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
              {editingGrupo ? "Editar Grupo" : "Cadastro de Grupo"}
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
                        placeholder="Digite o nome do grupo"
                      />
                      <Input
                        variant="bordered"
                        label="Codname"
                        value={values.codname}
                        isInvalid={!!errors.codname && !!touched.codname}
                        errorMessage={errors.codname}
                        onChange={handleChange("codname")}
                        placeholder="Digite o codname do grupo"
                        maxLength={10}
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

