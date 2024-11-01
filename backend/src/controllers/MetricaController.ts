// controllers/MetricaController.ts
import { Request, Response } from "express";
import MetricaService from "../services/MetricaService";

export default class MetricaController {
  static async getAll(req: Request, res: Response) {
    const metricas = await MetricaService.getAll();
    res.json(metricas);
  }

  static async getById(req: Request, res: Response) {
    const { id } = req.params;
    const metrica = await MetricaService.getById(Number(id));
    res.json(metrica);
  }
  static async getByDay(req: Request, res: Response) {
    const { data } = req.params;
    const metrica = await MetricaService.getByDay(String(data));
    res.json(metrica);
  }

  static async create(req: Request, res: Response) {
    const id = await MetricaService.create(req.body);
    res.status(201).json({ id });
  }

  static async update(req: Request, res: Response) {
    const { id } = req.params;
    await MetricaService.update(Number(id), req.body);
    res.sendStatus(204);
  }

  static async delete(req: Request, res: Response) {
    const { id } = req.params;
    await MetricaService.delete(Number(id));
    res.sendStatus(204);
  }
}
