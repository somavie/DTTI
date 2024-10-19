import { Request, Response } from "express";
import * as tecnicoService from "../services/TecnicosService";

// Criar um novo técnico
export const createTecnico = async (req: Request, res: Response) => {
  try {
    const { nome, telefone, posto_id, estado } = req.body;

    const newTecnico = {
      nome: nome ? String(nome) : null,
      telefone: telefone ? String(telefone) : null,
      posto_id: posto_id,
      estado: typeof estado === "boolean" ? estado : true,
      data_criacao: new Date(),
    };

    const insertId = await tecnicoService.createTecnico(newTecnico);
    res
      .status(201)
      .json({ message: "Técnico criado com sucesso!", id: insertId });
  } catch (error) {
    console.error("Erro ao criar técnico:", error);
    res.status(500).json({ error: "Erro ao criar técnico" });
  }
};

// Obter todos os técnicos
export const getAllTecnicos = async (req: Request, res: Response) => {
  try {
    const tecnicos = await tecnicoService.getAllTecnicos();
    res.status(200).json(tecnicos);
  } catch (error) {
    console.error("Erro ao buscar técnicos:", error);
    res.status(500).json({ error: "Erro ao buscar técnicos" });
  }
};

// Obter técnico por ID
export const getTecnicoById = async (req: Request, res: Response) => {
  try {
    const id = Number(req.params.id);
    const tecnico = await tecnicoService.getTecnicoById(id);

    if (!tecnico) {
      return res.status(404).json({ message: "Técnico não encontrado" });
    }

    res.status(200).json(tecnico);
  } catch (error) {
    console.error("Erro ao buscar técnico:", error);
    res.status(500).json({ error: "Erro ao buscar técnico" });
  }
};

// Atualizar um técnico por ID
export const updateTecnico = async (req: Request, res: Response) => {
  try {
    const id = Number(req.params.id);
    const { nome, telefone, posto_id, estado } = req.body;

    const updateData = {
      nome: nome ? String(nome) : undefined,
      telefone: telefone ? String(telefone) : undefined,
      posto_id: posto_id,
      estado: typeof estado === "boolean" ? estado : undefined,
    };

    const updated = await tecnicoService.updateTecnico(id, updateData);

    if (!updated) {
      return res
        .status(404)
        .json({ message: "Técnico não encontrado ou não atualizado" });
    }

    res.status(200).json({ message: "Técnico atualizado com sucesso" });
  } catch (error) {
    console.error("Erro ao atualizar técnico:", error);
    res.status(500).json({ error: "Erro ao atualizar técnico" });
  }
};

// Soft delete de um técnico
export const softDeleteTecnico = async (req: Request, res: Response) => {
  try {
    const id = Number(req.params.id);

    const deleted = await tecnicoService.softDeleteTecnico(id);

    if (!deleted) {
      return res.status(404).json({ message: "Técnico não encontrado" });
    }

    res
      .status(200)
      .json({ message: "Técnico removido com sucesso (soft delete)" });
  } catch (error) {
    console.error("Erro ao remover técnico:", error);
    res.status(500).json({ error: "Erro ao remover técnico" });
  }
};

// Deletar um técnico permanentemente
export const deleteTecnico = async (req: Request, res: Response) => {
  try {
    const id = Number(req.params.id);

    const deleted = await tecnicoService.deleteTecnico(id);

    if (!deleted) {
      return res.status(404).json({ message: "Técnico não encontrado" });
    }

    res
      .status(200)
      .json({ message: "Técnico excluído permanentemente com sucesso" });
  } catch (error) {
    console.error("Erro ao excluir técnico:", error);
    res.status(500).json({ error: "Erro ao excluir técnico" });
  }
};
