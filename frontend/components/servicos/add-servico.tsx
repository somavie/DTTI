import {
    Button,
    Input,
    Modal,
    ModalBody,
    ModalContent,
    ModalFooter,
    ModalHeader,
    useDisclosure,
    Checkbox
} from "@nextui-org/react";
import React from "react";
import { Formik, FormikHelpers } from "formik";
import api from "../../helpers/api";


import { useCallback } from "react";
import { ServicoType } from "./servico";
import { object, string } from "yup";

export const ServicoSchema = object().shape({
  nome: string()
    .required("O nome do Serviço é obrigatório")
    .max(100, "O nome pode ter no máximo 100 caracteres"),
});

interface AddServicoProps {
    editingServico: ServicoType | null;
    onCloseAndRefresh: () => void;
    isOpen: boolean;
    onOpenChange: (open: boolean) => void;
}

export const AddServico = ({
    editingServico,
    onCloseAndRefresh,
    isOpen,
    onOpenChange,
}: AddServicoProps) => {
    interface ServicoFormType {
        nome: string;
        estado?: boolean;
        id: number;
    }

    const initialValues: ServicoFormType = {
        nome: editingServico?.nome || "",
        estado: editingServico?.estado || true,
        id: editingServico?.id || 0,
    };

    const handleServicoSubmit = useCallback(
        async (
            values: typeof initialValues,
            { resetForm }: FormikHelpers<typeof initialValues>
        ) => {
            try {
                if (editingServico) {
                    await api.put(`/situacoes/${editingServico.id}`, values);
                } else {
                    await api.post("/situacoes", values);
                }

                resetForm();
                onCloseAndRefresh();
                onOpenChange(false);
            } catch (error) {
                console.error("Erro ao criar/atualizar serviço:", error);
            }
        },
        [editingServico, onCloseAndRefresh, onOpenChange]
    );

    return (
        <div>
            <Modal isOpen={isOpen} onOpenChange={onOpenChange} placement="top-center">
                <ModalContent>
                    {(onClose) => (
                        <>
                            <ModalHeader className="flex flex-col gap-1">
                                {editingServico ? "Editar Serviço" : "Cadastro de Serviço"}
                            </ModalHeader>
                            <ModalBody>
                                <Formik
                                    initialValues={editingServico || initialValues}
                                    enableReinitialize
                                    validationSchema={ServicoSchema}
                                    onSubmit={handleServicoSubmit}
                                >
                                    {({
                                        values,
                                        errors,
                                        touched,
                                        handleChange,
                                        handleSubmit,
                                        setFieldValue,
                                    }) => (
                                        <>
                                            <div className="flex flex-col gap-4 mb-4">
                                                <Input
                                                    variant="bordered"
                                                    label="Nome do Serviço"
                                                    value={values.nome}
                                                    isInvalid={!!errors.nome && !!touched.nome}
                                                    errorMessage={errors.nome}
                                                    onChange={handleChange("nome")}
                                                />
                                            </div>

                                            <Checkbox
                                                isSelected={values.estado}
                                                onValueChange={(checked) => setFieldValue("estado", checked)}
                                            >
                                                Estado do Serviço
                                            </Checkbox>
                                            <Button
                                                onPress={() => {
                                                    handleSubmit();
                                                    onClose();
                                                }}
                                                variant="flat"
                                                color="primary"
                                                className="w-full bg-blue-600 hover:bg-blue-700 text-white"
                                            >
                                                {editingServico ? "Atualizar Serviço" : "Cadastrar Serviço"}
                                            </Button>
                                        </>
                                    )}
                                </Formik>
                            </ModalBody>
                        </>
                    )}
                </ModalContent>
            </Modal>
        </div>
    );
};