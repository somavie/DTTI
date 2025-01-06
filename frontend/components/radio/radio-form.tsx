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
import { RadioSchema } from "@/helpers/schemas";
import { RadioType } from "@/helpers/types";
import { useAllEntidades } from "../hooks/allselect";
import { useToast } from "@/hooks/use-toast";

interface RadioFormProps {
  editingRadio: RadioType | null;
  onCloseAndRefresh: () => void;
  isOpen: boolean;
  onOpenChange: (open: boolean) => void;
}

interface RadioFormValues {
  id: number;
  numero_serie: string;
  identificador: string;
  localizacao: string;
  situacao: string;
  entidade_id: number;
}

export const RadioForm = ({
  editingRadio,
  onCloseAndRefresh,
  isOpen,
  onOpenChange,
}: RadioFormProps) => {
  const { entidades, loading: entidadesLoading } = useAllEntidades();
  const { toast } = useToast();

  const initialValues: RadioFormValues = {
    id: editingRadio?.id || 0,
    numero_serie: editingRadio?.numero_serie || "",
    identificador: editingRadio?.identificador || "",
    localizacao: editingRadio?.localizacao || "",
    situacao: editingRadio?.situacao || "",
    entidade_id: editingRadio?.entidade_id || 0,
  };

  const handleRadioSubmit = useCallback(
    async (values: RadioFormValues, { resetForm }: FormikHelpers<RadioFormValues>) => {
      try {
        if (editingRadio) {
          await api.put(`/radios/${editingRadio.id}`, values);
        } else {
          await api.post("/radios", values);
        }

        resetForm();
        onCloseAndRefresh();
        onOpenChange(false);
        toast({
          title: "Sucesso",
          description: editingRadio ? "Rádio atualizado com sucesso" : "Rádio criado com sucesso",
        });
      } catch (error) {
        console.error("Erro ao criar/atualizar rádio:", error);
        toast({
          title: "Erro",
          description: (error as any).response?.data?.message || "Erro ao criar/atualizar rádio",
          variant: "destructive",
        });
      }
    },
    [editingRadio, onCloseAndRefresh, onOpenChange, toast]
  );

  return (
    <Modal isOpen={isOpen} onOpenChange={onOpenChange} placement="top-center">
      <ModalContent>
        {(onClose) => (
          <>
            <ModalHeader className="flex flex-col gap-1">
              {editingRadio ? "Editar Rádio" : "Cadastro de Rádio"}
            </ModalHeader>
            <ModalBody>
              <Formik
                initialValues={initialValues}
                enableReinitialize
                validationSchema={RadioSchema}
                onSubmit={handleRadioSubmit}
              >
                {({ values, errors, touched, handleChange, handleSubmit }) => (
                  <>
                    <div className="flex flex-col gap-4 mb-4">
                      <Input
                        variant="bordered"
                        label="Número de Série"
                        value={values.numero_serie}
                        isInvalid={!!errors.numero_serie && !!touched.numero_serie}
                        errorMessage={errors.numero_serie}
                        onChange={handleChange("numero_serie")}
                        placeholder="Digite o número de série"
                      />
                      <Input
                        variant="bordered"
                        label="Identificador"
                        value={values.identificador}
                        isInvalid={!!errors.identificador && !!touched.identificador}
                        errorMessage={errors.identificador}
                        onChange={handleChange("identificador")}
                        placeholder="Digite o identificador"
                      />
                      <Input
                        variant="bordered"
                        label="Localização"
                        value={values.localizacao}
                        isInvalid={!!errors.localizacao && !!touched.localizacao}
                        errorMessage={errors.localizacao}
                        onChange={handleChange("localizacao")}
                        placeholder="Digite a localização"
                      />
                      <Input
                        variant="bordered"
                        label="Situação"
                        value={values.situacao}
                        isInvalid={!!errors.situacao && !!touched.situacao}
                        errorMessage={errors.situacao}
                        onChange={handleChange("situacao")}
                        placeholder="Digite a situação"
                      />
                      {entidadesLoading ? (
                        <Spinner size="sm" label="Carregando..." />
                      ) : (
                        <Select
                          label="Entidade"
                          selectedKeys={values.entidade_id ? [String(values.entidade_id)] : []}
                          onSelectionChange={(keys) =>
                            handleChange({
                              target: {
                                name: "entidade_id",
                                value: Number(Array.from(keys)[0]),
                              },
                            })
                          }
                        >
                          {entidades?.map((entidade) => (
                            <SelectItem key={entidade.id} value={entidade.id}>
                              {entidade.nome}
                            </SelectItem>
                          ))}
                        </Select>
                      )}
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
                      {editingRadio ? "Atualizar Rádio" : "Cadastrar Rádio"}
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

