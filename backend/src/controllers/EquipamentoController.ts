import { Request, Response } from "express";
import * as equipamentoService from "../services/EquipamentoService";

// Criar um novo equipamento
export const createEquipamento = async (req: Request, res: Response) => {
  try {
    const { equipamento_id, relatorios_id, quantidade, status, localizacao } =
      req.body;

    const newEquipamento = {
      equipamentos_id: Number(equipamento_id),
      relatorios_id: Number(relatorios_id),
      quantidade: Number(quantidade),
      status: String(status),
      localizacao: localizacao ? String(localizacao) : null,
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
    const equipamentos_id = Number(req.params.id);
    const equipamento = await equipamentoService.getEquipamentoById(
      equipamentos_id
    );

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
    const equipamentos_id = Number(req.params.id);
    const { relatorios_id, quantidade, status, localizacao, data_verificacao } =
      req.body;

    const updateData = {
      relatorios_id: relatorios_id ? Number(relatorios_id) : undefined,
      quantidade: quantidade ? Number(quantidade) : undefined,
      status: status ? String(status) : undefined,
      localizacao: localizacao ? String(localizacao) : undefined,
      data_verificacao: data_verificacao
        ? new Date(data_verificacao)
        : undefined,
    };

    const updated = await equipamentoService.updateEquipamento(
      equipamentos_id,
      updateData
    );

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

// Remover um equipamento (soft delete)
export const softDeleteEquipamento = async (req: Request, res: Response) => {
  try {
    const equipamentos_id = Number(req.params.id);

    const deleted = await equipamentoService.softDeleteEquipamento(
      equipamentos_id
    );

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
    const equipamentos_id = Number(req.params.id);

    const deleted = await equipamentoService.deleteEquipamento(equipamentos_id);

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
