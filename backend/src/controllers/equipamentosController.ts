import { Request, Response } from "express";
import * as equipamentoService from "../services/EquipamentosService";

// Criar um novo equipamento
export const createEquipamento = async (req: Request, res: Response) => {
  try {
    const { nome, estado } = req.body;

    const newEquipamento = {
      nome: String(nome),
      estado: typeof estado === "boolean" ? estado : true,
    };

    const insertId = await equipamentoService.createEquipamento(newEquipamento);
    res
      .status(201)
      .json({ message: "Equipamento criado com sucesso!", id: insertId });
  } catch (error) {
    console.error("Erro ao criar equipamento:", error);
    res.status(500).json({ error: "Erro ao criar equipamento" });
  }
};

// Obter todos os equipamentos
export const getAllEquipamentos = async (req: Request, res: Response) => {
  try {
    const equipamentos = await equipamentoService.getAllEquipamentos();
    res.status(200).json(equipamentos);
  } catch (error) {
    console.error("Erro ao buscar equipamentos:", error);
    res.status(500).json({ error: "Erro ao buscar equipamentos" });
  }
};

// Obter equipamento por ID
export const getEquipamentoById = async (req: Request, res: Response) => {
  try {
    const id = Number(req.params.id);
    const equipamento = await equipamentoService.getEquipamentoById(id);

    if (!equipamento) {
      return res.status(404).json({ message: "Equipamento não encontrado" });
    }

    res.status(200).json(equipamento);
  } catch (error) {
    console.error("Erro ao buscar equipamento:", error);
    res.status(500).json({ error: "Erro ao buscar equipamento" });
  }
};

// Atualizar um equipamento por ID
export const updateEquipamento = async (req: Request, res: Response) => {
  try {
    const id = Number(req.params.id);
    const { nome, estado } = req.body;

    const updateData = {
      nome: nome ? String(nome) : undefined,
      estado: typeof estado === "boolean" ? estado : undefined,
    };

    const updated = await equipamentoService.updateEquipamento(id, updateData);

    if (!updated) {
      return res
        .status(404)
        .json({ message: "Equipamento não encontrado ou não atualizado" });
    }

    res.status(200).json({ message: "Equipamento atualizado com sucesso" });
  } catch (error) {
    console.error("Erro ao atualizar equipamento:", error);
    res.status(500).json({ error: "Erro ao atualizar equipamento" });
  }
};

// Soft delete de um equipamento
export const softDeleteEquipamento = async (req: Request, res: Response) => {
  try {
    const id = Number(req.params.id);

    const deleted = await equipamentoService.softDeleteEquipamento(id);

    if (!deleted) {
      return res.status(404).json({ message: "Equipamento não encontrado" });
    }

    res
      .status(200)
      .json({ message: "Equipamento removido com sucesso (soft delete)" });
  } catch (error) {
    console.error("Erro ao remover equipamento:", error);
    res.status(500).json({ error: "Erro ao remover equipamento" });
  }
};

// Deletar um equipamento permanentemente
export const deleteEquipamento = async (req: Request, res: Response) => {
  try {
    const id = Number(req.params.id);

    const deleted = await equipamentoService.deleteEquipamento(id);

    if (!deleted) {
      return res.status(404).json({ message: "Equipamento não encontrado" });
    }

    res
      .status(200)
      .json({ message: "Equipamento excluído permanentemente com sucesso" });
  } catch (error) {
    console.error("Erro ao excluir equipamento:", error);
    res.status(500).json({ error: "Erro ao excluir equipamento" });
  }
};
