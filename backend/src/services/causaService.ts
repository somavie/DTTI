import { RowDataPacket } from "mysql2/promise";
import pool from "../utils/database";

interface Causa extends RowDataPacket {
  id: number;
  descricao: string;
  estado: number;
  data_criacao?: Date;
  data_alteracao?: Date;
  data_remocao?: Date;
}

// Função para criar uma causa
export const createCausa = async (descricao: string): Promise<number> => {
  const [result] = await pool.query(
    "INSERT INTO causas (descricao) VALUES (?)",
    [descricao]
  );
  return (result as any).insertId;
};

// Função para obter todas as causas
export const getAllCausas = async (): Promise<Causa[]> => {
  const [rows] = await pool.query("SELECT * FROM causas WHERE estado = 1");
  return rows as Causa[];
};

// Função para obter uma causa por ID
export const getCausaById = async (id: number): Promise<Causa | null> => {
  const [rows] = await pool.query("SELECT * FROM causas WHERE id = ?", [id]);
  const result = rows as Causa[];
  return result.length > 0 ? result[0] : null;
};

// Função para atualizar uma causa
export const updateCausa = async (id: number, descricao: string): Promise<number> => {
  const [result] = await pool.query(
    "UPDATE causas SET descricao = ? WHERE id = ?",
    [descricao, id]
  );
  return (result as any).affectedRows;
};

// Função para deletar (desativar) uma causa
export const deleteCausa = async (id: number): Promise<number> => {
  const [result] = await pool.query(
    "UPDATE causas SET estado = 0 WHERE id = ?",
    [id]
  );
  return (result as any).affectedRows;
};
