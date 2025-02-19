"use client";

import React, { useCallback, useEffect, useState } from "react";
import { Button, Input, Spinner } from "@nextui-org/react";
import api from "../../helpers/api";
import { AddServico } from "./add-servico";
import { PlusIcon } from "../icons/plus-icon";
import { TableWrapper } from "../tableDinamica/table";
import { useDisclosure } from "@nextui-org/react";

export const Servico = () => {
    const [servicos, setServicos] = useState<ServicoType[]>([]);
    const [allServicos, setAllServicos] = useState<ServicoType[]>([]);
    const [loading, setLoading] = useState<boolean>(true);
    const [error, setError] = useState<string | null>(null);
    const [editingServico, setEditingServico] = useState<ServicoType | null>(null);
    const { isOpen, onOpen, onOpenChange } = useDisclosure();

    const columns = ["id", "nome", "estado"];
    const headers = ["ID", "Nome", "EstDO"];

    
    const fetchServicos = useCallback(async () => {
        try {
            const response = await api.get<ServicoType[]>("/situacoes");
            setServicos(response.data);
            setAllServicos(response.data);
        } catch (error) {
            setError("Erro ao buscar serviços");
        } finally {
            setLoading(false);
        }
    }, []);

    useEffect(() => {
        fetchServicos();
    }, [fetchServicos]);

    const handleEditServico = useCallback(
        (servico: ServicoType) => {
            setEditingServico(servico);
            onOpen();
        },
        [onOpen]
    );

    const handleNewServico = useCallback(() => {
        setEditingServico(null);
        onOpen();
    }, [onOpen]);

    const handleDeleteServico = useCallback(
        async (id: number) => {
            if (confirm("Tem certeza que deseja eliminar este serviço?")) {
                try {
                    await api.delete(`/servicos/${id}`);
                    fetchServicos();
                } catch (error) {
                    console.error("Erro ao excluir serviço:", error);
                }
            }
        },
        [fetchServicos]
    );

    const handleFilteredData = (filteredData: ServicoType[]) => {
        setServicos(filteredData);
    };

    return (
        <>
            <div className="my-2 px-4 lg:px-6 max-w-[95rem] mx-auto w-full flex flex-col gap-4">
                <h3 className="text-4xl font-semibold">Serviços</h3>
                <div className="flex justify-between flex-wrap gap-4 items-center">
                    <div className="flex items-center gap-3 flex-wrap md:flex-nowrap"></div>
                    <div className="flex flex-row gap-3.5 flex-wrap">
                        <Button
                            startContent={<PlusIcon />}
                            color="primary"
                            className="bg-blue-600 hover:bg-blue-700 text-white"
                            onPress={handleNewServico}
                        >
                            Adicionar Serviço
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
                            data={servicos}
                            columns={columns}
                            headers={headers}
                            onEdit={handleEditServico}
                            onDelete={handleDeleteServico}
                        />
                    )}
                </div>
                <AddServico
                    editingServico={editingServico}
                    onCloseAndRefresh={fetchServicos}
                    isOpen={isOpen}
                    onOpenChange={onOpenChange}
                />
            </div>
        </>
    );
};

export interface ServicoType {
    id: number;
    nome: string;
    estado?: boolean;
    operacionabilidade?: number;
  }

export default Servico;