import { Observacao } from "@/helpers/types"
import { Select, SelectItem, Spinner, Button, Textarea, Card, CardBody, CardHeader } from "@nextui-org/react"
import { useFetchData } from "../hooks/useFetchDatas"
import { useEffect } from "react"

interface SituacaoType {
  id: number
  nome: string
}

interface ObservacaoFormProps {
  observacoes: Observacao[]
  setObservacoes: React.Dispatch<React.SetStateAction<Observacao[]>>
}

export default function ObservacaoForm({ observacoes, setObservacoes }: ObservacaoFormProps) {
  const { data: Situacao, loading: loadingSituacao } = useFetchData<SituacaoType>("/situacoes")

  useEffect(() => {
    if (observacoes.length === 0) {
      setObservacoes([{ situacao_id: 0, descricao: "" }])
    }
  }, [observacoes, setObservacoes])

  const adicionarNovaObservacao = () => {
    setObservacoes([...observacoes, { situacao_id: 0, descricao: "" }])
  }

  const removerObservacao = (index: number) => {
    setObservacoes(observacoes.filter((_, i) => i !== index))
  }

  return (
    <div className="space-y-4">
      <h2 className="text-lg font-bold">Adicionar Observações</h2>
      {loadingSituacao ? (
        <Spinner />
      ) : (
        observacoes.map((observacao, index) => (
          <Card key={index} className="w-full">
            <CardHeader className="flex justify-between items-center">
              <h3 className="font-semibold">Observação {index + 1}</h3>
              {index > 0 && (
                <Button color="danger" variant="light" onClick={() => removerObservacao(index)}>
                  Remover
                </Button>
              )}
            </CardHeader>
            <CardBody className="space-y-4">
              <Select
                label="Situação"
                selectedKeys={new Set([String(observacao.situacao_id)])}
                onSelectionChange={(keys) =>
                  setObservacoes((prev) =>
                    prev.map((obs, i) =>
                      i === index ? { ...obs, situacao_id: Number(keys.currentKey) } : obs
                    )
                  )
                }
              >
                {Situacao?.map((situacao) => (
                  <SelectItem key={situacao.id} value={situacao.id}>
                    {situacao.nome}
                  </SelectItem>
                ))}
              </Select>

              <Textarea
                label="Descrição"
                value={observacao.descricao}
                onChange={(e) =>
                  setObservacoes((prev) =>
                    prev.map((obs, i) =>
                      i === index ? { ...obs, descricao: e.target.value } : obs
                    )
                  )
                }
                minRows={3}
              />
            </CardBody>
          </Card>
        ))
      )}
      <Button color="success" onClick={adicionarNovaObservacao}>
        + Adicionar Outra Observação
      </Button>
    </div>
  )
}