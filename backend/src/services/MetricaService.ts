// services/MetricaService.ts
import pool from "../utils/database";
import { RowDataPacket, ResultSetHeader } from "mysql2/promise";

export default class MetricaService {
  static async getAll() {
    const [rows] = await pool.query<RowDataPacket[]>(
      "SELECT * FROM métrica WHERE estado = 1"
    );
    return rows;
  }

  static async getById(id: number) {
    const [rows] = await pool.query<RowDataPacket[]>(
      "SELECT * FROM métrica WHERE id = ? AND estado = 1",
      [id]
    );
    return rows[0];
  }
  static async getByDay(date: string) {
    const [rows] = await pool.query<RowDataPacket[]>(
      "SELECT * FROM view_metrica_dia WHERE data_criacao = ?",
      [date]
    );
    return rows;
  }

  static async create(data: {
    grupo_id: number;
    turno_id: number;
    relatorio_id: number;
    qtds_online: number;
    qtds_offline: number;
  }) {
    const [result] = await pool.query<ResultSetHeader>(
      "INSERT INTO métrica (grupo_id, turno_id, relatorio_id, qtds_online, qtds_offline) VALUES (?, ?, ?, ?, ?)",
      [
        data.grupo_id,
        data.turno_id,
        data.relatorio_id,
        data.qtds_online,
        data.qtds_offline,
      ]
    );
    return result.insertId;
  }

  static async update(
    id: number,
    data: { qtds_online: number; qtds_offline: number }
  ) {
    await pool.query(
      "UPDATE métrica SET qtds_online = ?, qtds_offline = ?, data_alteracao = CURRENT_TIMESTAMP WHERE id = ?",
      [data.qtds_online, data.qtds_offline, id]
    );
  }

  static async delete(id: number) {
    await pool.query(
      "UPDATE métrica SET estado = 0, data_remocao = CURRENT_TIMESTAMP WHERE id = ?",
      [id]
    );
  }
}
