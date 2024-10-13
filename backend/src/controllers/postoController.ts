import { Request, Response } from "express";
import * as postoService from "../services/PostoService";

// Criar um novo posto
export const createPosto = async (req: Request, res: Response) => {
  try {
    const { nome, sigla, estado } = req.body;

    const newPosto = {
      nome: nome ? String(nome) : null,
      sigla: sigla ? String(sigla) : null,
      estado: typeof estado === "boolean" ? estado : true,
      data_criacao: new Date(),
    };

    const insertId = await postoService.createPosto(newPosto);
    res
      .status(201)
      .json({ message: "Posto criado com sucesso!", id: insertId });
  } catch (error) {
    console.error("Erro ao criar posto:", error);
    res.status(500).json({ error: "Erro ao criar posto" });
  }
};

// Obter todos os postos
export const getAllPostos = async (req: Request, res: Response) => {
  try {
    const postos = await postoService.getAllPostos();
    res.status(200).json(postos);
  } catch (error) {
    console.error("Erro ao buscar postos:", error);
    res.status(500).json({ error: "Erro ao buscar postos" });
  }
};

// Obter posto por ID
export const getPostoById = async (req: Request, res: Response) => {
  try {
    const id = Number(req.params.id);
    const posto = await postoService.getPostoById(id);

    if (!posto) {
      return res.status(404).json({ message: "Posto não encontrado" });
    }

    res.status(200).json(posto);
  } catch (error) {
    console.error("Erro ao buscar posto:", error);
    res.status(500).json({ error: "Erro ao buscar posto" });
  }
};

// Atualizar um posto por ID
export const updatePosto = async (req: Request, res: Response) => {
  try {
    const id = Number(req.params.id);
    const { nome, sigla, estado } = req.body;

    const updateData = {
      nome: nome ? String(nome) : undefined,
      sigla: sigla ? String(sigla) : undefined,
      estado: typeof estado === "boolean" ? estado : undefined,
    };

    const updated = await postoService.updatePosto(id, updateData);

    if (!updated) {
      return res
        .status(404)
        .json({ message: "Posto não encontrado ou não atualizado" });
    }

    res.status(200).json({ message: "Posto atualizado com sucesso" });
  } catch (error) {
    console.error("Erro ao atualizar posto:", error);
    res.status(500).json({ error: "Erro ao atualizar posto" });
  }
};

// Soft delete de um posto
export const softDeletePosto = async (req: Request, res: Response) => {
  try {
    const id = Number(req.params.id);

    const deleted = await postoService.softDeletePosto(id);

    if (!deleted) {
      return res.status(404).json({ message: "Posto não encontrado" });
    }

    res
      .status(200)
      .json({ message: "Posto removido com sucesso (soft delete)" });
  } catch (error) {
    console.error("Erro ao remover posto:", error);
    res.status(500).json({ error: "Erro ao remover posto" });
  }
};

// Deletar um posto permanentemente
export const deletePosto = async (req: Request, res: Response) => {
  try {
    const id = Number(req.params.id);

    const deleted = await postoService.deletePosto(id);

    if (!deleted) {
      return res.status(404).json({ message: "Posto não encontrado" });
    }

    res
      .status(200)
      .json({ message: "Posto excluído permanentemente com sucesso" });
  } catch (error) {
    console.error("Erro ao excluir posto:", error);
    res.status(500).json({ error: "Erro ao excluir posto" });
  }
};
