import React, { useState, useEffect } from 'react';
import { Modal, ModalContent, ModalHeader, ModalBody, ModalFooter, Button, Autocomplete, AutocompleteItem, Chip } from "@nextui-org/react";
import { Search } from 'lucide-react';
import api from "@/helpers/api";
import { EntidadeType } from "@/helpers/types";

interface AssociarEntidadeModalProps {
  isOpen: boolean;
  onClose: () => void;
  onAssociar: (entidades: number[]) => void;
  grupoId: number;
}

export const AssociarEntidadeModal: React.FC<AssociarEntidadeModalProps> = ({
  isOpen,
  onClose,
  onAssociar,
  grupoId
}) => {
  const [entidades, setEntidades] = useState<EntidadeType[]>([]);
  const [selectedEntidades, setSelectedEntidades] = useState<EntidadeType[]>([]);
  const [loading, setLoading] = useState(false);
  const [filteredEntidades, setFilteredEntidades] = useState<EntidadeType[]>([]);

  useEffect(() => {
    const fetchEntidades = async () => {
      setLoading(true);
      try {
        const response = await api.get('/entidades');
        setEntidades(response.data);
      } catch (error) {
        console.error('Erro ao buscar entidades:', error);
      } finally {
        setLoading(false);
      }
    };

    if (isOpen) {
      fetchEntidades();
    }
  }, [isOpen]);

  useEffect(() => {
    setFilteredEntidades(entidades);
  }, [entidades]);

  const handleInputChange = (value: string) => {
    const filtered = entidades.filter(entidade => 
      entidade.nome.toLowerCase().includes(value.toLowerCase()) ||
      entidade.indicativo.toString().includes(value)
    );
    setFilteredEntidades(filtered);
  };

  const handleAssociar = () => {
    onAssociar(selectedEntidades.map(e => e.id));
    onClose();
  };

  const handleSelectEntidade = (entidadeId: string) => {
    const entidade = entidades.find(e => e.id === Number(entidadeId));
    if (entidade && !selectedEntidades.some(e => e.id === entidade.id)) {
      setSelectedEntidades([...selectedEntidades, entidade]);
    }
  };

  const handleRemoveEntidade = (entidadeId: number) => {
    setSelectedEntidades(selectedEntidades.filter(e => e.id !== entidadeId));
  };

  return (
    <Modal isOpen={isOpen} onClose={onClose} size="2xl">
      <ModalContent>
        {(onClose) => (
          <>
            <ModalHeader>Associar Entidades ao Grupo</ModalHeader>
            <ModalBody>
              <Autocomplete
                label="Selecione as Entidades"
                placeholder="Buscar entidades..."
                items={filteredEntidades}
                isLoading={loading}
                onSelectionChange={(key) => handleSelectEntidade(key as string)}
                onInputChange={handleInputChange}
                startContent={<Search className="text-default-400" strokeWidth={2.5} size={20} />}
              >
                {(entidade) => (
                  <AutocompleteItem key={entidade.id} textValue={entidade.nome}>
                    <div className="flex justify-between items-center">
                      <span>{entidade.nome}</span>
                      <span className="text-small text-default-400">{entidade.indicativo}</span>
                    </div>
                  </AutocompleteItem>
                )}
              </Autocomplete>
              <div className="mt-4">
                <h4 className="text-small font-semibold mb-2">Entidades Selecionadas:</h4>
                <div className="flex flex-wrap gap-2">
                  {selectedEntidades.map((entidade) => (
                    <Chip
                      key={entidade.id}
                      onClose={() => handleRemoveEntidade(entidade.id)}
                      variant="flat"
                      className="py-1 px-2"
                    >
                      {entidade.nome}
                    </Chip>
                  ))}
                </div>
              </div>
            </ModalBody>
            <ModalFooter>
              <Button color="danger" variant="light" onPress={onClose}>
                Cancelar
              </Button>
              <Button color="primary" onPress={handleAssociar} disabled={selectedEntidades.length === 0}>
                Associar
              </Button>
            </ModalFooter>
          </>
        )}
      </ModalContent>
    </Modal>
  );
};

