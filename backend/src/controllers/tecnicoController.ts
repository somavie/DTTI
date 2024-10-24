import { Request, Response } from "express";
import {
  createTecnico,
  getAllTecnicos,
  getTecnicoById,
  updateTecnico,
  softDeleteTecnico,
  deleteTecnico,
} from "../services/TecnicosService";

// Função para criar um novo técnico
export const createTecnicoController = async (req: Request, res: Response) => {
  try {
    const { id, posto_id } = req.body;
    if (!id || !posto_id) {
      return res
        .status(400)
        .json({ message: "ID e posto_id são obrigatórios." });
    }
    const tecnicoId = await createTecnico(id, posto_id);
    return res.status(201).json({ tecnicoId });
  } catch (error) {
    console.error("Erro ao criar técnico:", error);
    return res.status(500).json({ message: "Erro ao criar técnico." });
  }
};

// Função para buscar todos os técnicos
export const getAllTecnicosController = async (
  _req: Request,
  res: Response
) => {
  try {
    const tecnicos = await getAllTecnicos();
    return res.status(200).json(tecnicos);
  } catch (error) {
    console.error("Erro ao buscar técnicos:", error);
    return res.status(500).json({ message: "Erro ao buscar técnicos." });
  }
};

// Função para buscar técnico por ID
export const getTecnicoByIdController = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const tecnico = await getTecnicoById(Number(id));
    if (!tecnico) {
      return res.status(404).json({ message: "Técnico não encontrado." });
    }
    return res.status(200).json(tecnico);
  } catch (error) {
    console.error("Erro ao buscar técnico:", error);
    return res.status(500).json({ message: "Erro ao buscar técnico." });
  }
};

// Função para atualizar um técnico
export const updateTecnicoController = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const tecnico = req.body;
    const sucesso = await updateTecnico(Number(id), tecnico);
    if (!sucesso) {
      return res
        .status(404)
        .json({
          message: "Técnico não encontrado ou sem dados para atualizar.",
        });
    }
    return res.status(200).json({ message: "Técnico atualizado com sucesso." });
  } catch (error) {
    console.error("Erro ao atualizar técnico:", error);
    return res.status(500).json({ message: "Erro ao atualizar técnico." });
  }
};

// Função para remover logicamente um técnico
export const softDeleteTecnicoController = async (
  req: Request,
  res: Response
) => {
  try {
    const { id } = req.params;
    const sucesso = await softDeleteTecnico(Number(id));
    if (!sucesso) {
      return res.status(404).json({ message: "Técnico não encontrado." });
    }
    return res.status(200).json({ message: "Técnico removido com sucesso." });
  } catch (error) {
    console.error("Erro ao remover técnico:", error);
    return res.status(500).json({ message: "Erro ao remover técnico." });
  }
};

// Função para deletar um técnico
export const deleteTecnicoController = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const linhasAfetadas = await deleteTecnico(Number(id));
    if (linhasAfetadas === 0) {
      return res.status(404).json({ message: "Técnico não encontrado." });
    }
    return res.status(200).json({ message: "Técnico deletado com sucesso." });
  } catch (error) {
    console.error("Erro ao deletar técnico:", error);
    return res.status(500).json({ message: "Erro ao deletar técnico." });
  }
};
