"use client";

import React, { useCallback, useEffect, useState } from "react";
import { Button, Input, Spinner } from "@nextui-org/react";
import Image from "next/image";
import api from "../../helpers/api";
import { AddTecnico } from "./add-tecnico";
import { TecnicoType } from "@/helpers/types";
import { PlusIcon } from "../icons/plus-icon";
import { TableWrapper } from "../tableDinamica/table";

import { useDisclosure } from "@nextui-org/react";

export const Tecnico = () => {
  const [tecnicos, setTecnicos] = useState<TecnicoType[]>([]);
  const [allTecnicos, setAllTecnicos] = useState<TecnicoType[]>([]); // Todos os dados para pesquisa
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);
  const [editingTecnico, setEditingTecnico] = useState<TecnicoType | null>(null);
  const { isOpen, onOpen, onOpenChange } = useDisclosure();

  const columns = [
    "imagem",
    "nome",
    "posto",
  ];

  const headers = [
    "Imagem",
    "Nome",
    "Posto",
  ];

  const fetchTecnicos = useCallback(async () => {
    try {
      const response = await api.get<TecnicoType[]>("/tecnicos");
      setTecnicos(response.data);
      setAllTecnicos(response.data); // Armazena todos os dados para filtro
    } catch (error) {
      setError("Erro ao buscar tecnicos");
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    fetchTecnicos();
  }, [fetchTecnicos]);

  const handleEditTecnico = useCallback(
    (tecnico: TecnicoType) => {
      setEditingTecnico(tecnico);
      onOpen();
    },
    [onOpen]
  );

  const handleNewTecnico = useCallback(() => {
    setEditingTecnico(null);
    onOpen();
  }, [onOpen]);

  const handleDeleteTecnico = useCallback(
    async (id: number) => {
      if (confirm("Tem certeza que deseja eliminar esta tecnico?")) {
        try {
          await api.delete(`/tecnicos/${id}`);
          fetchTecnicos();
        } catch (error) {
          console.error("Erro ao excluir tecnico:", error);
        }
      }
    },
    [fetchTecnicos]
  );

  const handleFilteredData = (filteredData: TecnicoType[]) => {
    setTecnicos(filteredData); // Atualiza a tabela com os dados filtrados
  };

  return (
    <>
      <div className="my-2 px-4 lg:px-6 max-w-[95rem] mx-auto w-full flex flex-col gap-4">
        <h3 className="text-4xl font-semibold">Tecnicos</h3>
        <div className="flex justify-between flex-wrap gap-4 items-center">
          <div className="flex items-center gap-3 flex-wrap md:flex-nowrap"></div>
          <div className="flex flex-row gap-3.5 flex-wrap">
            <Button
              startContent={<PlusIcon />}
              color="primary"
              className="bg-blue-600 hover:bg-blue-700 text-white"
              onPress={handleNewTecnico} // Chama a função para abrir a modal de adicionar
            >
              Adicionar Tecnico
            </Button>
          </div>
        </div>
        <div className="max-w-[95rem] mx-auto w-full">
          {loading && (
            <div className="flex justify-center items-center w-full">
              <Spinner size="lg" />
            </div>
          )}
          {error && <div>{error}</div>}
          {!loading && !error && (
            <TableWrapper
              data={tecnicos} // Usa os dados filtrados
              columns={columns}
              headers={headers}
              onEdit={handleEditTecnico}
              onDelete={handleDeleteTecnico}
              columnConfig={{
                imagem: (item) => (
                  <Image
                  src={
                    item.imagem
                      ? `${process.env.NEXT_PUBLIC_API_URL}/uploads/${item.imagem}`
                      : "/icone_usuario.png" // Caminho para uma imagem padrão
                  }
                    alt="Imagem"
                    width={80}
                    height={80}
                    style={{ borderRadius: "80px" }}
                    objectFit="cover"
                  />
                ),
              }}
            />
          )}
        </div>
        <AddTecnico
          title={"Tecnico"}
          editingTecnico={editingTecnico}
          onCloseAndRefresh={fetchTecnicos}
          isOpen={isOpen}
          onOpenChange={onOpenChange}
        />
      </div>
    </>
  );
};

export default Tecnico;
