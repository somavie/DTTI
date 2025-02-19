import { Request, Response } from "express";
import * as situacaoService from "../services/SituacaoService";

// Criar uma nova situação
export const createSituacao = async (req: Request, res: Response) => {
  try {
    const { nome, estado } = req.body;

    const newSituacao = {
      nome: nome ? String(nome) : null,
      estado: typeof estado === "boolean" ? estado : true,
      data_criacao: new Date(),
    };

    const insertId = await situacaoService.createSituacao(newSituacao);
    res
      .status(201)
      .json({ message: "Situação criada com sucesso!", id: insertId });
  } catch (error) {
    console.error("Erro ao criar situação:", error);
    res.status(500).json({ error: "Erro ao criar situação" });
  }
};

// Obter todas as situações
export const getAllSituacoes = async (req: Request, res: Response) => {
  try {
    const situacoes = await situacaoService.getAllSituacoes();
    res.status(200).json(situacoes);
  } catch (error) {
    console.error("Erro ao buscar situações:", error);
    res.status(500).json({ error: "Erro ao buscar situações" });
  }
};

// Obter situação por ID
export const getSituacaoById = async (req: Request, res: Response) => {
  try {
    const id = Number(req.params.id);
    const situacao = await situacaoService.getSituacaoById(id);

    if (!situacao) {
      return res.status(404).json({ message: "Situação não encontrada" });
    }

    res.status(200).json(situacao);
  } catch (error) {
    console.error("Erro ao buscar situação:", error);
    res.status(500).json({ error: "Erro ao buscar situação" });
  }
};

// Atualizar uma situação por ID
export const updateSituacao = async (req: Request, res: Response) => {
  try {
    const id = Number(req.params.id);
    const { nome, estado, operacionabilidade } = req.body;
    
    const updateData = {
      nome: nome ? String(nome) : undefined,
      estado: estado !== undefined ? Boolean(estado) : undefined,
      operacionabilidade: operacionabilidade !== undefined ? Boolean(operacionabilidade) : undefined,
    };
    
    const updated = await situacaoService.updateSituacao(id, updateData);

    if (!updated) {
      return res
        .status(404)
        .json({ message: "Situação não encontrada ou não atualizada" });
    }

    res.status(200).json({ message: "Situação atualizada com sucesso" });
  } catch (error) {
    console.error("Erro ao atualizar situação:", error);
    res.status(500).json({ error: "Erro ao atualizar situação" });
  }
};

// Soft delete de uma situação
export const softDeleteSituacao = async (req: Request, res: Response) => {
  try {
    const id = Number(req.params.id);

    const deleted = await situacaoService.softDeleteSituacao(id);

    if (!deleted) {
      return res.status(404).json({ message: "Situação não encontrada" });
    }

    res
      .status(200)
      .json({ message: "Situação removida com sucesso (soft delete)" });
  } catch (error) {
    console.error("Erro ao remover situação:", error);
    res.status(500).json({ error: "Erro ao remover situação" });
  }
};

// Deletar uma situação permanentemente
export const deleteSituacao = async (req: Request, res: Response) => {
  try {
    const id = Number(req.params.id);

    const deleted = await situacaoService.deleteSituacao(id);

    if (!deleted) {
      return res.status(404).json({ message: "Situação não encontrada" });
    }

    res
      .status(200)
      .json({ message: "Situação excluída permanentemente com sucesso" });
  } catch (error) {
    console.error("Erro ao excluir situação:", error);
    res.status(500).json({ error: "Erro ao excluir situação" });
  }
};
