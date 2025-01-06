import pool from "../utils/database";
import { ResultSetHeader, RowDataPacket } from "mysql2/promise";

export default class RadioStatusService {
  static async createRadioStatus(data: {
    radio_id: number;
    status: boolean;
    usuario: string;
  }) {
    const [result] = await pool.query<ResultSetHeader>(
      "INSERT INTO status_radios (radio_id, status, usuario) VALUES (?, ?, ?)",
      [data.radio_id, data.status ? 1 : 0, data.usuario]
    );
    return result.insertId;
  }

  static async getRadioStatusData(radioId: number, interval: 'week' | 'month' | 'year') {
    let dateFormat: string;
    let groupBy: string;
    let limit: number;

    switch (interval) {
      case 'week':
        dateFormat = '%Y-%m-%d';
        groupBy = 'DATE(data_hora)';
        limit = 7;
        break;
      case 'month':
        dateFormat = '%Y-%m-%d';
        groupBy = 'DATE(data_hora)';
        limit = 30;
        break;
      case 'year':
        dateFormat = '%Y-%m';
        groupBy = 'DATE_FORMAT(data_hora, "%Y-%m")';
        limit = 12;
        break;
    }

    const [rows] = await pool.query<RowDataPacket[]>(
      `SELECT 
        ${groupBy} as date,
        SUM(CASE WHEN status = 1 THEN 1 ELSE 0 END) as online,
        SUM(CASE WHEN status = 0 THEN 1 ELSE 0 END) as offline
      FROM status_radios
      WHERE radio_id = ?
      GROUP BY ${groupBy}
      ORDER BY ${groupBy} DESC
      LIMIT ?`,
      [radioId, limit]
    );

    return rows.reverse();
  }

  static async getGroupEntitiesStatusData(groupId: number, interval: 'week' | 'month' | 'year') {
    let dateFormat: string;
    let groupBy: string;
    let limit: number;

    switch (interval) {
      case 'week':
        dateFormat = '%Y-%m-%d';
        groupBy = 'DATE(sr.data_hora)';
        limit = 7;
        break;
      case 'month':
        dateFormat = '%Y-%m-%d';
        groupBy = 'DATE(sr.data_hora)';
        limit = 30;
        break;
      case 'year':
        dateFormat = '%Y-%m';
        groupBy = 'DATE_FORMAT(sr.data_hora, "%Y-%m")';
        limit = 12;
        break;
    }

    const [rows] = await pool.query<RowDataPacket[]>(
      `SELECT 
        e.nome as entidade,
        ROUND(AVG(CASE WHEN sr.status = 1 THEN 100 ELSE 0 END), 2) as percentagem
      FROM entidades e
      JOIN entidade_grupo eg ON e.id = eg.entidade_id
      JOIN entidade_radio er ON e.id = er.entidade_id
      JOIN status_radios sr ON er.radio_id = sr.radio_id
      WHERE eg.grupo_id = ?
      GROUP BY e.id, e.nome
      ORDER BY percentagem DESC
      LIMIT ?`,
      [groupId, limit]
    );

    return rows;
  }

  static async getGroupsStatusData(interval: 'week' | 'month' | 'year') {
    let dateFormat: string;
    let groupBy: string;
    let limit: number;

    switch (interval) {
      case 'week':
        dateFormat = '%Y-%m-%d';
        groupBy = 'DATE(sr.data_hora)';
        limit = 7;
        break;
      case 'month':
        dateFormat = '%Y-%m-%d';
        groupBy = 'DATE(sr.data_hora)';
        limit = 30;
        break;
      case 'year':
        dateFormat = '%Y-%m';
        groupBy = 'DATE_FORMAT(sr.data_hora, "%Y-%m")';
        limit = 12;
        break;
    }

    const [rows] = await pool.query<RowDataPacket[]>(
      `SELECT 
        g.nome as grupo,
        ROUND(AVG(CASE WHEN sr.status = 1 THEN 100 ELSE 0 END), 2) as percentagem
      FROM grupos g
      JOIN entidade_grupo eg ON g.id = eg.grupo_id
      JOIN entidade_radio er ON eg.entidade_id = er.entidade_id
      JOIN status_radios sr ON er.radio_id = sr.radio_id
      GROUP BY g.id, g.nome
      ORDER BY percentagem DESC
      LIMIT ?`,
      [limit]
    );

    return rows;
  }
}

