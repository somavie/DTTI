// controllers/TurnoController.ts
import { Request, Response } from "express";
import TurnoService from "../services/TurnoService";

export default class TurnoController {
  static async getAll(req: Request, res: Response) {
    const turnos = await TurnoService.getAll();
    res.json(turnos);
  }

  static async getById(req: Request, res: Response) {
    const { id } = req.params;
    const turno = await TurnoService.getById(Number(id));
    res.json(turno);
  }

  static async create(req: Request, res: Response) {
    const id = await TurnoService.create(req.body);
    res.status(201).json({ id });
  }

  static async update(req: Request, res: Response) {
    const { id } = req.params;
    await TurnoService.update(Number(id), req.body);
    res.sendStatus(204);
  }

  static async delete(req: Request, res: Response) {
    const { id } = req.params;
    await TurnoService.delete(Number(id));
    res.sendStatus(204);
  }
}
