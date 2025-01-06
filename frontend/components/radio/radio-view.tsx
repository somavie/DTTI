import React, { useEffect, useState } from "react";
import { Modal, Button, Spinner, ModalBody, ModalFooter, ModalHeader, ModalContent, Table, TableHeader, TableBody, TableColumn, TableRow, TableCell, Divider, Card, CardBody } from "@nextui-org/react";
import { RadioType } from "@/helpers/types";
import { Radio, Signal } from 'lucide-react';
import api from "@/helpers/api";
import RadioStatusChart from "../charts/radioStatusChart";

interface ViewRadioModalProps {
  radio: RadioType;
  isOpen: boolean;
  onClose: () => void;
}

export const ViewRadioModal: React.FC<ViewRadioModalProps> = ({
  radio,
  isOpen,
  onClose,
}) => {
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    if (radio.id) {
      setLoading(false);
    }
  }, [radio.id]);

  return (
    <Modal
    isOpen={isOpen}
    onClose={onClose}
    size="4xl"
    placement="center"
    backdrop="blur"
    isDismissable={false}
    classNames={{
      base: "bg-background text-foreground",
      header: "border-b border-divider",
      body: "py-6",
      footer: "border-t border-divider",
      closeButton: "hover:bg-default-100 active:bg-default-200",
    }}
    >
      <ModalContent>
        <ModalHeader>
          <div className="flex items-center space-x-2">
            <Radio className="w-6 h-6 text-primary" />
            <h3 className="text-2xl font-bold">Detalhes do Rádio</h3>
          </div>
        </ModalHeader>
        <ModalBody>
          {loading ? (
            <div className="flex justify-center items-center h-64">
              <Spinner size="lg" color="primary" />
            </div>
          ) : error ? (
            <div className="text-center text-danger">{error}</div>
          ) : (
            <div className="space-y-6">
              <Card>
                <CardBody>
                  <div className="grid grid-cols-2 gap-4">
                    <div>
                      <p className="text-sm text-default-500">Número de Série</p>
                      <p className="font-semibold">{radio.numero_serie}</p>
                    </div>
                    <div>
                      <p className="text-sm text-default-500">Identificador</p>
                      <p className="font-semibold">{radio.identificador}</p>
                    </div>
                    <div>
                      <p className="text-sm text-default-500">Localização</p>
                      <p className="font-semibold">{radio.localizacao}</p>
                    </div>
                    <div>
                      <p className="text-sm text-default-500">Situação</p>
                      <p className="font-semibold">{radio.situacao}</p>
                    </div>
                    <div>
                      <p className="text-sm text-default-500">Entidade</p>
                      <p className="font-semibold">{radio.entidade_nome}</p>
                    </div>
                    <div>
                      <p className="text-sm text-default-500">Grupo</p>
                      <p className="font-semibold">{radio.grupo_nome}</p>
                    </div>
                  </div>
                </CardBody>
              </Card>

              <Divider className="my-4" />

              <RadioStatusChart radioId={radio.id} radioIdentificador={radio.identificador} />
            </div>
          )}
        </ModalBody>
        <ModalFooter>
          <Button color="danger" variant="light" onPress={onClose}>
            Fechar
          </Button>
        </ModalFooter>
      </ModalContent>
    </Modal>
  );
};

