import { Equipamento } from "@/helpers/types"
import { Select, SelectItem, Spinner, Button, Input, Card, CardBody, CardHeader } from "@nextui-org/react"
import { useFetchData } from "../hooks/useFetchDatas"
import { useEffect } from "react"

interface EquipamentoType {
  id: number
  nome: string
}

interface EquipamentoFormProps {
  equipamentos: Equipamento[]
  setEquipamentos: React.Dispatch<React.SetStateAction<Equipamento[]>>
}

export default function EquipamentoForm({ equipamentos, setEquipamentos }: EquipamentoFormProps) {
  const { data: Equipamentos, loading: loadingEquipamentos } = useFetchData<EquipamentoType>("/equipamentos")

  useEffect(() => {
    if (equipamentos.length === 0) {
      setEquipamentos([{ equipamento_id: 0, quantidade: 0, status: "Bom", localizacao: "" }])
    }
  }, [equipamentos, setEquipamentos])

  const adicionarNovoEquipamento = () => {
    setEquipamentos([...equipamentos, { equipamento_id: 0, quantidade: 0, status: "Bom", localizacao: "" }])
  }

  const removerEquipamento = (index: number) => {
    setEquipamentos(equipamentos.filter((_, i) => i !== index))
  }

  return (
    <div className="space-y-4">
      <h2 className="text-lg font-bold">Adicionar Equipamentos</h2>
      {loadingEquipamentos ? (
        <Spinner />
      ) : (
        equipamentos.map((equipamento, index) => (
          <Card key={index} className="w-full">
            <CardHeader className="flex justify-between items-center">
              <h3 className="font-semibold">Equipamento {index + 1}</h3>
              {index > 0 && (
                <Button color="danger" variant="light" onClick={() => removerEquipamento(index)}>
                  Remover
                </Button>
              )}
            </CardHeader>
            <CardBody className="space-y-4">
              <Select
                label="Escolha um Equipamento"
                selectedKeys={new Set([String(equipamento.equipamento_id)])}
                onSelectionChange={(keys) => {
                  const selectedKey = keys.currentKey
                  if (selectedKey) {
                    setEquipamentos((prev) =>
                      prev.map((equip, i) =>
                        i === index ? { ...equip, equipamento_id: Number(selectedKey) } : equip
                      )
                    )
                  }
                }}
              >
                {Equipamentos?.map((equip) => (
                  <SelectItem key={equip.id} value={equip.id}>
                    {equip.nome}
                  </SelectItem>
                ))}
              </Select>

              <Input
                type="number"
                label="Quantidade"
                value={equipamento.quantidade.toString()}
                onChange={(e) =>
                  setEquipamentos((prev) =>
                    prev.map((equip, i) =>
                      i === index ? { ...equip, quantidade: +e.target.value } : equip
                    )
                  )
                }
              />

              <Select
                label="Estado"
                selectedKeys={new Set([equipamento.status])}
                onSelectionChange={(keys) => {
                  const selectedKey = keys.currentKey
                  if (selectedKey) {
                    setEquipamentos((prev) =>
                      prev.map((equip, i) =>
                        i === index ? { ...equip, status: selectedKey } : equip
                      )
                    )
                  }
                }}
              >
                <SelectItem key="Bom">Bom</SelectItem>
                <SelectItem key="Mau">Mau</SelectItem>
                <SelectItem key="Manutenção">Manutenção</SelectItem>
              </Select>

              <Input
                type="text"
                label="Localização"
                value={equipamento.localizacao}
                onChange={(e) =>
                  setEquipamentos((prev) =>
                    prev.map((equip, i) =>
                      i === index ? { ...equip, localizacao: e.target.value } : equip
                    )
                  )
                }
              />
            </CardBody>
          </Card>
        ))
      )}
      <Button color="success" onClick={adicionarNovoEquipamento}>
        + Adicionar Outro Equipamento
      </Button>
    </div>
  )
}