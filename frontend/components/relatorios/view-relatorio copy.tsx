import React, { useEffect, useState } from "react";
import { Modal, Button, Spinner, ModalBody, ModalFooter, ModalHeader, ModalContent } from "@nextui-org/react";
import { buscarDadosRelatorio } from "../pdf/relatorio";
import gerarPDF from "../pdf/relatorioPDF"
import { Equipamento, Observacao, RelatorioType } from "@/helpers/types";

interface VisualizarRelatorioModalProps {
  relatorio: RelatorioType;
  isOpen: boolean;
  onClose: () => void;
}

export const VisualizarRelatorioModal: React.FC<VisualizarRelatorioModalProps> = ({
  relatorio,
  isOpen,
  onClose,
}) => {
  const [loading, setLoading] = useState<boolean>(true);
  const [dadosRelatorio, setDadosRelatorio] = useState<{
    equipamentos: Equipamento[];
    observacoes: Observacao[];
    entrante: string;
    cessante: string;
    data_criacao: Date;
  } | null>(null);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    if (relatorio.id) {
      const fetchDados = async () => {
        setLoading(true);
        try {
          const dados = await buscarDadosRelatorio(relatorio.id);
          setDadosRelatorio(dados);
        } catch (error) {
          setError("Erro ao buscar dados do relatório.");
        } finally {
          setLoading(false);
        }
      };

      fetchDados();
    }
  }, [relatorio.id]);

  const handleGerarPDF = () => {
    if (relatorio.id) {
      gerarPDF(relatorio.id);
    }
  };

  return (
    <Modal
      isOpen={isOpen}
      onClose={onClose}
      size="lg"
      placement="center"
      backdrop="blur"
      classNames={{
        body: "py-6",

        base: "border-[#292f46] pb-6",
        header: "border-b-[1px] border-[#292f46]",
        footer: "border-t-[1px] border-[#292f46]",
        closeButton: "hover:bg-white/5 active:bg-white/10",
      }}
    >
      <ModalContent>
      <ModalHeader>
        <h3>Detalhes do Relatório</h3>
      </ModalHeader>
      <ModalBody>
        {dadosRelatorio && (
          <>
            <p><strong>Técnico Entrante:</strong> {dadosRelatorio.entrante}</p>
            <p><strong>Técnico Cessante:</strong> {dadosRelatorio.cessante}</p>
            <p><strong>Data de Criação:</strong> {new Date(dadosRelatorio.data_criacao).toLocaleDateString()}</p>

            <h4>Observações</h4>
            {dadosRelatorio.observacoes.map((obs, index) => (
              <p key={index}>{`${index + 1}. ${obs.nome}: ${obs.descricao}`}</p>
            ))}

            <h4>Equipamentos</h4>
            <table>
              <thead>
                <tr>
                  <th>Meio</th>
                  <th>Quantidade</th>
                  <th>Estado</th>
                  <th>Local</th>
                </tr>
              </thead>
              <tbody>
                {dadosRelatorio.equipamentos.map((equip, index) => (
                  <tr key={index}>
                    <td>{equip.nome}</td>
                    <td>{equip.quantidade}</td>
                    <td>{equip.status}</td>
                    <td>{equip.localizacao}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </>
        )}
      </ModalBody>
      <ModalFooter>
        <Button color="primary" onPress={handleGerarPDF}>
          Gerar PDF
        </Button>
        <Button color="secondary" onPress={onClose}>
          Fechar
        </Button>
      </ModalFooter>
      </ModalContent>
    </Modal>
  );
};
