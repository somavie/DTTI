import { Observacao } from "@/helpers/types"
import { Select, SelectItem, Spinner, Button, Textarea, Card, CardBody, CardHeader, CardFooter } from "@nextui-org/react"
import { useFetchData } from "../hooks/useFetchDatas"
import { useEffect } from "react"
import { PlusIcon } from "../icons/plus-icon"

interface SituacaoType {
  id: number
  nome: string
  estado?: number
}

interface ObservacaoFormProps {
  observacoes: Observacao[]
  setObservacoes: React.Dispatch<React.SetStateAction<Observacao[]>>
  onCadastrar?: () => void
  showCadastrarButton?: boolean
}

export default function ObservacaoForm({ 
  observacoes, 
  setObservacoes, 
  onCadastrar, 
  showCadastrarButton = false 
}: ObservacaoFormProps) {
  const { data: Situacao, loading: loadingSituacao } = useFetchData<SituacaoType>("/situacoes")

  useEffect(() => {
    if (observacoes.length === 0) {
      setObservacoes([{ id: 0, situacao_id: 0, descricao: "" }])
    }
  }, [observacoes, setObservacoes])

  const adicionarNovaObservacao = () => {
    setObservacoes([...observacoes, {id: 0, situacao_id: 0, descricao: "" }])
  }

  const removerObservacao = (index: number) => {
    setObservacoes(observacoes.filter((_, i) => i !== index))
  }

  return (
    <div className="space-y-4">
      {loadingSituacao ? (
        <Spinner />
      ) : (
        observacoes.map((observacao, index) => (
          <Card key={index} className="bg-sky-200 w-full">
            <CardHeader className="flex justify-between items-center">
              <h3 className="font-semibold">Add Ocorrência {index + 1}</h3>
              {index > 0 && (
                <Button color="danger" variant="light" onClick={() => removerObservacao(index)}>
                  Remover
                </Button>
              )}
            </CardHeader>
            <CardBody className="space-y-4">
              <Select
                label="Serviço"
                selectedKeys={new Set([String(observacao.situacao_id)])}
                onSelectionChange={(keys) =>
                  setObservacoes((prev) =>
                    prev.map((obs, i) =>
                      i === index ? { ...obs, situacao_id: Number(keys.currentKey) } : obs
                    )
                  )
                }
              >
                {Situacao?.filter(situacao => situacao.estado === 1).map((situacao) => (
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
            <CardFooter className="flex justify-end">
              <div className="flex justify-end space-x-2">
                <Button isIconOnly color="success" onClick={adicionarNovaObservacao}>
                  <PlusIcon />
                </Button>
                {showCadastrarButton && onCadastrar && (
                  <Button 
                    className="bg-blue-500 text-white" 
                    onClick={onCadastrar}>
                    Cadastrar
                  </Button>
                )}
              </div>
            </CardFooter>
          </Card>
        ))
      )}
      
    </div>
  )
}

