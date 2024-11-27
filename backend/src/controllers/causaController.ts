import { Request, Response } from "express";
import * as causaService from "../services/causaService";

export const createCausa = async (req: Request, res: Response) => {
  try {
    const { descricao } = req.body;
    const insertId = await causaService.createCausa(descricao);
    res.status(201).json({ id: insertId, descricao });
  } catch (error) {
    res.status(500).json({ error: "Erro ao criar a causa" });
  }
};

export const getAllCausas = async (req: Request, res: Response) => {
  try {
    const causas = await causaService.getAllCausas();
    res.status(200).json(causas);
  } catch (error) {
    res.status(500).json({ error: "Erro ao obter as causas" });
  }
};

export const getCausaById = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const causa = await causaService.getCausaById(Number(id));
    if (causa) {
      res.status(200).json(causa);
    } else {
      res.status(404).json({ error: "Causa não encontrada" });
    }
  } catch (error) {
    res.status(500).json({ error: "Erro ao obter a causa" });
  }
};

export const updateCausa = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const { descricao } = req.body;
    const affectedRows = await causaService.updateCausa(Number(id), descricao);
    if (affectedRows > 0) {
      res.status(200).json({ id: Number(id), descricao });
    } else {
      res.status(404).json({ error: "Causa não encontrada" });
    }
  } catch (error) {
    res.status(500).json({ error: "Erro ao atualizar a causa" });
  }
};

export const deleteCausa = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const affectedRows = await causaService.deleteCausa(Number(id));
    if (affectedRows > 0) {
      res.status(204).send();
    } else {
      res.status(404).json({ error: "Causa não encontrada" });
    }
  } catch (error) {
    res.status(500).json({ error: "Erro ao deletar a causa" });
  }
};
