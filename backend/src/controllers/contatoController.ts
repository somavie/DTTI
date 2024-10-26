import { Request, Response } from "express";
import * as contatoService from "../services/contatoService";

// Handler para criar um contato
export const createContato = async (req: Request, res: Response) => {
  try {
    const { pessoa_id, tipo, valor } = req.body;
    const insertId = await contatoService.createContato(pessoa_id, tipo, valor);
    res.status(201).json({ id: insertId, pessoa_id, tipo, valor });
  } catch (error) {
    res.status(500).json({ error: "Erro ao criar o contato" });
  }
};

// Handler para obter todos os contatos
export const getAllContatos = async (req: Request, res: Response) => {
  try {
    const contatos = await contatoService.getAllContatos();
    res.status(200).json(contatos);
  } catch (error) {
    res.status(500).json({ error: "Erro ao obter os contatos" });
  }
};

// Handler para obter um contato por ID
export const getContatoById = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const contato = await contatoService.getContatoById(Number(id));
    if (contato) {
      res.status(200).json(contato);
    } else {
      res.status(404).json({ error: "Contato não encontrado" });
    }
  } catch (error) {
    res.status(500).json({ error: "Erro ao obter o contato" });
  }
};

// Handler para atualizar um contato
export const updateContato = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const { pessoa_id, tipo, valor } = req.body;
    const affectedRows = await contatoService.updateContato(
      Number(id),
      pessoa_id,
      tipo,
      valor
    );
    if (affectedRows > 0) {
      res.status(200).json({ id: Number(id), pessoa_id, tipo, valor });
    } else {
      res.status(404).json({ error: "Contato não encontrado" });
    }
  } catch (error) {
    res.status(500).json({ error: "Erro ao atualizar o contato" });
  }
};

// Handler para deletar um contato
export const deleteContato = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const affectedRows = await contatoService.deleteContato(Number(id));
    if (affectedRows > 0) {
      res.status(204).send();
    } else {
      res.status(404).json({ error: "Contato não encontrado" });
    }
  } catch (error) {
    res.status(500).json({ error: "Erro ao deletar o contato" });
  }
};
