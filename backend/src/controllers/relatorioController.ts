import { Request, Response } from "express";
import * as relatorioService from "../services/RelatoriosService";

// Criar um novo relatório
export const createRelatorio = async (req: Request, res: Response) => {
  try {
    console.log("controller");
    const {
      tecnico_cessante_id,
      tecnico_entrante_id,
      data_criacao,
      observacoes_finais,
      estado,
    } = req.body;

    const newRelatorio = {
      tecnico_cessante_id: tecnico_cessante_id
        ? Number(tecnico_cessante_id)
        : null,
      tecnico_entrante_id: tecnico_entrante_id
        ? Number(tecnico_entrante_id)
        : null,
      data_criacao: new Date(data_criacao),
      observacoes_finais: observacoes_finais
        ? String(observacoes_finais)
        : null,
      estado: typeof estado === "boolean" ? estado : true,
    };

    const insertId = await relatorioService.createRelatorio(newRelatorio);
    res
      .status(201)
      .json({ message: "Relatório criado com sucesso!", id: insertId });
  } catch (error) {
    console.error("Erro ao criar relatório:", error);
    res.status(500).json({ error: "Erro ao criar relatório" });
  }
};

// Obter todos os relatórios
export const getAllRelatorios = async (req: Request, res: Response) => {
  try {
    const relatorios = await relatorioService.getAllRelatorios();
    res.status(200).json(relatorios);
  } catch (error) {
    console.error("Erro ao buscar relatórios:", error);
    res.status(500).json({ error: "Erro ao buscar relatórios" });
  }
};

// Obter relatório por ID
export const getRelatorioById = async (req: Request, res: Response) => {
  try {
    const id = Number(req.params.id);
    const relatorio = await relatorioService.getRelatorioById(id);

    if (!relatorio) {
      return res.status(404).json({ message: "Relatório não encontrado" });
    }

    res.status(200).json(relatorio);
  } catch (error) {
    console.error("Erro ao buscar relatório:", error);
    res.status(500).json({ error: "Erro ao buscar relatório" });
  }
};

// Atualizar um relatório por ID
export const updateRelatorio = async (req: Request, res: Response) => {
  try {
    const id = Number(req.params.id);
    const {
      tecnico_cessante_id,
      tecnico_entrante_id,
      data_criacao,
      observacoes_finais,
      estado,
    } = req.body;

    const updateData = {
      tecnico_cessante_id: tecnico_cessante_id
        ? Number(tecnico_cessante_id)
        : undefined,
      tecnico_entrante_id: tecnico_entrante_id
        ? Number(tecnico_entrante_id)
        : undefined,
      data_criacao: data_criacao ? new Date(data_criacao) : undefined,
      observacoes_finais: observacoes_finais
        ? String(observacoes_finais)
        : undefined,
      estado: typeof estado === "boolean" ? estado : undefined,
    };

    const updated = await relatorioService.updateRelatorio(id, updateData);

    if (!updated) {
      return res
        .status(404)
        .json({ message: "Relatório não encontrado ou não atualizado" });
    }

    res.status(200).json({ message: "Relatório atualizado com sucesso" });
  } catch (error) {
    console.error("Erro ao atualizar relatório:", error);
    res.status(500).json({ error: "Erro ao atualizar relatório" });
  }
};

// Soft delete de um relatório
export const softDeleteRelatorio = async (req: Request, res: Response) => {
  try {
    const id = Number(req.params.id);

    const deleted = await relatorioService.softDeleteRelatorio(id);

    if (!deleted) {
      return res.status(404).json({ message: "Relatório não encontrado" });
    }

    res
      .status(200)
      .json({ message: "Relatório removido com sucesso (soft delete)" });
  } catch (error) {
    console.error("Erro ao remover relatório:", error);
    res.status(500).json({ error: "Erro ao remover relatório" });
  }
};

// Deletar um relatório permanentemente
export const deleteRelatorio = async (req: Request, res: Response) => {
  try {
    const id = Number(req.params.id);

    const deleted = await relatorioService.deleteRelatorio(id);

    if (!deleted) {
      return res.status(404).json({ message: "Relatório não encontrado" });
    }

    res
      .status(200)
      .json({ message: "Relatório excluído permanentemente com sucesso" });
  } catch (error) {
    console.error("Erro ao excluir relatório:", error);
    res.status(500).json({ error: "Erro ao excluir relatório" });
  }
};
