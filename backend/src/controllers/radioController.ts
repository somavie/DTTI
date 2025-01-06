import { Request, Response } from "express";
import RadioService from "../services/radioService";

export default class RadioController {
  static async getAllRadios(req: Request, res: Response) {
    try {
      const radios = await RadioService.getAllRadios();
      res.json(radios);
    } catch (error) {
      res.status(500).json({ message: "Erro ao buscar rádios", error });
    }
  }

  static async getRadioById(req: Request, res: Response) {
    try {
      const { id } = req.params;
      const radio = await RadioService.getRadioById(Number(id));
      if (radio) {
        res.json(radio);
      } else {
        res.status(404).json({ message: "Rádio não encontrado" });
      }
    } catch (error) {
      res.status(500).json({ message: "Erro ao buscar rádio", error });
    }
  }

  static async createRadio(req: Request, res: Response) {
    try {
      const id = await RadioService.createRadio(req.body);
      res.status(201).json({ id, message: "Rádio criado com sucesso" });
    } catch (error) {
      res.status(500).json({ message: "Erro ao criar rádio", error });
    }
  }

  static async updateRadio(req: Request, res: Response) {
    try {
      const { id } = req.params;
      await RadioService.updateRadio(Number(id), req.body);
      res.json({ message: "Rádio atualizado com sucesso" });
    } catch (error) {
      if (error instanceof Error) {
        res.status(400).json({ message: error.message });
      } else {
        res.status(500).json({ message: "Erro ao atualizar rádio" });
      }
    }
  }

  static async deleteRadio(req: Request, res: Response) {
    try {
      const { id } = req.params;
      await RadioService.deleteRadio(Number(id));
      res.json({ message: "Rádio deletado com sucesso" });
    } catch (error) {
      res.status(500).json({ message: "Erro ao deletar rádio", error });
    }
  }

  static async getRadioStatus(req: Request, res: Response) {
    try {
      const { startDate, endDate } = req.query;
      if (typeof startDate !== 'string' || typeof endDate !== 'string') {
        return res.status(400).json({ message: "Datas inválidas" });
      }
      const status = await RadioService.getRadioStatus(startDate, endDate);
      res.json(status);
    } catch (error) {
      res.status(500).json({ message: "Erro ao buscar status dos rádios", error });
    }
  }
}

