// services/GrupoService.ts
import pool from "../utils/database";
import { RowDataPacket, ResultSetHeader } from "mysql2/promise";

export default class GrupoService {
  static async getAll() {
    const [rows] = await pool.query<RowDataPacket[]>(
      "SELECT * FROM grupo WHERE estado = 1"
    );
    return rows;
  }

  static async getById(id: number) {
    const [rows] = await pool.query<RowDataPacket[]>(
      "SELECT * FROM grupo WHERE id = ? AND estado = 1",
      [id]
    );
    return rows[0];
  }

  static async create(data: { qtds: number; nome: string }) {
    const [result] = await pool.query<ResultSetHeader>(
      "INSERT INTO grupo (qtds, nome) VALUES (?, ?)",
      [data.qtds, data.nome]
    );
    return result.insertId;
  }

  static async update(id: number, data: { qtds: number; nome: string }) {
    await pool.query(
      "UPDATE grupo SET qtds = ?, nome = ?, data_alteracao = CURRENT_TIMESTAMP WHERE id = ?",
      [data.qtds, data.nome, id]
    );
  }

  static async delete(id: number) {
    await pool.query(
      "UPDATE grupo SET estado = 0, data_remocao = CURRENT_TIMESTAMP WHERE id = ?",
      [id]
    );
  }
}
