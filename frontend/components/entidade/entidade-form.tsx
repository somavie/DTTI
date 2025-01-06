"use client";

import {
  Button,
  Input,
  Select,
  SelectItem,
  Spinner,
  Modal,
  ModalBody,
  ModalContent,
  ModalHeader,
} from "@nextui-org/react";
import React, { useCallback, useState, useEffect } from "react";
import { Formik, FormikHelpers } from "formik";
import api from "../../helpers/api";
import { EntidadeSchema } from "@/helpers/schemas";
import { EntidadeType } from "@/helpers/types";
import { useAllGrupos } from "../hooks/allselect";

interface EntidadeFormProps {
  editingEntidade: EntidadeType | null;
  onCloseAndRefresh: () => void;
  isOpen: boolean;
  onOpenChange: (open: boolean) => void;
}

interface EntidadeFormValues {
  id: number;
  nome: string;
  indicativo: number;
  
}

export const EntidadeForm = ({
  editingEntidade,
  onCloseAndRefresh,
  isOpen,
  onOpenChange,
}: EntidadeFormProps) => {
  const { grupos, loading: gruposLoading } = useAllGrupos();

  const initialValues: EntidadeFormValues = {
    id: editingEntidade?.id || 0,
    nome: editingEntidade?.nome || "",
    indicativo: editingEntidade?.indicativo || 0,
    
  };

  const handleEntidadeSubmit = useCallback(
    async (values: EntidadeFormValues, { resetForm }: FormikHelpers<EntidadeFormValues>) => {
      try {
        if (editingEntidade) {
          await api.put(`/entidades/${editingEntidade.id}`, values);
        } else {
          await api.post("/entidades", values);
        }

        resetForm();
        onCloseAndRefresh();
        onOpenChange(false);
      } catch (error) {
        console.error("Erro ao criar/atualizar entidade:", error);
      }
    },
    [editingEntidade, onCloseAndRefresh, onOpenChange]
  );

  return (
    <Modal isOpen={isOpen} onOpenChange={onOpenChange} placement="top-center">
      <ModalContent>
        {(onClose) => (
          <>
            <ModalHeader className="flex flex-col gap-1">
              {editingEntidade ? "Editar Entidade" : "Cadastro de Entidade"}
            </ModalHeader>
            <ModalBody>
              <Formik
                initialValues={initialValues}
                enableReinitialize
                validationSchema={EntidadeSchema}
                onSubmit={handleEntidadeSubmit}
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
                        placeholder="Digite o nome da entidade"
                      />
                      <Input
                        variant="bordered"
                        type="number"
                        label="Indicativo"
                        value={values.indicativo.toString()}
                        isInvalid={!!errors.indicativo && !!touched.indicativo}
                        errorMessage={errors.indicativo}
                        onChange={handleChange("indicativo")}
                        placeholder="Digite o indicativo"
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
                      {editingEntidade ? "Atualizar Entidade" : "Cadastrar Entidade"}
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

