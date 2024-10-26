import { ResultSetHeader, RowDataPacket } from "mysql2/promise";
import pool from "../utils/database";

// Interface para Técnico
interface Tecnico extends RowDataPacket {
  id: number;
  posto_id: number;
  estado: number;
  data_criacao?: Date;
  data_alteracao?: Date;
  data_remocao?: Date;
}

// Função para criar um técnico
export const createTecnico = async (
  id: number,
  posto_id: number
): Promise<number> => {
  try {
    const [result] = await pool.query<ResultSetHeader>(
      `INSERT INTO tecnicos (id, posto_id, estado)
       VALUES (?, ?, ?)`,
      [id, posto_id, 1] // Define estado como ativo (1)
    );
    return result.insertId;
  } catch (error) {
    console.error("Erro ao criar técnico:", error);
    throw error;
  }
};

// Função para obter todos os técnicos
export const getAllTecnicos = async (): Promise<Tecnico[]> => {
  const [rows] = await pool.query("SELECT * FROM view_tecnicos WHERE estado = 1");
  return rows as Tecnico[];
};

// Função para obter um técnico por ID
export const getTecnicoById = async (id: number): Promise<Tecnico | null> => {
  const [rows] = await pool.query(
    "SELECT * FROM tecnicos WHERE id = ? AND estado = 1",
    [id]
  );
  const result = rows as Tecnico[];
  return result.length > 0 ? result[0] : null;
};

// Função para atualizar um técnico
export const updateTecnico = async (
  id: number,
  tecnico: {
    posto_id?: number;
    estado?: number;
  }
): Promise<boolean> => {
  const fields: string[] = [];
  const values: any[] = [];

  if (tecnico.posto_id !== undefined) {
    fields.push("posto_id = ?");
    values.push(tecnico.posto_id);
  }

  if (tecnico.estado !== undefined) {
    fields.push("estado = ?");
    values.push(tecnico.estado);
  }

  if (fields.length === 0) {
    return false;
  }

  values.push(id);

  try {
    const [result] = await pool.query<ResultSetHeader>(
      `UPDATE tecnicos SET ${fields.join(", ")} WHERE id = ?`,
      values
    );
    return result.affectedRows > 0;
  } catch (error) {
    console.error("Erro ao atualizar técnico:", error);
    throw error;
  }
};

// Soft delete para técnico (remoção segura)
export const softDeleteTecnico = async (id: number): Promise<boolean> => {
  const [result] = await pool.query<ResultSetHeader>(
    "UPDATE tecnicos SET estado = 0 WHERE id = ?",
    [id]
  );
  return result.affectedRows > 0;
};

// Função para deletar um técnico permanentemente
export const deleteTecnico = async (id: number): Promise<number> => {
  const [result] = await pool.query<ResultSetHeader>(
    "DELETE FROM tecnicos WHERE id = ?",
    [id]
  );
  return result.affectedRows;
};
