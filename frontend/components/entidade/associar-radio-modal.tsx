import React, { useState, useEffect } from 'react';
import { Modal, ModalContent, ModalHeader, ModalBody, ModalFooter, Button, Select, SelectItem } from "@nextui-org/react";
import api from "@/helpers/api";
import { RadioType } from "@/helpers/types";

interface AssociarRadioModalProps {
  isOpen: boolean;
  onClose: () => void;
  onAssociar: (radioId: number) => void;
  entidadeId: number;
}

export const AssociarRadioModal: React.FC<AssociarRadioModalProps> = ({
  isOpen,
  onClose,
  onAssociar,
  entidadeId
}) => {
  const [radios, setRadios] = useState<RadioType[]>([]);
  const [selectedRadio, setSelectedRadio] = useState<number | null>(null);

  useEffect(() => {
    const fetchRadios = async () => {
      try {
        const response = await api.get('/radios');
        setRadios(response.data);
      } catch (error) {
        console.error('Erro ao buscar rádios:', error);
      }
    };

    if (isOpen) {
      fetchRadios();
    }
  }, [isOpen]);

  const handleAssociar = () => {
    if (selectedRadio) {
      onAssociar(selectedRadio);
      onClose();
    }
  };

  return (
    <Modal isOpen={isOpen} onClose={onClose}>
      <ModalContent>
        <ModalHeader>Associar Novo Rádio</ModalHeader>
        <ModalBody>
          <Select
            label="Selecione um Rádio"
            placeholder="Escolha um rádio"
            onChange={(e) => setSelectedRadio(Number(e.target.value))}
          >
            {radios.map((radio) => (
              <SelectItem key={radio.id} value={radio.id}>
                {radio.identificador} - {radio.numero_serie}
              </SelectItem>
            ))}
          </Select>
        </ModalBody>
        <ModalFooter>
          <Button color="danger" variant="light" onPress={onClose}>
            Cancelar
          </Button>
          <Button color="primary" onPress={handleAssociar} disabled={!selectedRadio}>
            Associar
          </Button>
        </ModalFooter>
      </ModalContent>
    </Modal>
  );
};

