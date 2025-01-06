import React, { useEffect, useState } from "react";
import { Modal, Button, Spinner, ModalBody, ModalFooter, ModalHeader, ModalContent, Card, CardBody, Chip, Autocomplete, AutocompleteItem } from "@nextui-org/react";
import { EntidadeType, RadioType } from "@/helpers/types";
import { Building2, Radio, X, Search } from 'lucide-react';
import api from "@/helpers/api";
import { useToast } from "@/hooks/use-toast";

interface ViewEntidadeModalProps {
  entidade: EntidadeType;
  isOpen: boolean;
  onClose: () => void;
  onCloseAndRefresh: () => void;
}

export const ViewEntidadeModal: React.FC<ViewEntidadeModalProps> = ({
  entidade,
  isOpen,
  onClose,
  onCloseAndRefresh,
}) => {
  const [loading, setLoading] = useState<boolean>(true);
  const [entidadeData, setEntidadeData] = useState<EntidadeType | null>(null);
  const [associatedRadio, setAssociatedRadio] = useState<RadioType | null>(null);
  const [availableRadios, setAvailableRadios] = useState<RadioType[]>([]);
  const [error, setError] = useState<string | null>(null);
  const { toast } = useToast();

  const fetchData = async () => {
    setLoading(true);
    try {
      const [entidadeResponse, radiosResponse] = await Promise.all([
        api.get(`/entidades/${entidade.id}`),
        api.get('/radios')
      ]);
      setEntidadeData(entidadeResponse.data);
      
      if (entidadeResponse.data.radio_id && entidadeResponse.data.radio_identificador) {
        setAssociatedRadio({
          id: entidadeResponse.data.radio_id,
          identificador: entidadeResponse.data.radio_identificador,
        });
        
      } else {
        setAssociatedRadio(null);
      }
      setAvailableRadios(radiosResponse.data.filter((r: RadioType) => !r.entidade_id));
     
    } catch (error) {
      setError("Erro ao buscar dados da entidade.");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    if (entidade.id && isOpen) {
      fetchData();
    }
  }, [entidade.id, isOpen]);

  const handleAssociateRadio = async(radioId: string) => {
    try {
      await api.post(`/entidades/${entidade.id}/radios`, { radio_id: radioId });
      fetchData();
      toast({
        title: "Sucesso",
        description: "Rádio associado com sucesso.",
      });
    } catch (error) {
      console.error("Erro ao associar rádio:", error);
      toast({
        title: "Erro",
        description: (error as any).response?.data?.message || "Erro ao associar rádio à entidade",
        variant: "destructive",
      });
    }
  };

  const handleRemoveRadio = async () => {
    try {
      await api.delete(`/entidades/${entidade.id}/radios/${associatedRadio?.id}`);
      fetchData();
      toast({
        title: "Sucesso",
        description: "Rádio removido com sucesso.",
      });
    } catch (error) {
      console.error("Erro ao remover rádio da entidade:", error);
      toast({
        title: "Erro",
        description: "Erro ao remover rádio da entidade",
        variant: "destructive",
      });
    }
  };

  return (
    <Modal
      isOpen={isOpen}
      onClose={() => {
        onClose();
        onCloseAndRefresh();
      }}
      size="2xl"
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
                <Building2 className="w-6 h-6 text-primary" />
                <h3 className="text-xl font-bold">Detalhes da Entidade</h3>
              </div>
            </ModalHeader>
            <ModalBody>
              {loading ? (
                <div className="flex justify-center items-center h-32">
                  <Spinner size="lg" color="primary" />
                </div>
              ) : error ? (
                <div className="text-center text-danger">{error}</div>
              ) : entidadeData && (
                <div className="space-y-4">
                  <Card className="bg-default-50">
                    <CardBody className="py-3">
                      <div className="grid grid-cols-2 gap-4">
                        <div>
                          <p className="text-sm text-default-500">Nome</p>
                          <p className="text-lg font-semibold">{entidadeData.nome}</p>
                        </div>
                        <div>
                          <p className="text-sm text-default-500">Indicativo</p>
                          <p className="text-lg font-semibold">{entidadeData.indicativo}</p>
                        </div>
                      </div>
                    </CardBody>
                  </Card>

                  <div className="space-y-2">
                    <div className="flex items-center gap-2">
                      <Radio className="w-5 h-5 text-primary" />
                      <h4 className="text-lg font-semibold">Rádio Associado</h4>
                    </div>
                    {associatedRadio ? (
                      <div className="flex items-center justify-between bg-default-100 p-2 rounded-md">
                        <Chip
                          size="sm"
                          variant="flat"
                          startContent={<Radio className="w-3 h-3" />}
                        >
                          {associatedRadio.identificador}
                        </Chip>
                        <Button
                          size="sm"
                          color="danger"
                          variant="light"
                          onPress={handleRemoveRadio}
                        >
                          Remover
                        </Button>
                      </div>
                    ) : (
                      <Autocomplete
                        label="Associar Rádio"
                        placeholder="Selecione um rádio para associar"
                        className="max-w-xs"
                        onSelectionChange={(key) => handleAssociateRadio(key as string)}
                        startContent={<Search className="text-default-400" strokeWidth={2} size={20} />}
                      >
                        {availableRadios.map((radio) => (
                          <AutocompleteItem key={radio.id} value={radio.id.toString()}>
                            {radio.identificador}
                          </AutocompleteItem>
                        ))}
                      </Autocomplete>
                    )}
                  </div>
                </div>
              )}
            </ModalBody>
            <ModalFooter>
              <Button color="danger" variant="light" onPress={() => {
                onClose();
                onCloseAndRefresh();
              }}>
                Fechar
              </Button>
            </ModalFooter>
          </>
        )}
      </ModalContent>
    </Modal>
  );
};

