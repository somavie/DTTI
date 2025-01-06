"use client";

import React, { useState, useEffect, useCallback } from "react";
import { CardDashboard } from "./CardDashboard";
import { Spinner } from "@nextui-org/react";
import ObservacaoForm from "../observacao/add-observacao";
import { useToast } from "@/hooks/use-toast"
import { Toaster } from "@/components/ui/toaster"
import api from "@/helpers/api";
import { Observacao } from "@/helpers/types";
import { IndividualRadioChart } from "../charts/IndividualRadioChart";
import { GroupEntityChart } from "../charts/GroupEntityChart";
import { OverallGroupChart } from "../charts/OverallGroupChart";

export const Content: React.FC = () => {
  const [loading, setLoading] = useState<boolean>(true);
  const [observacoes, setObservacoes] = useState<Observacao[]>([]);
  const { toast } = useToast()

  useEffect(() => {
    const timer = setTimeout(() => {
      setLoading(false);
    }, 2000);

    return () => clearTimeout(timer);
  }, []);

  const cadastrarObservacaoSemRelatorio = useCallback(async () => {
    try {
      await Promise.all(
        observacoes.map((observacao) => {
          return api.post("/observacoes", {
            ...observacao,
            relatorios_id: null
          });
        })
      );
      toast({
        title: 'Sucesso!',
        description: 'Dados registrados com sucesso.',
        duration: 3000,
      })
      setObservacoes([]);
    } catch (error) {
      console.error('Erro ao registrar dados:', error)
      toast({
        title: 'Erro',
        description: 'Ocorreu um erro ao registrar os dados. Por favor, tente novamente.',
        duration: 5000,
        variant: 'destructive',
      })
    }
  }, [observacoes, toast]);

  return (
    <div className="w-full min-h-screen bg-background p-4 md:p-6">
      <div className="space-y-6 md:space-y-8">
        <div className="w-full bg-background shadow-md dark:shadow-none rounded-lg p-4 md:p-6">
          <CardDashboard />
        </div>

        <div className="grid md:grid-cols-2 gap-6 md:gap-8">
          <div className="bg-background shadow-md dark:shadow-none rounded-lg p-4 md:p-6 overflow-x-auto">
            {loading ? (
              <div className="w-full h-[400px] flex items-center justify-center">
                <Spinner size="lg" label="Carregando gráfico..." />
              </div>
            ) : (
              <IndividualRadioChart />
            )}
          </div>

          <div className="bg-background shadow-md dark:shadow-none rounded-lg p-4 md:p-6 overflow-x-auto">
            {loading ? (
              <div className="w-full h-[400px] flex items-center justify-center">
                <Spinner size="lg" label="Carregando gráfico..." />
              </div>
            ) : (
              <GroupEntityChart />
            )}
          </div>
        </div>

        <div className="w-full bg-background shadow-md dark:shadow-none rounded-lg p-4 md:p-6 overflow-x-auto">
          {loading ? (
            <div className="w-full h-[400px] flex items-center justify-center">
              <Spinner size="lg" label="Carregando gráfico..." />
            </div>
          ) : (
            <OverallGroupChart />
          )}
        </div>

        <div className="bg-background shadow-md dark:shadow-none rounded-lg p-4 md:p-6">
          {loading ? (
            <div className="w-full h-[400px] flex items-center justify-center">
              <Spinner size="lg" label="Carregando form..." />
            </div>
          ) : (
            <>
              <ObservacaoForm 
                observacoes={observacoes} 
                setObservacoes={setObservacoes} 
                onCadastrar={cadastrarObservacaoSemRelatorio}
                showCadastrarButton={true}
              />
              <Toaster />
            </>
          )}
        </div>
      </div>
    </div>
  );
};

