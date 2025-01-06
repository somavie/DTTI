import React, { useEffect, useState } from "react";
import { Modal, Button, Spinner, ModalBody, ModalFooter, ModalHeader, ModalContent, Table, TableHeader, TableBody, TableColumn, TableRow, TableCell, Card, CardBody, Chip, Autocomplete, AutocompleteItem } from "@nextui-org/react";
import { GrupoType, EntidadeType } from "@/helpers/types";
import { Users, Radio, X, Building2, Search } from 'lucide-react';
import api from "@/helpers/api";

interface ViewGrupoModalProps {
  grupo: GrupoType;
  isOpen: boolean;
  onClose: () => void;
}

interface EntidadeWithRadios extends EntidadeType {
  radios_identificadores: string;
}

export const ViewGrupoModal: React.FC<ViewGrupoModalProps> = ({
  grupo,
  isOpen,
  onClose,
}) => {
  const [loading, setLoading] = useState<boolean>(true);
  const [entidades, setEntidades] = useState<EntidadeWithRadios[]>([]);
  const [allEntidades, setAllEntidades] = useState<EntidadeType[]>([]);
  const [error, setError] = useState<string | null>(null);

  const fetchData = async () => {
    setLoading(true);
    try {
      const [entidadesResponse, allEntidadesResponse] = await Promise.all([
        api.get(`/grupo/${grupo.id}/entidades`),
        api.get('/entidades')
      ]);
      setEntidades(entidadesResponse.data);
      setAllEntidades(allEntidadesResponse.data);
    } catch (error) {
      setError("Erro ao buscar dados do grupo.");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    if (grupo.id && isOpen) {
      fetchData();
    }
  }, [grupo.id, isOpen]);

  const handleAssociarEntidade = async (entidadeId: string) => {
    try {
      await api.post(`/grupo/${grupo.id}/entidades`, { entidades: [entidadeId] });
      fetchData();
    } catch (error) {
      console.error("Erro ao associar entidade:", error);
    }
  };

  const handleRemoveEntidade = async (entidadeId: number) => {
    try {
      await api.delete(`/grupo/${grupo.id}/entidades/${entidadeId}`);
      fetchData();
    } catch (error) {
      console.error("Erro ao remover entidade do grupo:", error);
    }
  };

  return (
    <Modal
      isOpen={isOpen}
      onClose={onClose}
      size="3xl"
      placement="center"
      backdrop="blur"
      classNames={{
        base: "bg-background text-foreground",
        header: "border-b border-divider",
        body: "py-4",
        footer: "border-t border-divider",
        closeButton: "hover:bg-default-100 active:bg-default-200",
      }}
    >
      <ModalContent>
        {(onClose) => (
          <>
            <ModalHeader className="flex flex-col gap-1">
              <div className="flex items-center gap-2">
                <Users className="w-6 h-6 text-primary" />
                <h3 className="text-xl font-bold">Detalhes do Grupo</h3>
              </div>
            </ModalHeader>
            <ModalBody>
              {loading ? (
                <div className="flex justify-center items-center h-32">
                  <Spinner size="lg" color="primary" />
                </div>
              ) : error ? (
                <div className="text-center text-danger">{error}</div>
              ) : (
                <div className="space-y-4">
                  <Card className="bg-default-50">
                    <CardBody className="py-3">
                      <div className="grid grid-cols-2 gap-4">
                        <div>
                          <p className="text-sm text-default-500">Nome</p>
                          <p className="text-lg font-semibold">{grupo.nome}</p>
                        </div>
                        <div>
                          <p className="text-sm text-default-500">Codname</p>
                          <p className="text-lg font-semibold">{grupo.codname}</p>
                        </div>
                      </div>
                    </CardBody>
                  </Card>

                  <div className="flex justify-between items-center">
                    <div className="flex items-center gap-2">
                      <Building2 className="w-5 h-5 text-primary" />
                      <h4 className="text-lg font-semibold">Entidades Associadas</h4>
                    </div>
                  </div>

                  <Autocomplete
                    label="Associar Entidade"
                    placeholder="Selecione uma entidade para associar"
                    className="max-w-xs"
                    onSelectionChange={(key) => handleAssociarEntidade(key as string)}
                    startContent={<Search className="text-default-400" strokeWidth={2} size={20} />}
                  >
                    {allEntidades
                      .filter(e => !entidades.some(ae => ae.id === e.id))
                      .map((entidade) => (
                        <AutocompleteItem key={entidade.id} value={entidade.id.toString()}>
                          {entidade.nome}
                        </AutocompleteItem>
                      ))}
                  </Autocomplete>

                  <Table 
                    aria-label="Tabela de entidades"
                    classNames={{
                      wrapper: "shadow-none",
                      th: "bg-default-100",
                    }}
                  >
                    <TableHeader>
                      <TableColumn>NOME</TableColumn>
                      <TableColumn>INDICATIVO</TableColumn>
                      <TableColumn>RÁDIOS</TableColumn>
                      <TableColumn className="text-right">AÇÕES</TableColumn>
                    </TableHeader>
                    <TableBody emptyContent="Nenhuma entidade associada.">
                      {entidades.map((entidade) => (
                        <TableRow key={entidade.id}>
                          <TableCell>{entidade.nome}</TableCell>
                          <TableCell>{entidade.indicativo}</TableCell>
                          <TableCell>
                            {entidade.radios_identificadores ? (
                              <div className="flex flex-wrap gap-1">
                                {entidade.radios_identificadores.split(',').map((radio, index) => (
                                  <Chip
                                    key={index}
                                    size="sm"
                                    variant="flat"
                                    startContent={<Radio className="w-3 h-3" />}
                                  >
                                    {radio}
                                  </Chip>
                                ))}
                              </div>
                            ) : (
                              <span className="text-default-400">Sem rádios</span>
                            )}
                          </TableCell>
                          <TableCell className="text-right">
                            <Button
                              isIconOnly
                              color="danger"
                              variant="light"
                              onPress={() => handleRemoveEntidade(entidade.id)}
                              className="text-danger"
                            >
                              <X size={18} />
                            </Button>
                          </TableCell>
                        </TableRow>
                      ))}
                    </TableBody>
                  </Table>
                </div>
              )}
            </ModalBody>
            <ModalFooter>
              <Button color="danger" variant="light" onPress={onClose}>
                Fechar
              </Button>
            </ModalFooter>
          </>
        )}
      </ModalContent>
    </Modal>
  );
};

