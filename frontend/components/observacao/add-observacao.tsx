import { Observacao } from "@/helpers/types"; // Tipagem que você mencionou
import { Select, SelectItem, Spinner } from "@nextui-org/react"; // Importa Select e SelectItem do NextUI
import { useFetchData } from "../hooks/useFetchDatas"; // Importa o hook de busca de dados

interface SituacaoType {
  id: number;
  nome: string;
  descricao: string;
}

interface ObservacaoFormProps {
  observacoes: Observacao[];
  setObservacoes: React.Dispatch<React.SetStateAction<Observacao[]>>;
}

export default function ObservacaoForm({
  observacoes,
  setObservacoes,
}: ObservacaoFormProps) {
  // Buscando situações
  const { data: Situacao, loading: loadingSituacao } =
    useFetchData<SituacaoType>("/situacoes");

  // Função para adicionar novas observações dinamicamente
  const adicionarNovaObservacao = () => {
    setObservacoes([...observacoes, { situacao_id: 0, descricao: "" }]);
  };

  return (
    <div>
      <h2 className="text-lg font-bold mb-4">Adicionar Observações</h2>
      {loadingSituacao ? (
        <Spinner /> // Mostra um spinner enquanto os dados estão sendo carregados
      ) : (
        observacoes.map((observacao, index) => (
          <div key={index} className="mb-4">
            <div className="mb-4">
              <label className="block mb-2">Situação:</label>
              <Select
                label="Situação"
                selectedKeys={new Set([String(observacao.situacao_id)])}
                onSelectionChange={(keys) =>
                  setObservacoes((prev) =>
                    prev.map((obs, i) =>
                      i === index
                        ? { ...obs, situacao_id: Number(keys.currentKey) }
                        : obs
                    )
                  )
                }
              >
                {Situacao?.map((situacao) => (
                  <SelectItem key={situacao.id}>{situacao.nome}</SelectItem>
                ))}
              </Select>
            </div>

            <div className="mb-4">
              <label className="block mb-2">Descrição:</label>
              <textarea
                className="border p-2 w-full"
                value={observacao.descricao}
                onChange={(e) =>
                  setObservacoes((prev) =>
                    prev.map((obs, i) =>
                      i === index ? { ...obs, descricao: e.target.value } : obs
                    )
                  )
                }
              ></textarea>
            </div>
          </div>
        ))
      )}
      <button
        className="bg-green-500 text-white p-2"
        onClick={adicionarNovaObservacao}
      >
        + Adicionar Outra Observação
      </button>
    </div>
  );
}
