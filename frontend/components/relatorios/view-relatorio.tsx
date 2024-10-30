import React, { useEffect, useState } from "react";
import { Modal, Button, Spinner, ModalBody, ModalFooter, ModalHeader, ModalContent, Table, TableHeader, TableBody, TableColumn, TableRow, TableCell, Divider, Card, CardBody } from "@nextui-org/react";
import { buscarDadosRelatorio } from "../pdf/relatorio";
import gerarPDF from "../pdf/relatorioPDF"
import { Equipamento, Observacao, RelatorioType } from "@/helpers/types";
import { FileText, Download } from "lucide-react";

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
      size="4xl"
      placement="center"
      backdrop="blur"
      classNames={{
        base: "bg-background text-foreground",
        header: "border-b border-divider",
        body: "py-6",
        footer: "border-t border-divider",
        closeButton: "hover:bg-default-100 active:bg-default-200",
      }}
      motionProps={{
        variants: {
          enter: {
            y: 0,
            opacity: 1,
            transition: {
              duration: 0.3,
              ease: "easeOut",
            },
          },
          exit: {
            y: -20,
            opacity: 0,
            transition: {
              duration: 0.2,
              ease: "easeIn",
            },
          },
        },
      }}
    >
      <ModalContent>
        <ModalHeader>
          <div className="flex items-center space-x-2">
            <FileText className="w-6 h-6 text-primary" />
            <h3 className="text-2xl font-bold">Detalhes do Relatório</h3>
          </div>
        </ModalHeader>
        <ModalBody>
          {loading ? (
            <div className="flex justify-center items-center h-64">
              <Spinner size="lg" color="primary" />
            </div>
          ) : error ? (
            <div className="text-center text-danger">{error}</div>
          ) : dadosRelatorio && (
            <div className="space-y-6">
              <Card>
                <CardBody>
                  <div className="grid grid-cols-2 gap-4">
                    <div>
                      <p className="text-sm text-default-500">Técnico Entrante</p>
                      <p className="font-semibold">{dadosRelatorio.entrante}</p>
                    </div>
                    <div>
                      <p className="text-sm text-default-500">Técnico Cessante</p>
                      <p className="font-semibold">{dadosRelatorio.cessante}</p>
                    </div>
                    <div className="col-span-2">
                      <p className="text-sm text-default-500">Data de Criação</p>
                      <p className="font-semibold">{new Date(dadosRelatorio.data_criacao).toLocaleDateString()}</p>
                    </div>
                  </div>
                </CardBody>
              </Card>

              <Divider className="my-4" />

              <div>
                <h4 className="text-xl font-semibold mb-2">Observações</h4>
                <ul className="list-disc list-inside space-y-2">
                  {dadosRelatorio.observacoes.map((obs, index) => (
                    <li key={index} className="text-default-600">
                      <span className="font-medium">{obs.nome}:</span> {obs.descricao}
                    </li>
                  ))}
                </ul>
              </div>

              <Divider className="my-4" />

              <div>
                <h4 className="text-xl font-semibold mb-2">Equipamentos</h4>
                <Table aria-label="Tabela de equipamentos">
                  <TableHeader>
                    <TableColumn>MEIO</TableColumn>
                    <TableColumn>QUANTIDADE</TableColumn>
                    <TableColumn>ESTADO</TableColumn>
                    <TableColumn>LOCAL</TableColumn>
                  </TableHeader>
                  <TableBody>
                    {dadosRelatorio.equipamentos.map((equip, index) => (
                      <TableRow key={index}>
                        <TableCell>{equip.nome}</TableCell>
                        <TableCell>{equip.quantidade}</TableCell>
                        <TableCell>{equip.status}</TableCell>
                        <TableCell>{equip.localizacao}</TableCell>
                      </TableRow>
                    ))}
                  </TableBody>
                </Table>
              </div>
            </div>
          )}
        </ModalBody>
        <ModalFooter>
          <Button color="primary" onPress={handleGerarPDF} startContent={<Download size={18} />}>
            Gerar PDF
          </Button>
          <Button color="danger" variant="light" onPress={onClose}>
            Fechar
          </Button>
        </ModalFooter>
      </ModalContent>
    </Modal>
  );
};