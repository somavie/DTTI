import { Request, Response } from "express";
import * as tecnicoService from "../services/TecnicosService";

// Criar um técnico
export const createTecnico = async (req: Request, res: Response) => {
  try {
    const { nome, telefone, posto_id } = req.body;

    // Validação básica dos dados
    if (!nome || !posto_id) {
      return res.status(400).json({
        message: "Nome e Posto são obrigatórios.",
      });
    }

    const insertId = await tecnicoService.createTecnico(
      nome,
      telefone,
      posto_id
    );
    res.status(201).json({ id: insertId });
  } catch (error) {
    console.error("Erro ao criar técnico:", error);
    res.status(500).json({ error: "Erro desconhecido ao criar técnico" });
  }
};

// Obter todos os técnicos
export const getAllTecnicos = async (_req: Request, res: Response) => {
  try {
    const tecnicos = await tecnicoService.getAllTecnicos();
    res.status(200).json(tecnicos);
  } catch (error) {
    console.error("Erro ao obter técnicos:", error);
    res.status(500).json({ error: "Erro desconhecido ao obter técnicos" });
  }
};

// Obter um técnico por ID
export const getTecnicoById = async (req: Request, res: Response) => {
  try {
    const id = parseInt(req.params.id);
    const tecnico = await tecnicoService.getTecnicoById(id);
    if (tecnico) {
      res.status(200).json(tecnico);
    } else {
      res.status(404).json({ message: "Técnico não encontrado" });
    }
  } catch (error) {
    console.error("Erro ao obter técnico:", error);
    res.status(500).json({ error: "Erro desconhecido ao obter técnico" });
  }
};

// Atualizar um técnico
export const updateTecnico = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;

    // Validação básica dos dados
    if (!req.body) {
      return res
        .status(400)
        .json({ message: "Dados para atualização são obrigatórios." });
    }

    const updatedTecnico = await tecnicoService.updateTecnico(
      Number(id),
      req.body
    );
    if (updatedTecnico) {
      res.json({ message: "Técnico atualizado com sucesso" });
    } else {
      res.status(404).json({ message: "Técnico não encontrado" });
    }
  } catch (error) {
    console.error("Erro ao atualizar técnico:", error);
    res.status(500).json({ error: "Erro desconhecido ao atualizar técnico" });
  }
};

// Soft delete (remoção segura) de técnico
export const deleteTecnicoSoft = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const result = await tecnicoService.softDeleteTecnico(Number(id));
    if (result) {
      res.status(204).end(); // Sucesso sem conteúdo
    } else {
      res.status(404).json({ message: "Técnico não encontrado" });
    }
  } catch (error) {
    console.error("Erro ao remover técnico:", error);
    res.status(500).json({ error: "Erro desconhecido ao remover técnico" });
  }
};

// Deletar um técnico
export const deleteTecnico = async (req: Request, res: Response) => {
  try {
    const id = parseInt(req.params.id);
    const affectedRows = await tecnicoService.deleteTecnico(id);
    if (affectedRows > 0) {
      res.status(200).json({ message: "Técnico deletado com sucesso" });
    } else {
      res.status(404).json({ message: "Técnico não encontrado" });
    }
  } catch (error) {
    console.error("Erro ao deletar técnico:", error);
    res.status(500).json({ error: "Erro desconhecido ao deletar técnico" });
  }
};
