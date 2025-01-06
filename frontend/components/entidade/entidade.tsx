"use client";

import { Button, Spinner } from "@nextui-org/react";
import { useCallback, useEffect, useState } from "react";
import { TableWrapper } from "@/components/tableDinamica/table";
import api from "../../helpers/api";
import { EntidadeType } from "@/helpers/types";
import { EntidadeForm } from "./entidade-form";
import { ViewEntidadeModal } from "./view-entidade";
import { useDisclosure } from "@nextui-org/react";
import { PlusIcon } from "../icons/plus-icon";

export const Entidade = () => {
  const [entidades, setEntidades] = useState<EntidadeType[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);
  const [editingEntidade, setEditingEntidade] = useState<EntidadeType | null>(null);
  const [selectedEntidade, setSelectedEntidade] = useState<EntidadeType | null>(null);
  const { isOpen, onOpen, onOpenChange } = useDisclosure();
  const { 
    isOpen: isViewOpen, 
    onOpen: onViewOpen, 
    onOpenChange: onViewOpenChange 
  } = useDisclosure();

  const fetchEntidades = useCallback(async () => {
    try {
      const response = await api.get("/entidades");
      setEntidades(response.data);
    } catch (err) {
      setError("Failed to fetch entidades");
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    fetchEntidades();
  }, [fetchEntidades]);

  const handleEditEntidade = useCallback(
    (entidade: EntidadeType) => {
      setEditingEntidade(entidade);
      onOpen();
    },
    [onOpen]
  );

  const handleViewEntidade = useCallback(
    (entidade: EntidadeType) => {
      setSelectedEntidade(entidade);
      onViewOpen();
    },
    [onViewOpen]
  );

  const handleNewEntidade = useCallback(() => {
    setEditingEntidade(null);
    onOpen();
  }, [onOpen]);

  const handleDeleteEntidade = useCallback(
    async (id: number) => {
      if (confirm("Tem certeza que deseja eliminar esta entidade?")) {
        try {
          await api.delete(`/entidades/${id}`);
          fetchEntidades();
        } catch (error) {
          console.error("Erro ao eliminar entidade:", error);
        }
      }
    },
    [fetchEntidades]
  );

  const columns = ["id", "nome", "indicativo", "grupo_nome", "radio_nome"];
  const headers = ["ID", "Nome", "Indicativo", "Grupo","Radio"];

  return (
    <>
      <div className="my-2 px-4 lg:px-6 max-w-[95rem] mx-auto w-full flex flex-col gap-4">
        <h3 className="text-4xl font-semibold">Entidades</h3>
        <div className="flex justify-between flex-wrap gap-4 items-center">
          <div className="flex items-center gap-3 flex-wrap md:flex-nowrap"></div>
          <div className="flex flex-row gap-3.5 flex-wrap">
            <Button
              startContent={<PlusIcon />}
              color="primary"
              className="bg-blue-600 hover:bg-blue-700 text-white"
              onPress={handleNewEntidade}
            >
              Adicionar Entidade
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
              data={entidades}
              columns={columns}
              headers={headers}
              onEdit={handleEditEntidade}
              onDelete={handleDeleteEntidade}
              onView={handleViewEntidade}
            />
          )}
        </div>

        <EntidadeForm
          editingEntidade={editingEntidade}
          onCloseAndRefresh={fetchEntidades}
          isOpen={isOpen}
          onOpenChange={onOpenChange}
        />

        {selectedEntidade && (
          <ViewEntidadeModal
            entidade={selectedEntidade}
            isOpen={isViewOpen}
            onClose={onViewOpenChange}
            onCloseAndRefresh={fetchEntidades}
          />
        )}
      </div>
    </>
  );
};

export default Entidade;

