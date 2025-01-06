import { Request, Response } from "express";
import RadioStatusService from "../services/radioStatusService";

export default class RadioStatusController {
  static async createRadioStatus(req: Request, res: Response) {
    try {
      const { radio_id, status, usuario } = req.body;
      const id = await RadioStatusService.createRadioStatus({ radio_id, status, usuario });
      res.status(201).json({ id, message: "Status do rádio registrado com sucesso" });
    } catch (error) {
      res.status(500).json({ message: "Erro ao registrar status do rádio", error });
    }
  }

  static async getRadioStatusData(req: Request, res: Response) {
    try {
      const { radioId, interval } = req.params;
      const data = await RadioStatusService.getRadioStatusData(Number(radioId), interval as 'week' | 'month' | 'year');
      res.json(data);
    } catch (error) {
      res.status(500).json({ message: "Erro ao buscar dados de status do rádio", error });
    }
  }

  static async getGroupEntitiesStatusData(req: Request, res: Response) {
    try {
      const { groupId } = req.params;
      const { interval } = req.query;
      const data = await RadioStatusService.getGroupEntitiesStatusData(
        Number(groupId),
        interval as 'week' | 'month' | 'year'
      );
      res.json(data);
    } catch (error) {
      res.status(500).json({ message: "Erro ao buscar dados de status das entidades do grupo", error });
    }
  }

  static async getGroupsStatusData(req: Request, res: Response) {
    try {
      const { interval } = req.query;
      const data = await RadioStatusService.getGroupsStatusData(interval as 'week' | 'month' | 'year');
      res.json(data);
    } catch (error) {
      res.status(500).json({ message: "Erro ao buscar dados de status dos grupos", error });
    }
  }
}

