import pool from "../utils/database";
import { RowDataPacket } from "mysql2";

// Interface para o tipo de dados Situação
interface Situacao {
  id: number;
  nome: string | null;
  estado: boolean;
  data_criacao: Date;
  data_alteracao: Date;
}

// Criar uma nova situação
export const createSituacao = async (
  situacao: Omit<Situacao, "id" | "data_alteracao">
): Promise<number> => {
  const [result] = await pool.execute(
    `INSERT INTO situacao (nome, estado, data_criacao) VALUES (?, ?, ?)`,
    [situacao.nome, situacao.estado, new Date()]
  );
  return (result as any).insertId;
};

// Obter todas as situações ativas
export const getAllSituacoes = async (): Promise<Situacao[]> => {
  const [rows] = await pool.query<RowDataPacket[]>(
    `SELECT * FROM situacao WHERE estado = 1`
  );
  return rows as Situacao[];
};

// Obter uma situação por ID
export const getSituacaoById = async (id: number): Promise<Situacao | null> => {
  const [rows] = await pool.query<RowDataPacket[]>(
    `SELECT * FROM situacao WHERE id = ? AND estado = 1`,
    [id]
  );
  const [situacao] = rows as Situacao[];
  return situacao || null;
};

// Atualizar uma situação por ID
export const updateSituacao = async (
  id: number,
  updateData: Partial<Omit<Situacao, "id">>
): Promise<boolean> => {
  const { nome, estado } = updateData;

  const [result] = await pool.execute(
    `UPDATE situacao SET nome = ?, estado = ?, data_alteracao = ? WHERE id = ?`,
    [nome, estado, new Date(), id]
  );

  return (result as any).affectedRows > 0;
};

// Soft delete de uma situação
export const softDeleteSituacao = async (id: number): Promise<boolean> => {
  const [result] = await pool.execute(
    `UPDATE situacao SET estado = 0 WHERE id = ?`,
    [id]
  );
  return (result as any).affectedRows > 0;
};

// Excluir uma situação permanentemente
export const deleteSituacao = async (id: number): Promise<boolean> => {
  const [result] = await pool.execute(`DELETE FROM situacao WHERE id = ?`, [
    id,
  ]);
  return (result as any).affectedRows > 0;
};
