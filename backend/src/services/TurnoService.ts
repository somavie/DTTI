// services/TurnoService.ts
import pool from "../utils/database";
import { RowDataPacket, ResultSetHeader } from "mysql2/promise";

export default class TurnoService {
  static async getAll() {
    const [rows] = await pool.query<RowDataPacket[]>(
      "SELECT * FROM turno WHERE estado = 1"
    );
    return rows;
  }

  static async getById(id: number) {
    const [rows] = await pool.query<RowDataPacket[]>(
      "SELECT * FROM turno WHERE id = ? AND estado = 1",
      [id]
    );
    return rows[0];
  }

  static async create(data: {
    hora_inicio: string;
    hora_fim: string;
    nome: string;
  }) {
    const [result] = await pool.query<ResultSetHeader>(
      "INSERT INTO turno (hora_inicio, hora_fim, nome) VALUES (?, ?, ?)",
      [data.hora_inicio, data.hora_fim, data.nome]
    );
    return result.insertId;
  }

  static async update(
    id: number,
    data: { hora_inicio: string; hora_fim: string; nome: string }
  ) {
    await pool.query(
      "UPDATE turno SET hora_inicio = ?, hora_fim = ?, nome = ?, data_alteracao = CURRENT_TIMESTAMP WHERE id = ?",
      [data.hora_inicio, data.hora_fim, data.nome, id]
    );
  }

  static async delete(id: number) {
    await pool.query(
      "UPDATE turno SET estado = 0, data_remocao = CURRENT_TIMESTAMP WHERE id = ?",
      [id]
    );
  }
}
