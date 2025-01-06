import pool from "../utils/database";
import { RowDataPacket, ResultSetHeader } from "mysql2/promise";

export default class GruposService {
  static async getAll() {
    const [rows] = await pool.query<RowDataPacket[]>(
      "SELECT * FROM grupos WHERE estado = 1"
    );
    return rows;
  }

  static async getById(id: number) {
    const [rows] = await pool.query<RowDataPacket[]>(
      "SELECT * FROM grupos WHERE id = ? AND estado = 1",
      [id]
    );
    return rows[0];
  }

  static async create(data: { nome: string; codname: string }) {
    const [result] = await pool.query<ResultSetHeader>(
      "INSERT INTO grupos (nome, codname) VALUES (?, ?)",
      [data.nome, data.codname]
    );
    return result.insertId;
  }

  static async update(id: number, data: { codname: string; nome: string }) {
    await pool.query(
      "UPDATE grupos SET codname = ?, nome = ?, data_alteracao = CURRENT_TIMESTAMP WHERE id = ?",
      [data.codname, data.nome, id]
    );
  }

  static async delete(id: number) {
    await pool.query(
      "UPDATE grupos SET estado = 0, data_remocao = CURRENT_TIMESTAMP WHERE id = ?",
      [id]
    );
  }

  static async getEntidades(grupoId: number) {
    const [rows] = await pool.query<RowDataPacket[]>(
      `SELECT 
        e.*,
        GROUP_CONCAT(DISTINCT r.identificador) as radios_identificadores
       FROM entidades e
       JOIN entidade_grupo eg ON e.id = eg.entidade_id
       LEFT JOIN entidade_radio er ON e.id = er.entidade_id
       LEFT JOIN radios r ON er.radio_id = r.id
       WHERE eg.grupo_id = ? AND e.estado = 1 AND eg.estado = 1
       GROUP BY e.id`,
      [grupoId]
    );
    return rows;
  }

  static async associateEntidades(grupoId: number, entidades: number[]) {
    const connection = await pool.getConnection();
    try {
      await connection.beginTransaction();

      // Get current associations
      const [currentAssociations] = await connection.query<RowDataPacket[]>(
        "SELECT entidade_id FROM entidade_grupo WHERE grupo_id = ? AND estado = 1",
        [grupoId]
      );
      const currentEntidadeIds = currentAssociations.map(row => row.entidade_id);

      // Only add new associations
      const entitiesToAdd = entidades.filter(id => !currentEntidadeIds.includes(id));

      for (const entidadeId of entitiesToAdd) {
        await connection.query(
          "INSERT INTO entidade_grupo (entidade_id, grupo_id) VALUES (?, ?)",
          [entidadeId, grupoId]
        );
      }

      await connection.commit();
    } catch (error) {
      await connection.rollback();
      throw error;
    } finally {
      connection.release();
    }
  }

  static async removeEntidadeFromGrupo(grupoId: number, entidadeId: number) {
    await pool.query(
      "UPDATE entidade_grupo SET estado = 0, data_remocao = CURRENT_TIMESTAMP WHERE grupo_id = ? AND entidade_id = ? AND estado = 1",
      [grupoId, entidadeId]
    );
  }

  static async getRadios(grupoId: number) {
    const [rows] = await pool.query<RowDataPacket[]>(
      `SELECT r.* FROM radios r
       JOIN entidade_radio er ON r.id = er.radio_id
       JOIN entidades e ON er.entidade_id = e.id
       JOIN entidade_grupo eg ON e.id = eg.entidade_id
       WHERE eg.grupo_id = ? AND r.estado = 1`,
      [grupoId]
    );
    return rows;
  }

  static async getGruposWithEntidadesAndRadios() {
    const [rows] = await pool.query<RowDataPacket[]>(`
      SELECT 
        g.id AS grupo_id, 
        g.nome AS grupo_nome,
        e.id AS entidade_id, 
        e.nome AS entidade_nome,
        r.id AS radio_id, 
        r.identificador AS radio_identificador
      FROM grupos g
      LEFT JOIN entidade_grupo eg ON g.id = eg.grupo_id AND eg.estado = 1
      LEFT JOIN entidades e ON eg.entidade_id = e.id AND e.estado = 1
      LEFT JOIN entidade_radio er ON e.id = er.entidade_id AND er.estado = 1
      LEFT JOIN radios r ON er.radio_id = r.id AND r.estado = 1
      WHERE g.estado = 1
      ORDER BY g.id, e.id, r.id
    `);

    const grupos = rows.reduce((acc: any[], row: any) => {
      let grupo = acc.find(g => g.id === row.grupo_id);
      if (!grupo) {
        grupo = { id: row.grupo_id, nome: row.grupo_nome, entidades: [] };
        acc.push(grupo);
      }
      
      if (row.entidade_id) {
        let entidade = grupo.entidades.find((e: any) => e.id === row.entidade_id);
        if (!entidade) {
          entidade = { id: row.entidade_id, nome: row.entidade_nome, radios: [] };
          grupo.entidades.push(entidade);
        }
        
        if (row.radio_id) {
          entidade.radios.push({
            id: row.radio_id,
            identificador: row.radio_identificador
          });
        }
      }
      
      return acc;
    }, []);

    return grupos;
  }
}

