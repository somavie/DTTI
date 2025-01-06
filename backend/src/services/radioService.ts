import pool from "../utils/database";
import { RowDataPacket, ResultSetHeader } from "mysql2/promise";

export default class RadioService {
  static async getAllRadios() {
    const [rows] = await pool.query<RowDataPacket[]>(
      `SELECT r.*, e.nome as entidade_nome, g.nome as grupo_nome, e.id as entidade_id
      FROM radios r 
      LEFT JOIN entidade_radio er ON r.id = er.radio_id AND er.estado = 1
      LEFT JOIN entidades e ON er.entidade_id = e.id 
      LEFT JOIN grupos g ON e.grupo_id = g.id 
      WHERE r.estado = 1 
      ORDER BY r.identificador`
    );
    return rows;
  }

  static async getRadioById(id: number) {
    const [rows] = await pool.query<RowDataPacket[]>(
      "SELECT r.*, e.nome as entidade_nome, g.nome as grupo_nome FROM radios r LEFT JOIN entidade_radio er ON r.id = er.radio_id LEFT JOIN entidades e ON er.entidade_id = e.id LEFT JOIN grupos g ON e.grupo_id = g.id WHERE r.id = ? AND r.estado = 1",
      [id]
    );
    return rows[0];
  }

  static async createRadio(data: {
    numero_serie: string;
    identificador: string;
    localizacao: string;
    situacao: string;
    entidade_id?: number;
  }) {
    const connection = await pool.getConnection();
    try {
      await connection.beginTransaction();

      const [result] = await connection.query<ResultSetHeader>(
        "INSERT INTO radios (numero_serie, identificador, localizacao, situacao) VALUES (?, ?, ?, ?)",
        [data.numero_serie, data.identificador, data.localizacao, data.situacao]
      );

      const radioId = result.insertId;

      if (data.entidade_id) {
        await connection.query(
          "INSERT INTO entidade_radio (entidade_id, radio_id) VALUES (?, ?)",
          [data.entidade_id, radioId]
        );
      }

      await connection.commit();
      return radioId;
    } catch (error) {
      await connection.rollback();
      throw error;
    } finally {
      connection.release();
    }
  }

  static async updateRadio(id: number, data: {
    numero_serie?: string;
    identificador?: string;
    ativo?: boolean;
    localizacao?: string;
    situacao?: string;
    entidade_id?: number;
  }) {
    const connection = await pool.getConnection();
    try {
      await connection.beginTransaction();

      await connection.query(
        "UPDATE radios SET numero_serie = IFNULL(?, numero_serie), identificador = IFNULL(?, identificador), ativo = IFNULL(?, ativo), localizacao = IFNULL(?, localizacao), situacao = IFNULL(?, situacao) WHERE id = ?",
        [data.numero_serie, data.identificador, data.ativo, data.localizacao, data.situacao, id]
      );

      if (data.entidade_id !== undefined) {
        // Verificar se o rádio já está associado a alguma entidade
        const [existingAssociation] = await connection.query<RowDataPacket[]>(
          "SELECT entidade_id FROM entidade_radio WHERE radio_id = ? AND estado = 1",
          [id]
        );

        if (existingAssociation.length > 0 && existingAssociation[0].entidade_id !== data.entidade_id) {
          throw new Error("Este rádio já está associado a outra entidade.");
        }

        await connection.query(
          "UPDATE entidade_radio SET estado = 0, data_remocao = CURRENT_TIMESTAMP WHERE radio_id = ?",
          [id]
        );
        if (data.entidade_id) {
          await connection.query(
            "INSERT INTO entidade_radio (entidade_id, radio_id) VALUES (?, ?)",
            [data.entidade_id, id]
          );
        }
      }

      await connection.commit();
    } catch (error) {
      await connection.rollback();
      throw error;
    } finally {
      connection.release();
    }
  }

  static async deleteRadio(id: number) {
    await pool.query(
      "UPDATE radios SET estado = 0, data_remocao = CURRENT_TIMESTAMP WHERE id = ?",
      [id]
    );
  }

  static async getRadioStatus(startDate: string, endDate: string) {
    const [rows] = await pool.query<RowDataPacket[]>(
      `SELECT r.identificador, e.nome as entidade, g.nome as grupo, 
      COUNT(CASE WHEN m.qtds_online > 0 THEN 1 END) as online_count,
      COUNT(CASE WHEN m.qtds_offline > 0 THEN 1 END) as offline_count
      FROM radios r
      JOIN entidade_radio er ON r.id = er.radio_id
      JOIN entidades e ON er.entidade_id = e.id
      JOIN grupos g ON e.grupo_id = g.id
      LEFT JOIN métrica m ON g.id = m.grupo_id
      WHERE m.data_criacao BETWEEN ? AND ?
      GROUP BY r.id, e.id, g.id`,
      [startDate, endDate]
    );
    return rows;
  }
}

