// controllers/GrupoController.ts
import { Request, Response } from "express";
import GrupoService from "../services/GrupoService";

export default class GrupoController {
  static async getAll(req: Request, res: Response) {
    const grupos = await GrupoService.getAll();
    res.json(grupos);
  }

  static async getById(req: Request, res: Response) {
    const { id } = req.params;
    const grupo = await GrupoService.getById(Number(id));
    res.json(grupo);
  }

  static async create(req: Request, res: Response) {
    const id = await GrupoService.create(req.body);
    res.status(201).json({ id });
  }

  static async update(req: Request, res: Response) {
    const { id } = req.params;
    await GrupoService.update(Number(id), req.body);
    res.sendStatus(204);
  }

  static async delete(req: Request, res: Response) {
    const { id } = req.params;
    await GrupoService.delete(Number(id));
    res.sendStatus(204);
  }
}
