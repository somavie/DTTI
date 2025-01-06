"use client";

import { Button, Spinner } from "@nextui-org/react";
import { useCallback, useEffect, useState } from "react";
import { TableWrapper } from "@/components/tableDinamica/table";
import api from "../../helpers/api";
import { RadioType } from "@/helpers/types";
import { RadioForm } from "./radio-form";
import { ViewRadioModal } from "./radio-view";
import { useDisclosure } from "@nextui-org/react";
import { PlusIcon } from "../icons/plus-icon";

export const Radio = () => {
  const [radios, setRadios] = useState<RadioType[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);
  const [editingRadio, setEditingRadio] = useState<RadioType | null>(null);
  const [selectedRadio, setSelectedRadio] = useState<RadioType | null>(null);
  const { isOpen, onOpen, onOpenChange } = useDisclosure();
  const { 
    isOpen: isViewOpen, 
    onOpen: onViewOpen, 
    onOpenChange: onViewOpenChange 
  } = useDisclosure();

  const fetchRadios = useCallback(async () => {
    try {
      const response = await api.get("/radios");
      setRadios(response.data);
    } catch (err) {
      setError("Failed to fetch radios");
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    fetchRadios();
  }, [fetchRadios]);

  const handleEditRadio = useCallback(
    (radio: RadioType) => {
      setEditingRadio(radio);
      onOpen();
    },
    [onOpen]
  );

  const handleViewRadio = useCallback(
    (radio: RadioType) => {
      setSelectedRadio(radio);
      onViewOpen();
    },
    [onViewOpen]
  );

  const handleNewRadio = useCallback(() => {
    setEditingRadio(null);
    onOpen();
  }, [onOpen]);

  const handleDeleteRadio = useCallback(
    async (id: number) => {
      if (confirm("Tem certeza que deseja eliminar este rádio?")) {
        try {
          await api.delete(`/radios/${id}`);
          fetchRadios();
        } catch (error) {
          console.error("Erro ao eliminar rádio:", error);
        }
      }
    },
    [fetchRadios]
  );

  const columns = ["id", "numero_serie", "identificador", "situacao"];
  const headers = ["ID", "Número de Série", "Identificador", "Situação"];

  return (
    <>
      <div className="my-2 px-4 lg:px-6 max-w-[95rem] mx-auto w-full flex flex-col gap-4">
        <h3 className="text-4xl font-semibold">Rádios</h3>
        <div className="flex justify-between flex-wrap gap-4 items-center">
          <div className="flex items-center gap-3 flex-wrap md:flex-nowrap"></div>
          <div className="flex flex-row gap-3.5 flex-wrap">
            <Button
              startContent={<PlusIcon />}
              color="primary"
              className="bg-blue-600 hover:bg-blue-700 text-white"
              onPress={handleNewRadio}
            >
              Adicionar Rádio
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
              data={radios}
              columns={columns}
              headers={headers}
              onEdit={handleEditRadio}
              onDelete={handleDeleteRadio}
              onView={handleViewRadio}
            />
          )}
        </div>

        <RadioForm
          editingRadio={editingRadio}
          onCloseAndRefresh={fetchRadios}
          isOpen={isOpen}
          onOpenChange={onOpenChange}
        />

        {selectedRadio && (
          <ViewRadioModal
            radio={selectedRadio}
            isOpen={isViewOpen}
            onClose={onViewOpenChange}
          />
        )}
      </div>
    </>
  );
};

export default Radio;

