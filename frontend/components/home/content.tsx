"use client";

import React, { useState, useEffect } from "react";
import { CardDashboard } from "../home/CardDashboard";
import { Spinner, Button } from "@nextui-org/react";
import GraficoRadiosOnline from "../grupos_grs/graficoEstabilidade";
import ObservacaoForm from "../observacao/add-observacao";
import { useToast } from "@/hooks/use-toast"
import { Toaster } from "@/components/ui/toaster"
import api from "@/helpers/api";  // Supondo que você tenha um helper para requisições API
import { Observacao } from "@/helpers/types";

export const Content = () => {
  const [loading, setLoading] = useState<boolean>(true);
  const [observacoes, setObservacoes] = useState<Observacao[]>([]);
  const { toast } = useToast()

  useEffect(() => {
    setTimeout(() => {
      setLoading(false);
    }, 2000);
  }, []);

  // Função para cadastrar observações sem relatório
  const cadastrarObservacaoSemRelatorio = async () => {
    try {
      await Promise.all(
        observacoes.map((observacao) => {
          return api.post("/observacoes", {
            ...observacao,
            relatorios_id: null  // Define o `relatorios_id` como null
          });
        })
      );
      toast({
        title: 'Sucesso!',
        description: 'Dados registrados com sucesso.',
        duration: 3000,
      })
    } catch (error) {
      console.error('Erro ao registrar dados:', error)
      toast({
        title: 'Erro',
        description: 'Ocorreu um erro ao registrar os dados. Por favor, tente novamente.',
        duration: 5000,
        variant: 'destructive',
      })
    }
  };

  return (
    <div className="w-full min-h-screen bg-background p-6">
      <div className="space-y-8">
        <div className="w-full bg-background shadow-md dark:shadow-none rounded-lg p-6">
          <CardDashboard />
        </div>

        <div className="grid md:grid-cols-2 gap-8">
          <div className="bg-background shadow-md dark:shadow-none rounded-lg p-6">
            <h2 className="text-xl font-semibold mb-4">Porcentagem de Rádios Online por Grupo</h2>
            <div className="w-full h-[400px]">
              {loading ? (
                <div className="w-full h-full flex items-center justify-center">
                  <Spinner size="lg" label="Carregando gráfico..." />
                </div>
              ) : (
                <GraficoRadiosOnline />
              )}
            </div>
          </div>

          <div className="bg-background shadow-md dark:shadow-none rounded-lg p-6">
            {loading ? (
              <div className="w-full h-full flex items-center justify-center">
              <Spinner size="lg" label="Carregando form..." />
              </div>
             ) : (<>
              <ObservacaoForm 
                observacoes={observacoes} 
                setObservacoes={setObservacoes} 
                onCadastrar={cadastrarObservacaoSemRelatorio}
                showCadastrarButton={true}
              />
              <Toaster />
               </>)
            }
            
          </div>
        </div>
      </div>
    </div>
  );
};
