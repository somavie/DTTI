import pool from "../utils/database";
import { RowDataPacket } from "mysql2";

// Interface para o tipo de dados Equipamento
interface Equipamento {
  id: number;
  nome: string;
  estado: boolean;
  data_criacao: Date;
  data_alteracao: Date;
  data_remocao?: Date | null; // Tornar data_remocao opcional
}

// Criar um novo equipamento
export const createEquipamento = async (
  equipamento: Omit<Equipamento, "id" | "data_alteracao" | "data_criacao">
): Promise<number> => {
  const [result] = await pool.execute(
    `INSERT INTO equipamentos (nome, estado, data_remocao) VALUES (?, ?, ?)`,
    [equipamento.nome, equipamento.estado, null] // Passando null para data_remocao
  );
  return (result as any).insertId;
};

// Obter todos os equipamentos ativos
export const getAllEquipamentos = async (): Promise<Equipamento[]> => {
  const [rows] = await pool.query<RowDataPacket[]>(
    `SELECT * FROM equipamentos WHERE estado = 1`
  );
  return rows as Equipamento[];
};

// Obter um equipamento por ID
export const getEquipamentoById = async (
  id: number
): Promise<Equipamento | null> => {
  const [rows] = await pool.query<RowDataPacket[]>(
    `SELECT * FROM equipamentos WHERE id = ? AND estado = 1`,
    [id]
  );
  const [equipamento] = rows as Equipamento[];
  return equipamento || null;
};

// Atualizar um equipamento por ID
export const updateEquipamento = async (
  id: number,
  updateData: Partial<Omit<Equipamento, "id">>
): Promise<boolean> => {
  const { nome, estado } = updateData;

  const [result] = await pool.execute(
    `UPDATE equipamentos SET nome = ?, estado = ?, data_alteracao = ? WHERE id = ?`,
    [nome, estado, new Date(), id]
  );

  return (result as any).affectedRows > 0;
};

// Soft delete de um equipamento
export const softDeleteEquipamento = async (id: number): Promise<boolean> => {
  const [result] = await pool.execute(
    `UPDATE equipamentos SET estado = 0 WHERE id = ?`,
    [id]
  );
  return (result as any).affectedRows > 0;
};

// Excluir um equipamento permanentemente
export const deleteEquipamento = async (id: number): Promise<boolean> => {
  const [result] = await pool.execute(`DELETE FROM equipamentos WHERE id = ?`, [
    id,
  ]);
  return (result as any).affectedRows > 0;
};
