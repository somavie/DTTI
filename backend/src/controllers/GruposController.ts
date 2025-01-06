import { Request, Response } from "express";
import GruposService from "../services/GruposService";

export default class GruposController {
  static async getAll(req: Request, res: Response) {
    try {
      const grupos = await GruposService.getAll();
      res.json(grupos);
    } catch (error) {
      res.status(500).json({ message: "Erro ao buscar grupos", error });
    }
  }

  static async getById(req: Request, res: Response) {
    try {
      const { id } = req.params;
      const grupo = await GruposService.getById(Number(id));
      if (grupo) {
        res.json(grupo);
      } else {
        res.status(404).json({ message: "Grupo não encontrado" });
      }
    } catch (error) {
      res.status(500).json({ message: "Erro ao buscar grupo", error });
    }
  }

  static async create(req: Request, res: Response) {
    try {
      const id = await GruposService.create(req.body);
      res.status(201).json({ id, message: "Grupo criado com sucesso" });
    } catch (error) {
      res.status(500).json({ message: "Erro ao criar grupo", error });
    }
  }

  static async update(req: Request, res: Response) {
    try {
      const { id } = req.params;
      await GruposService.update(Number(id), req.body);
      res.json({ message: "Grupo atualizado com sucesso" });
    } catch (error) {
      res.status(500).json({ message: "Erro ao atualizar grupo", error });
    }
  }

  static async delete(req: Request, res: Response) {
    try {
      const { id } = req.params;
      await GruposService.delete(Number(id));
      res.json({ message: "Grupo deletado com sucesso" });
    } catch (error) {
      res.status(500).json({ message: "Erro ao deletar grupo", error });
    }
  }

  static async getEntidades(req: Request, res: Response) {
    try {
      const { id } = req.params;
      const entidades = await GruposService.getEntidades(Number(id));
      res.json(entidades);
    } catch (error) {
      res.status(500).json({ message: "Erro ao buscar entidades do grupo", error });
    }
  }

  static async associateEntidades(req: Request, res: Response) {
    try {
      const { id } = req.params;
      const { entidades } = req.body;
      await GruposService.associateEntidades(Number(id), entidades);
      res.sendStatus(204);
    } catch (error) {
      res.status(500).json({ message: "Erro ao associar entidades ao grupo", error });
    }
  }

  static async removeEntidadeFromGrupo(req: Request, res: Response) {
    try {
      const { grupoId, entidadeId } = req.params;
      await GruposService.removeEntidadeFromGrupo(Number(grupoId), Number(entidadeId));
      res.json({ message: "Entidade removida do grupo com sucesso" });
    } catch (error) {
      res.status(500).json({ message: "Erro ao remover entidade do grupo", error });
    }
  }

  static async getRadios(req: Request, res: Response) {
    try {
      const { id } = req.params;
      const radios = await GruposService.getRadios(Number(id));
      res.json(radios);
    } catch (error) {
      res.status(500).json({ message: "Erro ao buscar rádios do grupo", error });
    }
  }

  static async getGruposWithEntidadesAndRadios(req: Request, res: Response) { 
    try {
      const grupos = await GruposService.getGruposWithEntidadesAndRadios();
      res.json(grupos);
    } catch (error) {
      res.status(500).json({ message: "Erro ao buscar grupos com entidades e rádios", error });
    }
  }
}

