// observacaoController.ts
import { Request, Response } from "express";
import {
  createObservacao,
  getAllObservacoes,
  getObservacaoById,
  updateObservacao,
  softDeleteObservacao,
  deleteObservacao,
  getObservacaoByRelatorioNull,
  getObservacaoBysituacao_id,
} from "../services/ObservacaoService";

// Criar uma nova observação
export const createObservacaoController = async (
  req: Request,
  res: Response
) => {
  try {
    const observacao = req.body;

    const newObservacaoId = await createObservacao(observacao);
    res.status(201).json({ id: newObservacaoId });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Erro ao criar a observação." });
  }
};

// Obter todas as observações
export const getAllObservacoesController = async (
  req: Request,
  res: Response
) => {
  try {
    const observacoes = await getAllObservacoes();
    res.status(200).json(observacoes);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Erro ao obter as observações." });
  }
};

export const getObservacaoByIdController = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const observacao = await getObservacaoById(Number(id));
    if (observacao) {
      res.status(200).json(observacao);
    } else {
      res.status(404).json({ error: "Contato não encontrado" });
    }
  } catch (error) {
    res.status(500).json({ error: "Erro ao obter o observacao" });
  }
};

// Obter uma observação por ID de situaçao
export const getObservacaoBySituacao_idController = async (
  req: Request,
  res: Response
) => {
  const { situacao_id, relatorios_id } = req.params;

  try {
    const observacao = await getObservacaoBysituacao_id(
      Number(situacao_id),
      Number(relatorios_id)
    );
    if (observacao) {
      res.status(200).json(observacao);
    } else {
      res.status(404).json({ message: "Observação não encontrada." });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Erro ao obter a observação." });
  }
};

// Obter uma observação por Relatorio_ID
export const getObservacaoByRelatorioNullController = async (
  req: Request,
  res: Response
) => {
  const { relatorios_id } = req.params;

  try {
    const observacao = await getObservacaoByRelatorioNull(
      
      Number(relatorios_id)
    );
    if (observacao) {
      res.status(200).json(observacao);
    } else {
      res.status(404).json({ message: "Observações não encontrada." });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Erro ao obter a observação." });
  }
};


// Atualizar uma observação por ID
export const updateObservacaoController = async (req: Request, res: Response) => {
  const { id } = req.params;
  const updateData = req.body;

  try {
    const updated = await updateObservacao(Number(id), updateData);

    if (updated) {
      res.status(200).json({ message: "Observação atualizada com sucesso." });
    } else {
      res.status(404).json({ message: "Observação não encontrada." });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Erro ao atualizar a observação." });
  }
};

// Soft delete de uma observação
export const softDeleteObservacaoController = async (
  req: Request,
  res: Response
) => {
  const { situacao_id, relatorios_id } = req.params;

  try {
    const deleted = await softDeleteObservacao(
      Number(situacao_id),
      Number(relatorios_id)
    );
    if (deleted) {
      res.status(200).json({ message: "Observação deletada com sucesso." });
    } else {
      res.status(404).json({ message: "Observação não encontrada." });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Erro ao deletar a observação." });
  }
};

// Excluir uma observação permanentemente
export const deleteObservacaoController = async (
  req: Request,
  res: Response
) => {
  const { situacao_id, relatorios_id } = req.params;

  try {
    const deleted = await deleteObservacao(
      Number(situacao_id),
      Number(relatorios_id)
    );
    if (deleted) {
      res.status(200).json({ message: "Observação excluída permanentemente." });
    } else {
      res.status(404).json({ message: "Observação não encontrada." });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Erro ao excluir a observação." });
  }
};
