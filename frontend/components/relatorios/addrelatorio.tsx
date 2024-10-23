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
import React, { useCallback } from "react";
import { Formik, FormikHelpers } from "formik";
import api from "../../helpers/api";
import { RelatorioSchema } from "@/helpers/schemas"; // Supondo que você tenha um schema de validação
import { RelatorioType, Tecnico } from "@/helpers/types"; // Defina a interface RelatorioType e Tecnico
import { useFetchData } from "../hooks/useFetchDatas"; // O hook para buscar dados

interface AddRelatorioProps {
  title: string;
  editingRelatorio: RelatorioType | null;
  onCloseAndRefresh: () => void;
  isOpen: boolean;
  onOpenChange: (open: boolean) => void;
}

interface RelatorioForm {
  id: number;
  tecnico_cessante_id: number;
  tecnico_entrante_id: number;
  data_criacao: string; // Data é representada como string no formato 'YYYY-MM-DD'
  observacoes_finais: string;
}

export const AddRelatorio = ({
  title,
  editingRelatorio,
  onCloseAndRefresh,
  isOpen,
  onOpenChange,
}: AddRelatorioProps) => {
  const { data: tecnicos, loading: loadingTecnicos } =
    useFetchData<Tecnico>("/tecnicos"); // Buscando técnicos

  const initialValues: RelatorioForm = {
    id: editingRelatorio?.id || 0,
    tecnico_cessante_id: editingRelatorio?.tecnico_cessante_id || 0,
    tecnico_entrante_id: editingRelatorio?.tecnico_entrante_id || 0,
    data_criacao: editingRelatorio?.data_criacao || "", // Garante que a data seja uma string
    observacoes_finais: editingRelatorio?.observacoes_finais || "",
  };

  const handleRelatorioSubmit = useCallback(
    async (
      values: RelatorioForm,
      { resetForm }: FormikHelpers<RelatorioForm>
    ) => {
      try {
        const data = {
          tecnico_cessante_id: values.tecnico_cessante_id,
          tecnico_entrante_id: values.tecnico_entrante_id,
          data_criacao: values.data_criacao,
          observacoes_finais: values.observacoes_finais,
        };

        if (editingRelatorio) {
          await api.put(`/relatorios/${editingRelatorio.id}`, data);
        } else {
          await api.post("/relatorios", data);
        }

        resetForm();
        onCloseAndRefresh();
        onOpenChange(false); // Fecha o modal após a operação
      } catch (error) {
        console.error("Erro ao criar/atualizar relatório:", error);
      }
    },
    [editingRelatorio, onCloseAndRefresh, onOpenChange]
  );

  return (
    <Modal isOpen={isOpen} onOpenChange={onOpenChange} placement="top-center">
      <ModalContent>
        {(onClose) => (
          <>
            <ModalHeader className="flex flex-col gap-1">{title}</ModalHeader>
            <ModalBody>
              <Formik
                initialValues={initialValues}
                enableReinitialize
                validationSchema={RelatorioSchema} // Schema de validação
                onSubmit={handleRelatorioSubmit}
              >
                {({ values, errors, touched, handleChange, handleSubmit }) => (
                  <>
                    <div className="flex flex-col gap-4 mb-4">
                      {loadingTecnicos ? (
                        <Spinner size="sm" label="Carregando técnicos..." />
                      ) : (
                        <div className="flex flex-col gap-2">
                          <Select
                            label="Técnico Cessante"
                            selectedKeys={
                              new Set([String(values.tecnico_cessante_id)])
                            }
                            onSelectionChange={(keys) =>
                              handleChange({
                                target: {
                                  name: "tecnico_cessante_id",
                                  value: Number(keys.currentKey),
                                },
                              })
                            }
                          >
                            {tecnicos?.map((tecnico) => (
                              <SelectItem key={tecnico.id}>
                                {tecnico.nome}
                              </SelectItem>
                            ))}
                          </Select>
                          <Select
                            label="Técnico Entrante"
                            selectedKeys={
                              new Set([String(values.tecnico_entrante_id)])
                            }
                            onSelectionChange={(keys) =>
                              handleChange({
                                target: {
                                  name: "tecnico_entrante_id",
                                  value: Number(keys.currentKey),
                                },
                              })
                            }
                          >
                            {tecnicos?.map((tecnico) => (
                              <SelectItem key={tecnico.id}>
                                {tecnico.nome}
                              </SelectItem>
                            ))}
                          </Select>
                        </div>
                      )}

                      <Input
                        variant="bordered"
                        type="date"
                        label="Data de Criação"
                        value={values.data_criacao}
                        isInvalid={
                          !!errors.data_criacao && !!touched.data_criacao
                        }
                        errorMessage={errors.data_criacao}
                        onChange={handleChange("data_criacao")}
                      />
                      <Input
                        variant="bordered"
                        label="Observações Finais"
                        value={values.observacoes_finais}
                        isInvalid={
                          !!errors.observacoes_finais &&
                          !!touched.observacoes_finais
                        }
                        errorMessage={errors.observacoes_finais}
                        onChange={handleChange("observacoes_finais")}
                        placeholder="Digite as observações finais"
                      />
                    </div>
                    <Button
                      onPress={(e) => {
                        // Previna o comportamento padrão
                        handleSubmit(); // Chama a função de envio
                      }}
                      variant="flat"
                      color="primary"
                      className="w-full bg-blue-600 hover:bg-blue-700 text-white"
                    >
                      {editingRelatorio
                        ? "Atualizar Relatório"
                        : "Cadastrar Relatório"}
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
