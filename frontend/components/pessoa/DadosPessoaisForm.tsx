// DadosPessoaisForm.tsx
"use client";
import React, { ChangeEvent } from "react";
import {
  Autocomplete,
  AutocompleteItem,
  Button,
  Input,
  Select,
  SelectItem,
  Spinner,
} from "@nextui-org/react";
import { MunicipioType, PessoaType } from "@/helpers/types";
import { Delete, PlusIcon, Search } from "lucide-react";

interface DadosPessoaisFormProps {
  values: PessoaType;
  handleChange: (e: ChangeEvent<any>) => void;
  setFieldValue: (
    field: string,
    value: any,
    shouldValidate?: boolean
  ) => Promise<any>; // Permite qualquer retorno da Promise
  municipios: MunicipioType[];
  municipiosLoading: boolean;
}

export const DadosPessoaisForm = ({
  values,
  handleChange,
  setFieldValue,
  municipios,
  municipiosLoading,
}: DadosPessoaisFormProps) => {
  // Handler para mudança de imagem
  const handleImagemChange = (event: ChangeEvent<HTMLInputElement>) => {
    const file = event.currentTarget.files?.[0];
    if (file) {
      setFieldValue("imagem", file);
    }
  };

  return (
    <div className="grid grid-cols-2 gap-4">
      {/* Campo de Nome */}
      <Input
        name="pessoa.nome"
        label="Nome"
        placeholder="Nome completo"
        value={values.nome}
        onChange={handleChange}
        required
      />

      {/* Campo de Data de Nascimento */}
      <Input
        name="pessoa.data_nascimento"
        label="Data de Nascimento"
        type="date"
        value={values.data_nascimento}
        onChange={handleChange}
        required
      />

      {/* Campo de Gênero */}
      <Select
        label="Gênero"
        size="sm"
        selectedKeys={new Set([values.genero])}
        onSelectionChange={(keys) =>
          setFieldValue("pessoa.genero", String(keys.currentKey))
        }
      >
        <SelectItem key="Masculino">Masculino</SelectItem>
        <SelectItem key="Feminino">Feminino</SelectItem>
      </Select>

      <div className="flex flex-col col-span-2 gap-2">
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
                  `pessoa.contatos[${index}].tipo`,
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
                name={`pessoa.contatos[${index}].valor`}
                value={contato.valor}
                onChange={handleChange}
              />
            </div>
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
                  setFieldValue("pessoa.contatos", newContatos);
                }}
              >
                <Delete />
              </Button>
            )}
            {index === values.contatos.length - 1 && (
              <Button
                isIconOnly
                size="sm"
                variant="light"
                className="ml-2"
                onPress={() =>
                  setFieldValue("pessoa.contatos", [
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

      {/* ete codigo é apenas exemplo do quero, e que já uso para Municípios */}
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
            (key) => setFieldValue("pessoa.municipio_id", Number(key)) // Atualiza o município selecionado
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
              content: "p-1 border-small border-default-100 bg-background",
            },
          }}
          startContent={
            <Search className="text-default-400" strokeWidth={2.5} size={20} />
          }
        >
          {(municipios) => (
            <AutocompleteItem key={municipios.id} textValue={municipios.nome}>
              <div className="flex justify-between items-center">
                <div className="flex gap-2 items-center">
                  <div className="flex flex-col">
                    <span className="text-small">{municipios.nome}</span>
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

      {/* Upload de Imagem */}
      <Input
        label="Foto de Perfil"
        type="file"
        accept="image/*"
        onChange={handleImagemChange}
      />
    </div>
  );
};
