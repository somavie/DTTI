import pool from "../utils/database";
import { RowDataPacket } from "mysql2";

// Interface para o tipo de dados Posto
interface Posto {
  id: number;
  nome: string | null;
  sigla: string | null;
  estado: boolean;
  data_criacao: Date;
  data_alteracao: Date;
}

// Criar um novo posto
export const createPosto = async (
  posto: Omit<Posto, "id" | "data_alteracao">
): Promise<number> => {
  const [result] = await pool.execute(
    `INSERT INTO posto (nome, sigla, estado, data_criacao) VALUES (?, ?, ?, ?)`,
    [posto.nome, posto.sigla, posto.estado, new Date()]
  );
  return (result as any).insertId;
};

// Obter todos os postos ativos
export const getAllPostos = async (): Promise<Posto[]> => {
  const [rows] = await pool.query<RowDataPacket[]>(
    `SELECT * FROM view_postos`
  );
  return rows as Posto[];
};

// Obter um posto por ID
export const getPostoById = async (id: number): Promise<Posto | null> => {
  const [rows] = await pool.query<RowDataPacket[]>(
    `SELECT * FROM posto WHERE id = ? AND estado = 1`,
    [id]
  );
  const [posto] = rows as Posto[];
  return posto || null;
};

// Atualizar um posto por ID
export const updatePosto = async (
  id: number,
  updateData: Partial<Omit<Posto, "id">>
): Promise<boolean> => {
  const { nome, sigla, estado } = updateData;

  const [result] = await pool.execute(
    `UPDATE posto SET nome = ?, sigla = ?, estado = ?, data_alteracao = ? WHERE id = ?`,
    [nome, sigla, estado, new Date(), id]
  );

  return (result as any).affectedRows > 0;
};

// Soft delete de um posto
export const softDeletePosto = async (id: number): Promise<boolean> => {
  const [result] = await pool.execute(
    `UPDATE posto SET estado = 0 WHERE id = ?`,
    [id]
  );
  return (result as any).affectedRows > 0;
};

// Excluir um posto permanentemente
export const deletePosto = async (id: number): Promise<boolean> => {
  const [result] = await pool.execute(`DELETE FROM posto WHERE id = ?`, [id]);
  return (result as any).affectedRows > 0;
};
