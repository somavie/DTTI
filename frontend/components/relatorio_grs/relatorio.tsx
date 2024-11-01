"use client";

import React, { useCallback, useEffect, useState } from "react";
import { Button, Spinner } from "@nextui-org/react";
import api from "../../helpers/api";
import { AddRelatorio } from "./addrelatorio";
import { RelatorioType } from "@/helpers/types";
import { VisualizarRelatorioModal } from "./view-relatorio";
import { PlusIcon } from "../icons/plus-icon";
import { TableWrapper } from "../tableDinamica/table";
import { useDisclosure } from "@nextui-org/react";

export const Relatorios = () => {
  const [relatorios, setRelatorios] = useState<RelatorioType[]>([]);
  const [allRelatorios, setAllRelatorios] = useState<RelatorioType[]>([]); // Todos os dados para pesquisa
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);
  const [isViewing, setIsViewing] = useState<boolean>(false);
  const [editingRelatorio, setEditingRelatorio] = useState<RelatorioType | null>(null);
  const [viewingRelatorio, setViewingRelatorio] = useState<any | null>(null);
  const { isOpen, onOpen, onOpenChange } = useDisclosure();
  const columns = [
    "cessante",
    "entrante",
    "data_criacao",
    "observacoes_finais",
    "estado",
  ];

  const headers = [
    "Técnico Cessante",
    "Técnico Entrante",
    "Data de Criação",
    "Observações Finais",
    "Estado",
  ];

  const fetchRelatorios = useCallback(async () => {
    try {
      const response = await api.get<RelatorioType[]>("/relatorios");
      setRelatorios(response.data);
      setAllRelatorios(response.data); // Armazena todos os dados para filtro
    } catch (error) {
      setError("Erro ao buscar relatórios");
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    fetchRelatorios();
  }, [fetchRelatorios]);

  const handleEditRelatorio = useCallback(
    (relatorio: RelatorioType) => {
      setEditingRelatorio(relatorio);
      onOpen();
    },
    [onOpen]
  );

  const handleNewRelatorio = useCallback(() => {
    setEditingRelatorio(null);
    onOpen();
  }, [onOpen]);

  // Função para abrir a modal
  const handleView = (relatorio: RelatorioType) => {
    setViewingRelatorio(relatorio);
    setIsViewing(true);
  };


  const handleDeleteRelatorio = useCallback(
    async (id: number) => {
      if (confirm("Tem certeza que deseja eliminar este relatório?")) {
        try {
          await api.delete(`/relatorios/${id}`);
          fetchRelatorios();
        } catch (error) {
          console.error("Erro ao excluir relatório:", error);
        }
      }
    },
    [fetchRelatorios]
  );

  return (
    <>
      <div className="my-2 px-4 lg:px-6 max-w-[95rem] mx-auto w-full flex flex-col gap-4">
        <h3 className="text-4xl font-semibold">Relatórios</h3>
        <div className="flex justify-between flex-wrap gap-4 items-center">
          <div className="flex items-center gap-3 flex-wrap md:flex-nowrap"></div>
          <div className="flex flex-row gap-3.5 flex-wrap">
            <Button
              startContent={<PlusIcon />}
              color="primary"
              className="bg-blue-600 hover:bg-blue-700 text-white"
              onPress={handleNewRelatorio} // Chama a função para abrir a modal de adicionar
            >
              Adicionar Relatório
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
              data={relatorios} // Usa os dados filtrados
              columns={columns}
              headers={headers}
              onEdit={handleEditRelatorio}
              onView={handleView}
              onDelete={handleDeleteRelatorio}
              columnConfig={{
                data_criacao: (item) =>
                  item.data_criacao
                    ? new Date(item.data_criacao).toLocaleDateString()
                    : "Data não disponível",
                estado: (item) => (item.estado ? "Ativo" : "Inativo"),
              }}
            />
          )}
        </div>
        {viewingRelatorio && (
        <VisualizarRelatorioModal
          isOpen={isViewing}
          onClose={() => setIsViewing(false)}
          relatorio={viewingRelatorio}
        />
      )}
        <AddRelatorio
          title={"Relatório"}
          editingRelatorio={editingRelatorio}
          onCloseAndRefresh={fetchRelatorios}
          isOpen={isOpen}
          onOpenChange={onOpenChange}
        />
      </div>
    </>
  );
};

export default Relatorios;
