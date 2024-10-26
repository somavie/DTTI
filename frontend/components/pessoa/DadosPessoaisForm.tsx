// DadosPessoaisForm.tsx

import React, { ChangeEvent } from "react";
import { Autocomplete, AutocompleteItem, Button, Input, Select, SelectItem, Spinner } from "@nextui-org/react";
import { PessoaType } from "@/helpers/types";
import { Search } from "lucide-react";

interface DadosPessoaisFormProps {
  values: PessoaType;
  handleChange: (e: ChangeEvent<any>) => void;
  setFieldValue: (field: string, value: any, shouldValidate?: boolean) => Promise<any>; // Permite qualquer retorno da Promise
  municipios: Array<{ id: number; nome: string }>;
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
        name="nome"
        label="Nome"
        placeholder="Nome completo"
        value={values.nome}
        onChange={handleChange}
        required
      />

      {/* Campo de Data de Nascimento */}
      <Input
        name="data_nascimento"
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

      {/* Campo de Município */}
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
                            setFieldValue("pessoa.municipio_id", Number(key)) // Atualiza o município selecionado
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
