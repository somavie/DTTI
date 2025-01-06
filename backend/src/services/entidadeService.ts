import pool from "../utils/database";
import { RowDataPacket, ResultSetHeader } from "mysql2/promise";

export default class EntidadeService {
  static async getAllEntidades() {
    const [rows] = await pool.query<RowDataPacket[]>(
      `SELECT 
          e.*, 
          g.nome AS grupo_nome, 
          eg.estado AS estado_associacao_grupo,
          eg.data_criacao AS data_associacao_grupo,
          r.identificador AS radio_nome,
          er.estado AS estado_associacao_radio,
          er.data_criacao AS data_associacao_radio
      FROM 
          entidades e
      LEFT JOIN 
          entidade_grupo eg ON e.id = eg.entidade_id
      LEFT JOIN 
          grupos g ON eg.grupo_id = g.id
      LEFT JOIN 
          entidade_radio er ON e.id = er.entidade_id AND er.estado = 1
      LEFT JOIN 
          radios r ON er.radio_id = r.id
      WHERE 
          e.estado = 1;`
    );
    return rows;
  }

  static async getEntidadeById(id: number) {
    const [rows] = await pool.query<RowDataPacket[]>(
      `SELECT e.*, g.nome as grupo_nome, r.id as radio_id, r.identificador as radio_identificador 
       FROM entidades e 
       LEFT JOIN grupos g ON e.grupo_id = g.id 
       LEFT JOIN entidade_radio er ON e.id = er.entidade_id And er.estado = 1
       LEFT JOIN radios r ON er.radio_id = r.id 
       WHERE e.id = ? AND e.estado = 1`,
      [id]
    );
    return rows[0];
  }

  static async createEntidade(data: {
    nome: string;
    grupo_id: number;
    indicativo: number;
  }) {
    const [result] = await pool.query<ResultSetHeader>(
      "INSERT INTO entidades (nome, grupo_id, indicativo) VALUES (?, ?, ?)",
      [data.nome, data.grupo_id, data.indicativo]
    );
    return result.insertId;
  }

  static async updateEntidade(id: number, data: {
    nome?: string;
    grupo_id?: number;
    indicativo?: number;
  }) {
    await pool.query(
      "UPDATE entidades SET nome = IFNULL(?, nome), grupo_id = IFNULL(?, grupo_id), indicativo = IFNULL(?, indicativo) WHERE id = ?",
      [data.nome, data.grupo_id, data.indicativo, id]
    );
  }

  static async deleteEntidade(id: number) {
    await pool.query(
      "UPDATE entidades SET estado = 0, data_remocao = CURRENT_TIMESTAMP WHERE id = ?",
      [id]
    );
  }

  static async associateRadio(entidadeId: number, radioId: number) {
    const connection = await pool.getConnection();
    try {
      await connection.beginTransaction();

      // Verificar se o rádio já está associado a alguma entidade
      const [existingAssociation] = await connection.query<RowDataPacket[]>(
        "SELECT entidade_id FROM entidade_radio WHERE radio_id = ? AND estado = 1",
        [radioId]
      );

      if (existingAssociation.length > 0) {
        throw new Error("Este rádio já está associado a outra entidade.");
      }

      // Remover qualquer associação existente para esta entidade
      await connection.query(
        "UPDATE entidade_radio SET estado = 0, data_remocao = CURRENT_TIMESTAMP WHERE entidade_id = ? AND estado = 1",
        [entidadeId]
      );

      // Criar nova associação
      await connection.query(
        "INSERT INTO entidade_radio (entidade_id, radio_id) VALUES (?, ?)",
        [entidadeId, radioId]
      );

      await connection.commit();
    } catch (error) {
      await connection.rollback();
      throw error;
    } finally {
      connection.release();
    }
  }

  static async getEntidadeRadios(id: number) {
    const [rows] = await pool.query<RowDataPacket[]>(
      `SELECT r.* FROM radios r
       JOIN entidade_radio er ON r.id = er.radio_id
       WHERE er.entidade_id = ? AND r.estado = 1`,
      [id]
    );
    return rows;
  }
  static async removeRadio(entidadeId: number, radioId: number) {
    await pool.query(
      "UPDATE entidade_radio SET estado = 0, data_remocao = CURRENT_TIMESTAMP WHERE entidade_id = ? AND radio_id = ? AND estado = 1",
      [entidadeId, radioId]
    );
  }
}

