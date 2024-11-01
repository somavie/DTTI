"use client"

import { useEffect, useState } from "react"
import { useForm } from "react-hook-form"
import api from "@/helpers/api"
import ObservacaoForm from "../observacao/add-observacao"
import EquipamentoForm from "../equipamento/add-equipamento"
import gerarPDF from "../pdf/relatorioPDF"
import { Equipamento, TecnicoType } from "@/helpers/types"
import { Button, Select, SelectItem, Textarea, Card, CardBody, CardHeader, Spacer, Progress } from "@nextui-org/react"
import { useFetchData } from "../hooks/useFetchDatas"
import { useUserData } from "../hooks/useUserData"

interface RelatorioFormData {
  observacao_final: string
  tecnico_cessante_id: number
  tecnico_entrante_id: number
}

interface CreateEquipamentoInput {
  relatorios_id: number
  quantidade: number
  status: string
  localizacao: string | null
}

export default function RelatorioForm() {
  const { register, handleSubmit, setValue, watch } = useForm<RelatorioFormData>()
  const [observacoes, setObservacoes] = useState<{ situacao_id: number; descricao: string }[]>([])
  const [equipamentos, setEquipamentos] = useState<Equipamento[]>([])
  const [currentStep, setCurrentStep] = useState(1)
  const { id: TecnicoId, userName } = useUserData()
  const { data: tecnicos, loading: loadingTecnicos } = useFetchData<TecnicoType>("/tecnicos")

  useEffect(() => {
    if (TecnicoId) {
      setValue("tecnico_cessante_id", TecnicoId)
    }
  }, [TecnicoId, setValue])

  const criarRelatorio = async (data: RelatorioFormData) => {
    const { tecnico_cessante_id, tecnico_entrante_id, observacao_final } = data
    try {
      const response = await api.post("/relatorios/add", {
        tecnico_cessante_id: Number(tecnico_cessante_id),
        tecnico_entrante_id: Number(tecnico_entrante_id),
        data_criacao: new Date(),
        observacoes_finais: observacao_final || undefined,
      })
      const relatorioId = response.data.id

      await Promise.all(
        observacoes.map((observacao) => {
          const observacaoData = { ...observacao, relatorios_id: relatorioId }
          return api.post("/observacoes", observacaoData)
        })
      )

      await Promise.all(
        equipamentos.map((equipamento) => {
          const equipamentoData: CreateEquipamentoInput = {
            ...equipamento,
            relatorios_id: relatorioId,
          }
          return api.post("/equipamento", equipamentoData)
        })
      )

      await gerarPDF(relatorioId)
      alert("Relatório salvo e PDF gerado com sucesso!")
    } catch (error) {
      console.error("Erro ao finalizar o relatório:", error)
    }
  }

  const onSubmitFinalizar = (data: RelatorioFormData) => {
    criarRelatorio(data)
  }

  const nextStep = () => {
    setCurrentStep((prev) => Math.min(prev + 1, 3))
  }

  const prevStep = () => {
    setCurrentStep((prev) => Math.max(prev - 1, 1))
  }

  return (
    <div className="max-w-[1024px] mx-auto px-4 sm:px-6 lg:px-8">
      <Card className="mt-8">
        <CardHeader>
          <h1 className="text-2xl font-bold">Relatório de Equipamentos e Ocorrências de {userName}</h1>
        </CardHeader>
        <CardBody>
          <Progress
            aria-label="Progresso do formulário"
            value={(currentStep / 3) * 100}
            className="mb-4"
          />
          {currentStep === 1 && (
            <>
              <h2 className="text-xl font-semibold mb-4">Passo 1: Observações</h2>
              <ObservacaoForm observacoes={observacoes} setObservacoes={setObservacoes} />
            </>
          )}

          {currentStep === 2 && (
            <>
              <h2 className="text-xl font-semibold mb-4">Passo 2: Equipamentos</h2>
              <EquipamentoForm equipamentos={equipamentos} setEquipamentos={setEquipamentos} />
            </>
          )}

          {currentStep === 3 && (
            <>
              <h2 className="text-xl font-semibold mb-4">Passo 3: Técnicos e Observação Final</h2>
              <form onSubmit={handleSubmit(onSubmitFinalizar)} className="space-y-4">
                <Textarea
                  label="Observação Final"
                  placeholder="Descreva a observação final"
                  {...register("observacao_final")}
                  minRows={4}
                />

                <Select
                  label="Técnico Cessante"
                  isDisabled
                  selectedKeys={new Set([String(TecnicoId)])}
                  onSelectionChange={(keys) => setValue("tecnico_cessante_id", Number(keys.currentKey))}
                >
                  {tecnicos?.map((tecnico) => (
                    <SelectItem key={tecnico.id} value={tecnico.id}>
                      {tecnico.nome}
                    </SelectItem>
                  ))}
                </Select>

                <Select
                  label="Técnico Entrante"
                  selectedKeys={new Set([String(watch("tecnico_entrante_id"))])}
                  onSelectionChange={(keys) => setValue("tecnico_entrante_id", Number(keys.currentKey))}
                >
                  {tecnicos?.map((tecnico) => (
                    <SelectItem key={tecnico.id} value={tecnico.id}>
                      {tecnico.nome}
                    </SelectItem>
                  ))}
                </Select>

                <Button type="submit" color="primary" className="w-full">
                  Finalizar Relatório e Gerar PDF
                </Button>
              </form>
            </>
          )}

          <Spacer y={4} />

          <div className="flex justify-between">
            <Button color="secondary" onClick={prevStep} isDisabled={currentStep === 1}>
              Voltar
            </Button>
            <Button color="secondary" onClick={nextStep} isDisabled={currentStep === 3}>
              Próximo
            </Button>
          </div>
        </CardBody>
      </Card>
    </div>
  )
}