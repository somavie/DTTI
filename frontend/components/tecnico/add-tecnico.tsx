"use client";

import {Button, Input, Select, SelectItem, Spinner, Modal, ModalBody, ModalContent, ModalHeader, Autocomplete,
  AutocompleteItem,
} from "@nextui-org/react";
import React, { useCallback, useState } from "react";
import { Formik, FormikHelpers, ErrorMessage } from "formik";
import api from "../../helpers/api";
import { TecnicoSchema } from "@/helpers/schemas";
import { MunicipioType, PostoType, TecnicoType } from "@/helpers/types";
import { useFetchData } from "../hooks/useFetchDatas"; // O hook para buscar dados
import { Search } from "lucide-react";
import { DadosPessoaisForm } from "../pessoa/DadosPessoaisForm";

interface AddTecnicoProps {
  title: string;
  editingTecnico: TecnicoType | null;
  onCloseAndRefresh: () => void;
  isOpen: boolean;
  onOpenChange: (open: boolean) => void;
}

export const AddTecnico = ({
  title,
  editingTecnico,
  onCloseAndRefresh,
  isOpen,
  onOpenChange,
}: AddTecnicoProps) => {
  const { data: postos, loading: postosLoading } = useFetchData<PostoType>("/postos");
  const { data: municipios, loading: municipiosLoading } = useFetchData<MunicipioType>("/municipios");
  const [imagem, setImagem] = useState<File | null>(null);

  const initialValues: TecnicoType = {
    id: editingTecnico?.id || 0,
    pessoa: {
      id: editingTecnico?.pessoa.id || 0,
      nome: editingTecnico?.pessoa.nome || "",
      data_nascimento: editingTecnico?.pessoa.data_nascimento || "",
      genero: editingTecnico?.pessoa.genero || "Masculino",
      imagem: editingTecnico?.pessoa.imagem || "",
      municipio_id: editingTecnico?.pessoa.municipio_id || 0,
      contatos: editingTecnico?.pessoa.contatos || [
        {
          id: 0,
          cont_pessoa_id: 0,
          tipo: "telefone",
          valor: "",
        },
      ]
    },
    posto_id: editingTecnico?.posto_id || 0
  };

  const handleTecnicoSubmit = useCallback(
    async (values: TecnicoType, { resetForm }: FormikHelpers<TecnicoType>) => {
      try {
        
        
        if (editingTecnico) {
          await api.put(`/tecnicos/${editingTecnico.id}`, {posto_id: editingTecnico.posto_id});
          const formData = new FormData();

              formData.append("nome", values.pessoa.nome);
              formData.append("data_nascimento", values.pessoa.data_nascimento);
              formData.append("genero", values.pessoa.genero);
              formData.append("municipio_id",values.pessoa.municipio_id.toString());
              if (
                values.pessoa.imagem &&
                typeof values.pessoa.imagem !== "string"
              ) {
                formData.append("imagem", values.pessoa.imagem);
              }
              await api.put(`/pessoas/${editingTecnico?.pessoa.id}`,formData);
            
        } else {
          const formData = new FormData();
          formData.append("nome", values.pessoa.nome);
          formData.append("data_nascimento", values.pessoa.data_nascimento);
          formData.append("genero", values.pessoa.genero);
          formData.append("municipio_id",values.pessoa.municipio_id.toString());

          if (values.pessoa.imagem && typeof values.pessoa.imagem !== "string") {
            formData.append("imagem", values.pessoa.imagem);
          }

          const pessoaResponse = await api.post("/pessoas", formData);
          const pessoaId = pessoaResponse.data.id;

          values.pessoa.contatos.forEach((contato, index) => {
            formData.append(`contatos[${index}][tipo]`, contato.tipo);
            formData.append(`contatos[${index}][valor]`, contato.valor);
          });
          await Promise.all(
            values.pessoa.contatos.map((contato) =>
              api.post("/contatos", { pessoa_id: pessoaId, ...contato })
            )
          );

          await api.post("/tecnicos", values.posto_id);
        }

        resetForm();
        onCloseAndRefresh();
        onOpenChange(false); // Fecha o modal após a operação
      } catch (error) {
        console.error("Erro ao criar/atualizar tecnico:", error);
      }
    },
    [editingTecnico, onCloseAndRefresh, onOpenChange, imagem]
  );

  const handleImagemChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    const file = event.currentTarget.files?.[0];
    setImagem(file || null); // Atualiza o estado da imagem
  };

  return (
    <Modal
      size="5xl"
      isOpen={isOpen}
      onOpenChange={onOpenChange}
      placement="center"
      backdrop="blur"
      isDismissable={false}
      isKeyboardDismissDisabled={true}
      scrollBehavior="outside"
      classNames={{
        body: "py-6",
        base: "border-[#292f46] pb-6",
        header: "border-b-[1px] border-[#292f46]",
        footer: "border-t-[1px] border-[#292f46]",
        closeButton: "hover:bg-white/5 active:bg-white/10",
      }}
    >
      <ModalContent>
        <ModalHeader className="flex flex-col gap-1 items-center">
          <h1 className="text-2xl">
            {editingTecnico ? "Editar Tecnico" : "Cadastro de Tecnico"}
          </h1>
        </ModalHeader>
        <ModalBody>
          <Formik
            initialValues={initialValues}
            enableReinitialize
            validationSchema={TecnicoSchema}
            onSubmit={handleTecnicoSubmit}
          >
            {({ values, handleChange, handleSubmit, setFieldValue }) => (
              <form onSubmit={handleSubmit}>
                <div className="grid grid-cols-2 gap-4">
                  <div className="col-span-2">
                    <h3 className="text-lg font-semibold">Dados Pessoais</h3>
                  </div>
                  
                  <DadosPessoaisForm
                    values={values.pessoa}  // Passa apenas a parte de pessoa
                    handleChange={handleChange}
                    setFieldValue={setFieldValue}
                    municipios={municipios}
                    municipiosLoading={municipiosLoading}
                  />
                  <div className="flex gap-2 mt-2">
                    {postosLoading ? (
                      <Spinner label="Carregando municípios..." />
                    ) : (
                      <Autocomplete
                        classNames={{
                          base: "max-w-xs",
                          listboxWrapper: "max-h-[320px]",
                          selectorButton: "text-default-500",
                        }}
                        defaultItems={postos}
                        selectedKey={String(values.posto_id)}
                        onSelectionChange={
                          (key) =>
                            setFieldValue("posto_id", Number(key)) // Atualiza o município selecionado
                        }
                        inputProps={{
                          classNames: {
                            input: "ml-1",
                            inputWrapper: "h-[48px]",
                          },
                        }}
                        listboxProps={{
                          hideSelectedIcon: true,
                          itemClasses: {
                            base: [
                              "rounded-medium",
                              "text-default-500",
                              "transition-opacity",
                              "data-[hover=true]:text-foreground",
                              "dark:data-[hover=true]:bg-default-50",
                              "data-[pressed=true]:opacity-70",
                              "data-[hover=true]:bg-default-200",
                              "data-[selectable=true]:focus:bg-default-100",
                              "data-[focus-visible=true]:ring-default-500",
                            ],
                          },
                        }}
                        aria-label="Selecione um município"
                        placeholder="Natural de...  "
                        popoverProps={{
                          offset: 10,
                          classNames: {
                            base: "rounded-large",
                            content:
                              "p-1 border-small border-default-100 bg-background",
                          },
                        }}
                        startContent={
                          <Search
                            className="text-default-400"
                            strokeWidth={2.5}
                            size={20}
                          />
                        }
                      >
                        {(postos) => (
                          <AutocompleteItem
                            key={postos.id}
                            textValue={postos.posto}
                          >
                            <div className="flex justify-between items-center">
                              <div className="flex gap-2 items-center">
                                <div className="flex flex-col">
                                  <span className="text-small">
                                    {postos.posto}
                                  </span>
                                </div>
                              </div>
                              <Button
                                className="border-small mr-0.5 font-medium shadow-small"
                                radius="full"
                                size="sm"
                                variant="bordered"
                              >
                                Add
                              </Button>
                            </div>
                          </AutocompleteItem>
                        )}
                      </Autocomplete>
                    )}

                  </div>

                  
                </div>

                <div className="mt-6 flex justify-end gap-4">
                  <Button type="submit">
                    {editingTecnico ? "Atualizar" : "Salvar"}
                  </Button>
                  <Button variant="light" onPress={() => onOpenChange(false)}>
                    Cancelar
                  </Button>
                </div>
              </form>
            )}
          </Formik>
        </ModalBody>
      </ModalContent>
    </Modal>
  );
};
