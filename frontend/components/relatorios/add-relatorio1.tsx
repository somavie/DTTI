"use client";
import { useState } from "react";
import { useForm } from "react-hook-form";
import api from "@/helpers/api";
import ObservacaoForm from "../observacao/add-observacao";
import EquipamentoForm from "../equipamento/add-equipamento";
import gerarPDF from "../pdf/relatorioPDF";
import { Equipamento, TecnicoType } from "@/helpers/types";
import { Button, Select, SelectItem } from "@nextui-org/react";
import { useFetchData } from "../hooks/useFetchDatas";
import { useUserData } from "../hooks/useUserData";
interface RelatorioFormData {
  observacao_final: string;
  tecnico_cessante_id: number;
  tecnico_entrante_id: number;
}

interface CreateEquipamentoInput {
  relatorios_id: number;
  quantidade: number;
  status: string;
  localizacao: string | null; // Pode ser string ou null
}

export default function RelatorioForm() {
  const { register, handleSubmit, setValue, watch } =
    useForm<RelatorioFormData>();
  const [relatorioId, setRelatorioId] = useState<number | null>(null);
  const [observacoes, setObservacoes] = useState<
    { situacao_id: number; descricao: string }[]
  >([]);
  const [equipamentos, setEquipamentos] = useState<Equipamento[]>([]);
  const [isFinalStep, setIsFinalStep] = useState(false);
  const { id: TecnicoId, userName } = useUserData();
  const { data: tecnicos, loading: loadingTecnicos } =
    useFetchData<TecnicoType>("/tecnicos"); // Buscando técnicos
  // Função para criar o relatório ao clicar no botão "Fazer Relatório"
  const criarRelatorio = async () => {
    try {
      const response = await api.post("/relatorios");
      setRelatorioId(response.data.id); // Armazena o ID do relatório criado
      alert("Relatório criado com sucesso!");
    } catch (error) {
      console.error("Erro ao criar o relatório:", error);
    }
  };

  // Salva as observações e equipamentos relacionados ao relatório
  const salvarDadosRelacionados = async () => {
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
          const equipamentoData: CreateEquipamentoInput = {
            ...equipamento,
            relatorios_id: relatorioId!,
          };
          return api.post("/equipamento", equipamentoData);
        })
      );
    } catch (error) {
      console.error("Erro ao salvar observações ou equipamentos:", error);
    }
  };

  // Função chamada ao submeter o formulário final
  const onSubmitFinalizar = async (data: RelatorioFormData) => {
    const { tecnico_cessante_id, tecnico_entrante_id, observacao_final } = data;

    // Preparar o objeto de dados de atualização
    const updateData = {
      tecnico_cessante_id: tecnico_cessante_id
        ? Number(tecnico_cessante_id)
        : undefined,
      tecnico_entrante_id: tecnico_entrante_id
        ? Number(tecnico_entrante_id)
        : undefined,
      data_criacao: new Date(), // Data de criação será a data atual
      observacoes_finais: observacao_final
        ? String(observacao_final)
        : undefined,
    };

    try {
      // Atualiza o relatório com os dados do técnico e observação final
      await api.put(`/relatorios/${relatorioId}`, updateData);

      // Salva os dados relacionados (observações e equipamentos)
      await salvarDadosRelacionados();
      if (relatorioId === null) {
        console.error("Erro: relatorioId não pode ser nulo.");
        return; // Ou exiba uma mensagem de erro para o usuário
      }

      try {
        await gerarPDF(relatorioId); // Agora, relatorioId é garantidamente um número
      } catch (error) {
        console.error("Erro ao gerar PDF:", error);
      }
      alert("Relatório salvo e PDF gerado com sucesso!");
    } catch (error) {
      console.error("Erro ao finalizar o relatório:", error);
    }
  };

  return (
    <div className="container mx-auto p-6">
      <h1 className="text-xl font-bold mb-4">
        Relatório de Equipamentos e Ocorrências de {userName}
      </h1>

      {/* Botão para criar o relatório */}
      {!relatorioId && (
        <button
          className="bg-green-500 text-white p-2 mb-6"
          onClick={criarRelatorio}
        >
          Fazer Relatório 
        </button>
      )}

      {/* Exibe o formulário e passos após a criação do relatório */}
      {relatorioId && !isFinalStep && (
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

      {/* Etapa final - Formulário para dados finais */}
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
            <Select
              label="Técnico Cessante"
              isDisabled
              selectedKeys={new Set([String(TecnicoId)])}
              onSelectionChange={(keys) =>
                setValue("tecnico_cessante_id", Number(keys.currentKey))
              }
            >
              {tecnicos.map((tecnico) => (
                <SelectItem key={tecnico.id}>{tecnico.nome}</SelectItem>
              ))}
            </Select>
          </div>

          <div className="mb-4">
            <label className="block mb-2">Técnico Entrante:</label>
            <Select
              label="Técnico Entrante"
              selectedKeys={new Set([String(watch("tecnico_entrante_id"))])}
              onSelectionChange={(keys) =>
                setValue("tecnico_entrante_id", Number(keys.currentKey))
              }
            >
              {tecnicos.map((tecnico) => (
                <SelectItem key={tecnico.id}>{tecnico.nome}</SelectItem>
              ))}
            </Select>
          </div>

          <button className="bg-blue-500 text-white p-2" type="submit">
            Finalizar Relatório e Gerar PDF
          </button>
        </form>
      )}
    </div>
  );
}
