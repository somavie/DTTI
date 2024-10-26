import React from "react";
import { Input, Select, SelectItem, Button, Spinner } from "@nextui-org/react";
import { FormikErrors } from "formik";
import { PessoaType, MunicipioType } from "@/helpers/types";
import { Delete, PlusIcon } from "lucide-react";
import { Autocomplete, AutocompleteItem } from "@nextui-org/react";

interface DadosPessoaisFormProps {
  values: PessoaType;
  handleChange: (e: React.ChangeEvent<any>) => void;
  setFieldValue: (field: string, value: any) => void;
  municipios: MunicipioType[];
  municipiosLoading: boolean;
}

export const DadosPessoaisForm: React.FC<DadosPessoaisFormProps> = ({
  values,
  handleChange,
  setFieldValue,
  municipios,
  municipiosLoading,
}) => {
  return (
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
        {values.contatos?.map((contato, index) => (
          <div key={index} className="flex gap-2 mb-1 items-end">
            <Select
              className="w-24"
              size="sm"
              labelPlacement="outside"
              label="Tipo de Contato"
              selectedKeys={new Set([contato.tipo])}
              onSelectionChange={(keys) =>
                setFieldValue(`contatos[${index}].tipo`, String(keys.currentKey))
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

            {values.contatos.length > 1 && index > 0 && (
              <Button
                isIconOnly
                size="sm"
                variant="light"
                className="ml-2 text-red-600"
                onPress={() => {
                  const newContatos = values.contatos?.filter((_, i) => i !== index);
                  setFieldValue("contatos", newContatos);
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
                  setFieldValue("contatos", [...values.contatos, { tipo: "", valor: "" }])
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
            defaultItems={municipios}
            selectedKey={String(values.municipio_id)}
            onSelectionChange={(key) => setFieldValue("municipio_id", Number(key))}
            aria-label="Selecione um município"
            placeholder="Natural de..."
          >
            {(municipios) => (
              <AutocompleteItem key={municipios.id} textValue={municipios.nome}>
                {municipios.nome}
              </AutocompleteItem>
            )}
          </Autocomplete>
        )}
      </div>
    </div>
  );
};
