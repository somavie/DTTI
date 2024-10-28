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
  Autocomplete,
  AutocompleteItem,
} from "@nextui-org/react";
import Image from "next/image";
import React, { useCallback, useState } from "react";
import { Formik, FormikHelpers, ErrorMessage } from "formik";
import api from "../../helpers/api";
import { PessoaSchema } from "@/helpers/schemas";
import { useFetchData } from "../hooks/useFetchDatas"; // O hook para buscar dados
import { PessoaType, MunicipioType } from "@/helpers/types";
import { Delete, PlusIcon, Search } from "lucide-react";

interface AddPessoaProps {
  title: string;
  editingPessoa: PessoaType | null;
  onCloseAndRefresh: () => void;
  isOpen: boolean;
  onOpenChange: (open: boolean) => void;
}


export const AddPessoa = ({
  title,
  editingPessoa,
  onCloseAndRefresh,
  isOpen,
  onOpenChange,
}: AddPessoaProps) => {

  const { data: municipios, loading: municipiosLoading } =
  useFetchData<MunicipioType>("/municipios");
  const [imagem, setImagem] = useState<File | null>(null);

  const initialValues: PessoaType = {
    id: editingPessoa?.id || 0,
    nome: editingPessoa?.nome || "",
    data_nascimento: editingPessoa?.data_nascimento || "", // Garante que a data seja uma string
    genero: editingPessoa?.genero || "Masculino",
    municipio_id: editingPessoa?.municipio_id || 0, // Inicializa o município
    imagem: editingPessoa?.imagem || "", // Inicializa o campo da imagem como null
    contatos: editingPessoa?.contatos || [
      {
        id: 0,
        cont_pessoa_id: 0,
        tipo: "telefone",
        valor: "",
      },
    ],
  };

  const handlePessoaSubmit = useCallback(
    async (values: PessoaType, { resetForm }: FormikHelpers<PessoaType>) => {
      try {
        const formData = new FormData();
        formData.append("nome", values.nome);
        formData.append("data_nascimento", values.data_nascimento);
        formData.append("genero", values.genero);
        formData.append("municipio_id", String(values.municipio_id));

        if (
          values.imagem &&
          typeof values.imagem !== "string"
        ) {
          formData.append("imagem", values.imagem);
        }


        if (editingPessoa) {
          await api.put(`/pessoas/${editingPessoa.id}`, formData);
        } else {
          await api.post("/pessoas", formData);
        }

        resetForm();
        onCloseAndRefresh();
        onOpenChange(false); // Fecha o modal após a operação
      } catch (error) {
        console.error("Erro ao criar/atualizar pessoa:", error);
      }
    },
    [editingPessoa, onCloseAndRefresh, onOpenChange, imagem]
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
            {editingPessoa ? "Editar Pessoa" : "Cadastro de Pessoa"}
          </h1>
        </ModalHeader>
        <ModalBody>
          <Formik
            initialValues={initialValues}
            enableReinitialize
            validationSchema={PessoaSchema}
            onSubmit={handlePessoaSubmit}
          >
            {({ values, handleChange, handleSubmit, setFieldValue }) => (
              <form onSubmit={handleSubmit}>
                <div className="grid grid-cols-2 gap-4">
                  <div className="col-span-2">
                    <h3 className="text-lg font-semibold">Dados Pessoais</h3>
                  </div>
                  <Input
                    label="Nome"
                    name="nome"
                    value={values.nome}
                    onChange={handleChange}
                    size="sm"
                  />
                  <div className="flex gap-2">
                    <Input
                      type="date"
                      label="Data de Nascimento"
                      name="data_nascimento"
                      value={values.data_nascimento}
                      onChange={handleChange}
                      size="sm"
                    />
                    <Select
                      label="Gênero"
                      size="sm"
                      selectedKeys={new Set([values.genero])}
                      onSelectionChange={(keys) =>
                        setFieldValue("genero", String(keys.currentKey))
                      }
                    >
                      <SelectItem key="Masculino">Masculino</SelectItem>
                      <SelectItem key="Feminino">Feminino</SelectItem>
                    </Select>
                  </div>

                  <div className="flex flex-col gap-2">
                    {/* Mapeando os contatos */}
                    {values.contatos?.map((contato, index) => (
                      <div key={index} className="flex gap-2 mb-1 items-end">
                        <Select
                          className="w-24"
                          size="sm"
                          labelPlacement="outside"
                          label="Tipo de Contato"
                          selectedKeys={new Set([contato.tipo])}
                          onSelectionChange={(keys) =>
                            setFieldValue(
                              `contatos[${index}].tipo`,
                              String(keys.currentKey)
                            )
                          }
                        >
                          <SelectItem key="Telefone">Telefone</SelectItem>
                          <SelectItem key="Email">Email</SelectItem>
                        </Select>
                        <div className="w-64">
                          <Input
                            variant="underlined"
                            size="sm"
                            label="Contato"
                            name={`contatos[${index}].valor`}
                            value={contato.valor}
                            onChange={handleChange}
                          />
                        </div>

                        {/* Botão para remover contato (não aparece no índice 0) */}
                        {values.contatos.length > 1 && index > 0 && (
                          <Button
                            isIconOnly
                            size="sm"
                            variant="light"
                            className="ml-2 text-red-600"
                            onPress={() => {
                              const newContatos = values.contatos?.filter(
                                (_, i) => i !== index
                              );
                              setFieldValue("contatos", newContatos);
                            }}
                          >
                            <Delete />
                          </Button>
                        )}

                        {/* Botão para adicionar contato na última linha */}
                        {index === values.contatos.length - 1 && (
                          <Button
                            isIconOnly
                            size="sm"
                            variant="light"
                            className="ml-2"
                            onPress={() =>
                              setFieldValue("contatos", [
                                ...values.contatos,
                                { tipo: "", valor: "" },
                              ])
                            }
                          >
                            <PlusIcon />
                          </Button>
                        )}
                      </div>
                    ))}
                  </div>

                  <div className="flex gap-2 mt-2">
                    {municipiosLoading ? (
                      <Spinner label="Carregando municípios..." />
                    ) : (
                      <Autocomplete
                        classNames={{
                          base: "max-w-xs",
                          listboxWrapper: "max-h-[320px]",
                          selectorButton: "text-default-500",
                        }}
                        defaultItems={municipios}
                        selectedKey={String(values.municipio_id)}
                        onSelectionChange={
                          (key) =>
                            setFieldValue("municipio_id", Number(key)) // Atualiza o município selecionado
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
                        {(municipios) => (
                          <AutocompleteItem
                            key={municipios.id}
                            textValue={municipios.nome}
                          >
                            <div className="flex justify-between items-center">
                              <div className="flex gap-2 items-center">
                                <div className="flex flex-col">
                                  <span className="text-small">
                                    {municipios.nome}
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

                    <label
                      className="text-xs text-gray-500 flex items-center gap-2 cursor-pointer"
                      htmlFor="img"
                    >
                      <Image src="/upload.png" alt="" width={28} height={28} />
                      <span>Carregar a Foto</span>
                    </label>
                    <Input
                      type="file"
                      label="Imagem"
                      name="imagem"
                      accept="image/*"
                      className="hidden"
                      id="img"
                      onChange={(e) => {
                        const file = e.currentTarget.files?.[0];
                        setFieldValue("imagem", file || null);
                      }}
                    />
                  </div>

                  
                </div>

                <div className="mt-6 flex justify-end gap-4">
                  <Button type="submit">
                    {editingPessoa ? "Atualizar" : "Salvar"}
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
