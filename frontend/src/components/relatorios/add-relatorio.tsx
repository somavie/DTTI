"use client";
import { useState } from "react";
import { useForm } from "react-hook-form";
import api from "@/helpers/api";
import ObservacaoForm from "../observacao/add-observacao";
import EquipamentoForm from "../equipamento/add-equipamento";
import gerarPDF from "../pdf/relatorioPDF";

interface RelatorioFormData {
  observacao_final: string;
  tecnico_cessante_id: number;
  tecnico_entrante_id: number;
}

export default function RelatorioForm() {
  const { register, handleSubmit } = useForm<RelatorioFormData>();
  const [relatorioId, setRelatorioId] = useState<number | null>(null);
  const [observacoes, setObservacoes] = useState<
    { situacao_id: number; descricao: string }[]
  >([]);
  const [equipamentos, setEquipamentos] = useState<
    { equipamento_id: number; quantidade: number; status: string }[]
  >([]);
  const [isFinalStep, setIsFinalStep] = useState(false);

  // Verifica se o relatório já foi criado ou cria um novo
  const verificarCriarRelatorio = async () => {
    if (!relatorioId) {
      try {
        const response = await api.post("/relatorios", {});
        setRelatorioId(response.data.id);
      } catch (error) {
        console.error("Erro ao criar o relatório:", error);
      }
    }
  };

  // Salva as observações e equipamentos relacionados ao relatório
  const salvarDadosRelacionados = async () => {
    if (!relatorioId) {
      await verificarCriarRelatorio();
    }

    try {
      // Salva as observações
      await Promise.all(
        observacoes.map((observacao) => {
          const observacaoData = { ...observacao, relatorios_id: relatorioId };
          return api.post("/observacoes", observacaoData);
        })
      );

      // Salva os equipamentos
      await Promise.all(
        equipamentos.map((equipamento) => {
          const equipamentoData = {
            ...equipamento,
            relatorios_id: relatorioId,
          };
          return api.post("/equipamentos", equipamentoData);
        })
      );
    } catch (error) {
      console.error("Erro ao salvar observações ou equipamentos:", error);
    }
  };

  // Função chamada ao submeter o formulário final
  const onSubmitFinalizar = async (data: RelatorioFormData) => {
    const finalData = {
      ...data,
      relatorios_id: relatorioId,
    };

    try {
      await api.put(`/relatorios/${relatorioId}`, finalData);
      await salvarDadosRelacionados();
      gerarPDF(observacoes, equipamentos);
      alert("Relatório salvo e PDF gerado com sucesso!");
    } catch (error) {
      console.error("Erro ao finalizar o relatório:", error);
    }
  };

  return (
    <div className="container mx-auto p-6">
      <h1 className="text-xl font-bold mb-4">
        Relatório de Equipamentos e Ocorrências
      </h1>

      {!isFinalStep && (
        <>
          <ObservacaoForm
            observacoes={observacoes}
            setObservacoes={setObservacoes}
          />
          <EquipamentoForm
            equipamentos={equipamentos}
            setEquipamentos={setEquipamentos}
          />
          <button
            className="bg-yellow-500 text-white p-2 mt-6"
            onClick={() => setIsFinalStep(true)}
          >
            Prosseguir para Técnicos
          </button>
        </>
      )}

      {isFinalStep && (
        <form onSubmit={handleSubmit(onSubmitFinalizar)}>
          <div className="mb-4">
            <label className="block mb-2">Observação Final:</label>
            <textarea
              className="border p-2 w-full"
              {...register("observacao_final")}
            ></textarea>
          </div>

          <div className="mb-4">
            <label className="block mb-2">Técnico Cessante:</label>
            <input
              type="number"
              className="border p-2 w-full"
              {...register("tecnico_cessante_id")}
            />
          </div>

          <div className="mb-4">
            <label className="block mb-2">Técnico Entrante:</label>
            <input
              type="number"
              className="border p-2 w-full"
              {...register("tecnico_entrante_id")}
            />
          </div>

          <button className="bg-blue-500 text-white p-2" type="submit">
            Finalizar Relatório e Gerar PDF
          </button>
        </form>
      )}
    </div>
  );
}
