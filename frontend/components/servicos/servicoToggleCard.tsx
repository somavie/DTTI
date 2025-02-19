"use client"

import type React from "react"
import { useState, useEffect } from "react"
import { Card, CardHeader, CardBody, Switch } from "@nextui-org/react"
import api from "@/helpers/api"
import type { ServicoType } from "../servicos/servico"

interface SituacoesCardProps {
  initialSituacoes: ServicoType[]
}

export const SituacoesCard: React.FC<SituacoesCardProps> = ({ initialSituacoes }) => {
  const [situacoes, setSituacoes] = useState<ServicoType[]>(initialSituacoes)

  useEffect(() => {
    const fetchSituacoes = async () => {
      try {
        const response = await api.get("/situacoes")
        setSituacoes(response.data)
      } catch (error) {
        console.error("Erro ao buscar situações:", error)
      }
    }

    fetchSituacoes()
  }, [])

  const handleToggle = async (id: number, newOperacionabilidade: boolean) => {
    try {
      await api.put(`/situacoes/${id}`, { operacionabilidade: newOperacionabilidade ? 1 : 0 })
      setSituacoes((prevSituacoes) =>
        prevSituacoes.map((situacao) =>
          situacao.id === id ? { ...situacao, operacionabilidade: newOperacionabilidade ? 1 : 0 } : situacao,
        ),
      )
    } catch (error) {
      console.error("Erro ao atualizar operacionabilidade:", error)
    }
  }

  return (
    <Card className="w-full">
      <CardHeader className="pb-0 pt-2 px-4 flex-col items-start">
        <h4 className="font-bold text-large">Serviços</h4>
      </CardHeader>
      <CardBody className="overflow-visible py-2">
        {situacoes.map((situacao) => (
          <div
            key={situacao.id}
            className={`flex justify-between items-center p-2 rounded-lg mb-2 transition-colors ${
              situacao.operacionabilidade === 1
                ? "bg-green-500/20 hover:bg-green-500/30"
                : "bg-red-500/20 hover:bg-red-500/30"
            }`}
          >
            <span className="font-medium">{situacao.nome}</span>
            <Switch
              isSelected={situacao.operacionabilidade === 1}
              onChange={(e) => handleToggle(situacao.id, e.target.checked)}
              classNames={{
                wrapper: "group-data-[selected=true]:bg-green-500 group-data-[selected=false]:bg-red-500",
              }}
            />
          </div>
        ))}
      </CardBody>
    </Card>
  )
}

