"use client";

import { Button, Spinner } from "@nextui-org/react";
import { useCallback, useEffect, useState } from "react";
import { TableWrapper } from "@/components/tableDinamica/table";
import api from "../../helpers/api";
import { GrupoType } from "@/helpers/types";
import { GrupoForm } from "./grupo-form";
import { ViewGrupoModal } from "./view-grupo";
import { useDisclosure } from "@nextui-org/react";
import { PlusIcon } from "../icons/plus-icon";

export const Grupo = () => {
  const [grupos, setGrupos] = useState<GrupoType[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);
  const [editingGrupo, setEditingGrupo] = useState<GrupoType | null>(null);
  const [selectedGrupo, setSelectedGrupo] = useState<GrupoType | null>(null);
  const { isOpen, onOpen, onOpenChange } = useDisclosure();
  const { 
    isOpen: isViewOpen, 
    onOpen: onViewOpen, 
    onOpenChange: onViewOpenChange 
  } = useDisclosure();

  const fetchGrupos = useCallback(async () => {
    try {
      const response = await api.get("/grupo");
      setGrupos(response.data);
    } catch (err) {
      setError("Failed to fetch grupos");
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    fetchGrupos();
  }, [fetchGrupos]);

  const handleEditGrupo = useCallback(
    (grupo: GrupoType) => {
      setEditingGrupo(grupo);
      onOpen();
    },
    [onOpen]
  );

  const handleViewGrupo = useCallback(
    (grupo: GrupoType) => {
      setSelectedGrupo(grupo);
      onViewOpen();
    },
    [onViewOpen]
  );

  const handleNewGrupo = useCallback(() => {
    setEditingGrupo(null);
    onOpen();
  }, [onOpen]);

  const handleDeleteGrupo = useCallback(
    async (id: number) => {
      if (confirm("Tem certeza que deseja eliminar este grupo?")) {
        try {
          await api.delete(`/grupos/${id}`);
          fetchGrupos();
        } catch (error) {
          console.error("Erro ao eliminar grupo:", error);
        }
      }
    },
    [fetchGrupos]
  );

  const columns = ["id", "nome", "codname"];
  const headers = ["ID", "Nome", "Codname"];

  return (
    <>
      <div className="my-2 px-4 lg:px-6 max-w-[95rem] mx-auto w-full flex flex-col gap-4">
        <h3 className="text-4xl font-semibold">Grupos</h3>
        <div className="flex justify-between flex-wrap gap-4 items-center">
          <div className="flex items-center gap-3 flex-wrap md:flex-nowrap"></div>
          <div className="flex flex-row gap-3.5 flex-wrap">
            <Button
              startContent={<PlusIcon />}
              color="primary"
              className="bg-blue-600 hover:bg-blue-700 text-white"
              onPress={handleNewGrupo}
            >
              Adicionar Grupo
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
              data={grupos}
              columns={columns}
              headers={headers}
              onEdit={handleEditGrupo}
              onDelete={handleDeleteGrupo}
              onView={handleViewGrupo}
            />
          )}
        </div>

        <GrupoForm
          editingGrupo={editingGrupo}
          onCloseAndRefresh={fetchGrupos}
          isOpen={isOpen}
          onOpenChange={onOpenChange}
        />

        {selectedGrupo && (
          <ViewGrupoModal
            grupo={selectedGrupo}
            isOpen={isViewOpen}
            onClose={onViewOpenChange}
          />
        )}
      </div>
    </>
  );
};

export default Grupo;

