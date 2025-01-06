"use client";

import React, { useEffect, useState } from "react";
import { Button, Spinner, Modal, Input } from "@nextui-org/react";
import api from "../../helpers/api";
import { TableWrapper } from "../tableDinamica/table";
import { AddGrupo } from "./add-grupo";
import { GrupoGrsType } from "@/helpers/types";
import { PlusIcon } from "../icons/plus-icon";

export const Grupo = () => {
  const [grupos, setGrupos] = useState<GrupoGrsType[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [isOpen, setIsOpen] = useState<boolean>(false);
  const [editingGrupo, setEditingGrupo] = useState<GrupoGrsType | null>(null);

  const fetchGrupos = async () => {
    try {
      const response = await api.get<GrupoGrsType[]>("/grupos");
      setGrupos(response.data);
    } catch (error) {
      console.error("Erro ao buscar grupos:", error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchGrupos();
  }, []);

  const handleAdd = () => {
    setEditingGrupo(null);
    setIsOpen(true);
  };

  const handleEdit = (grupo: GrupoGrsType) => {
    setEditingGrupo(grupo);
    setIsOpen(true);
  };

  const handleDelete = async (id: number) => {
    try {
      await api.delete(`/grupos/${id}`);
      setGrupos((prev) => prev.filter((s) => s.id !== id));
    } catch (error) {
      console.error("Erro ao excluir grupo:", error);
    }
  };

  const columns = ["id", "nome", "qtds"];
  const headers = ["ID", "Nome", "Quantidades"];

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
              className="bg-blue-600 hover:bg-blue-700 text-white mb-0"
              onPress={handleAdd}
            >
              Adicionar Grupo
            </Button>
          </div>
        </div>
        {loading ? (
          <Spinner size="lg" label="Carregando..." />
        ) : (
          <TableWrapper
            data={grupos}
            columns={columns}
            headers={headers}
            onEdit={handleEdit}
            onDelete={handleDelete}
          />
        )}

        <Modal isOpen={isOpen} onOpenChange={setIsOpen}>
          <AddGrupo
            editingGrupo={editingGrupo}
            onCloseAndRefresh={fetchGrupos}
            isOpen={isOpen}
            onOpenChange={setIsOpen}
          />
        </Modal>
      </div>
    </>
  );
};

export default Grupo;
