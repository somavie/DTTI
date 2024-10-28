import { Equipamento } from "@/helpers/types"; // Certifique-se de que a interface está correta
import { Select, SelectItem, Spinner } from "@nextui-org/react"; // Importa Select e SelectItem do NextUI
import { useFetchData } from "../hooks/useFetchDatas"; // Importa o hook de busca de dados

interface EquipamentoType {
  id: number;
  nome: string;
}

interface EquipamentoFormProps {
  equipamentos: Equipamento[];
  setEquipamentos: React.Dispatch<React.SetStateAction<Equipamento[]>>;
}

export default function EquipamentoForm({
  equipamentos,
  setEquipamentos,
}: EquipamentoFormProps) {
  // Buscando equipamentos
  const { data: Equipamentos, loading: loadingEquipamentos } =
    useFetchData<EquipamentoType>("/equipamentos");

  // Função para adicionar novos equipamentos dinamicamente
  const adicionarNovoEquipamento = () => {
    setEquipamentos([
      ...equipamentos,
      { equipamento_id: 0, quantidade: 0, status: "Bom", localizacao: "" }, // Definir "Bom" como valor padrão
    ]);
  };

  return (
    <div>
      <h2 className="text-lg font-bold mb-4">Adicionar Equipamentos</h2>
      {loadingEquipamentos ? (
        <Spinner /> // Mostra um spinner enquanto os dados estão sendo carregados
      ) : (
        equipamentos.map((equipamento, index) => (
          <div key={index} className="mb-4 p-4 border border-gray-300 rounded">
            <h3 className="font-semibold mb-2">Equipamento {index + 1}</h3>
            <div className="mb-4">
              <label className="block mb-2">Equipamento:</label>
              <Select
                label="Escolha um Equipamento"
                selectedKeys={new Set([String(equipamento.equipamento_id)])}
                onSelectionChange={(keys) => {
                  const selectedKey = keys.currentKey;
                  if (selectedKey) {
                    setEquipamentos((prev) =>
                      prev.map((equip, i) =>
                        i === index
                          ? { ...equip, equipamento_id: Number(selectedKey) }
                          : equip
                      )
                    );
                  }
                }}
              >
                {Equipamentos?.map((equip) => (
                  <SelectItem key={equip.id}>
                    {equip.nome} {/* Assumindo que 'nome' é o campo desejado */}
                  </SelectItem>
                ))}
              </Select>
            </div>
            <div className="mb-4">
              <label className="block mb-2">Quantidade:</label>
              <input
                type="number"
                className="border p-2 w-full"
                value={equipamento.quantidade}
                onChange={(e) =>
                  setEquipamentos((prev) =>
                    prev.map((equip, i) =>
                      i === index
                        ? { ...equip, quantidade: +e.target.value }
                        : equip
                    )
                  )
                }
              />
            </div>
            <div className="mb-4">
              <label className="block mb-2">Estado:</label>
              <Select
                label="Escolha um Estado"
                selectedKeys={new Set([equipamento.status])}
                onSelectionChange={(keys) => {
                  const selectedKey = keys.currentKey;
                  if (selectedKey) {
                    setEquipamentos((prev) =>
                      prev.map((equip, i) =>
                        i === index
                          ? { ...equip, status: selectedKey } // Mantendo como string
                          : equip
                      )
                    );
                  }
                }}
              >
                <SelectItem key="Bom">Bom</SelectItem>
                <SelectItem key="Mau">Mau</SelectItem>
                <SelectItem key="Manutenção">Manutenção</SelectItem>
              </Select>
            </div>
            <div className="mb-4">
              <label className="block mb-2">Localização:</label>
              <input
                type="text"
                className="border p-2 w-full"
                value={equipamento.localizacao}
                onChange={(e) =>
                  setEquipamentos((prev) =>
                    prev.map((equip, i) =>
                      i === index
                        ? { ...equip, localizacao: e.target.value }
                        : equip
                    )
                  )
                }
              />
            </div>
          </div>
        ))
      )}
      <button
        className="bg-green-500 text-white p-2"
        onClick={adicionarNovoEquipamento}
      >
        + Adicionar Outro Equipamento
      </button>
    </div>
  );
}
