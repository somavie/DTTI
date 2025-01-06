import { Request, Response } from "express";
import EntidadeService from "../services/entidadeService";

export default class EntidadeController {
  static async getAllEntidades(req: Request, res: Response) {
    try {
      const entidades = await EntidadeService.getAllEntidades();
      res.json(entidades);
    } catch (error) {
      res.status(500).json({ message: "Erro ao buscar entidades", error });
    }
  }

  static async getEntidadeById(req: Request, res: Response) {
    try {
      const { id } = req.params;
      const entidade = await EntidadeService.getEntidadeById(Number(id));
      if (entidade) {
        res.json(entidade);
      } else {
        res.status(404).json({ message: "Entidade não encontrada" });
      }
    } catch (error) {
      res.status(500).json({ message: "Erro ao buscar entidade", error });
    }
  }

  static async createEntidade(req: Request, res: Response) {
    try {
      const id = await EntidadeService.createEntidade(req.body);
      res.status(201).json({ id, message: "Entidade criada com sucesso" });
    } catch (error) {
      res.status(500).json({ message: "Erro ao criar entidade", error });
    }
  }

  static async updateEntidade(req: Request, res: Response) {
    try {
      const { id } = req.params;
      await EntidadeService.updateEntidade(Number(id), req.body);
      res.json({ message: "Entidade atualizada com sucesso" });
    } catch (error) {
      res.status(500).json({ message: "Erro ao atualizar entidade", error });
    }
  }

  static async deleteEntidade(req: Request, res: Response) {
    try {
      const { id } = req.params;
      await EntidadeService.deleteEntidade(Number(id));
      res.json({ message: "Entidade deletada com sucesso" });
    } catch (error) {
      res.status(500).json({ message: "Erro ao deletar entidade", error });
    }
  }

  static async getEntidadeRadios(req: Request, res: Response) {
    try {
      const { id } = req.params;
      const radios = await EntidadeService.getEntidadeRadios(Number(id));
      res.json(radios);
    } catch (error) {
      res.status(500).json({ message: "Erro ao buscar rádios da entidade", error });
    }
  }

  static async associateRadio(req: Request, res: Response) {
    const { id } = req.params;
    const { radio_id } = req.body;
    try {
      await EntidadeService.associateRadio(Number(id), Number(radio_id));
      res.sendStatus(204);
    } catch (error) {
      if (error instanceof Error) {
        res.status(400).json({ message: error.message });
      } else {
        res.status(500).json({ message: "Erro ao associar rádio à entidade" });
      }
    }
  }

  static async removeRadio(req: Request, res: Response) {
    const { entidadeId, radioId } = req.params;

    try {
      // Chama o service para remover o rádio
      await EntidadeService.removeRadio(Number(entidadeId), Number(radioId));

      return res.status(200).json({ message: "Rádio removido com sucesso." });
    } catch (error) {
      console.error("Erro ao remover rádio:", error);
      return res.status(500).json({ error: "Não foi possível remover o rádio." });
    }
  }
}

