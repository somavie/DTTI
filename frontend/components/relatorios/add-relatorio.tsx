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
import { SituacoesCard } from "../servicos/servicoToggleCard"
import { ServicoType } from "../servicos/servico"
import { Formik, Form, Field, ErrorMessage } from "formik";
import { radioRelatorioValidationSchema } from "@/helpers/schemas"

interface RelatorioFormData {
  observacao_final: string
  tecnico_cessante_id: number
  tecnico_entrante_id: number
  totalRadios: number
  radiosActivos: number
  gruposMaisActivos: string
}

interface CreateEquipamentoInput {
  relatorios_id: number
  quantidade: number
  status: string
  localizacao: string | null
}

export default function RelatorioForm() {
  const { register, handleSubmit, setValue, watch } = useForm<RelatorioFormData>()
  const [observacoes, setObservacoes] = useState<{id: number; situacao_id: number; descricao: string }[]>([])
  const [equipamentos, setEquipamentos] = useState<Equipamento[]>([])
  const [situacoes, setSituacoes] = useState<ServicoType[]>([])
  const [loadingSituacoes, setLoadingSituacoes] = useState<boolean>(true)
  const [currentStep, setCurrentStep] = useState(1)
  const { id: TecnicoId, userName } = useUserData()
  const { data: tecnicos, loading: loadingTecnicos } = useFetchData<TecnicoType>("/tecnicos")

  useEffect(() => {
    const carregarObservacoesSemRelatorio = async () => {
      try {
        const response = await api.get("/observacoes/relatorios_id=null")
        setObservacoes(response.data)
      } catch (error) {
        console.error("Erro ao carregar observações:", error)
      }
    }
    carregarObservacoesSemRelatorio()
  }, [])
  useEffect(() => {
    if (TecnicoId) {
      setValue("tecnico_cessante_id", TecnicoId)
    }
  }, [TecnicoId, setValue])

  useEffect(() => {
    const fetchSituacoes = async () => {
      try {
        const response = await api.get<ServicoType[]>("/situacoes")
        setSituacoes(response.data)
      } catch (error) {
        console.error("Erro ao buscar situações:", error)
      } finally {
        setLoadingSituacoes(false)
      }
    }

    fetchSituacoes()
  }, [])

  const criarRelatorio = async (data: RelatorioFormData) => {
    const { tecnico_cessante_id, tecnico_entrante_id, observacao_final } = data;
    try {
      const response = await api.post("/relatorios/add", {
        tecnico_cessante_id: Number(tecnico_cessante_id),
        tecnico_entrante_id: Number(tecnico_entrante_id),
        data_criacao: new Date(),
        observacoes_finais: observacao_final || undefined,
      });
      const relatorioId = response.data.id;
  
      await Promise.all(
        observacoes.map((observacao) => {
          if (observacao.id) {
            // Atualizar observação existente
            return api.patch(`/observacoes/${observacao.id}`, {
              ...observacao,
              relatorios_id: relatorioId,
            });
          } else {
            // Criar nova observação
            return api.post("/observacoes", {
              ...observacao,
              relatorios_id: relatorioId,
            });
          }
        })
      );
  
      await Promise.all(
        equipamentos.map((equipamento) => {
          const equipamentoData: CreateEquipamentoInput = {
            ...equipamento,
            relatorios_id: relatorioId,
          };
          return api.post("/equipamento", equipamentoData);
        })
      );
  
      await gerarPDF(relatorioId);
      alert("Relatório salvo e PDF gerado com sucesso!");
    } catch (error) {
      //adicionar o delete do relatoriom em caso de falha
      console.error("Erro ao finalizar o relatório:", error);
      alert("Erro ao finalizar o relatório. Tente novamente.");
    }
  };
  

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
            classNames={{indicator: "bg-blue-500",}}
          />
          {currentStep === 1 && (
            <>
              <h2 className="text-xl font-semibold mb-4">Passo 1: Ocorrências</h2>
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
              <SituacoesCard initialSituacoes={situacoes}></SituacoesCard>
              <Formik
                initialValues={{ 
                  totalRadios: 0, 
                  radiosActivos: 0, 
                  gruposMaisActivos: "", 
                  observacao_final: "", 
                  tecnico_cessante_id: Number(TecnicoId), 
                  tecnico_entrante_id: 0 
                }}
                validationSchema={radioRelatorioValidationSchema}
                onSubmit={(values, { setSubmitting }) => {
                  onSubmitFinalizar(values);
                  setSubmitting(false);
                }}
              >
                {({ isSubmitting, setFieldValue, values }) => (
                  <Form className="space-y-4">
                    <div>
                      <label htmlFor="totalRadios">Total de Radios</label>
                      <Field type="number" name="totalRadios" />
                      <ErrorMessage name="totalRadios" component="div" className="text-red-500" />
                    </div>

                    <div>
                      <label htmlFor="radiosActivos">Radios Activos</label>
                      <Field type="number" name="radiosActivos" />
                      <ErrorMessage name="radiosActivos" component="div" className="text-red-500" />
                    </div>

                    <div>
                      <label htmlFor="gruposMaisActivos">Grupos mais activos</label>
                      <Field type="text" name="gruposMaisActivos" />
                      <ErrorMessage name="gruposMaisActivos" component="div" className="text-red-500" />
                    </div>

                    <div>
                      <label htmlFor="observacao_final">Observação Final</label>
                      <Field as="textarea" name="observacao_final" placeholder="Descreva a observação final" minRows={4} />
                      <ErrorMessage name="observacao_final" component="div" className="text-red-500" />
                    </div>
                    <div>
                      <div>
                        <label htmlFor="tecnico_cessante_id">Técnico Cessante</label>
                        <Select
                          isDisabled
                          selectedKeys={new Set([values.tecnico_cessante_id])}
                          onSelectionChange={(keys) => setFieldValue("tecnico_cessante_id", keys.currentKey)}
                        >
                          {tecnicos?.map((tecnico) => (
                            <SelectItem key={tecnico.id} value={tecnico.id}>
                              {tecnico.nome}
                            </SelectItem>
                          ))}
                        </Select>
                      </div>

                      <div>
                        <label htmlFor="tecnico_entrante_id">Técnico Entrante</label>
                        <Select
                          selectedKeys={new Set([values.tecnico_entrante_id])}
                          onSelectionChange={(keys) => setFieldValue("tecnico_entrante_id", keys.currentKey)}
                        >
                          {tecnicos?.map((tecnico) => (
                            <SelectItem key={tecnico.id} value={tecnico.id}>
                              {tecnico.nome}
                            </SelectItem>
                          ))}
                        </Select>
                      </div>
                    </div>
                    <Button type="submit" color="primary" className="w-full" disabled={isSubmitting}>
                      Finalizar Relatório e Gerar PDF
                    </Button>
                  </Form>
                )}
              </Formik>
            </>
          )}

          <Spacer y={4} />

          <div className="flex justify-between">
            <Button color="danger" onClick={prevStep} isDisabled={currentStep === 1}>
              Voltar
            </Button>
            <Button className="bg-blue-500 text-white" onClick={nextStep} isDisabled={currentStep === 3}>
              Próximo
            </Button>
          </div>
        </CardBody>
      </Card>
    </div>
  )
}