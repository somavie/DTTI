import pool from "../utils/database";
import { RowDataPacket } from "mysql2";

// Interface para o tipo de dados Técnico
interface Tecnico {
  id: number;
  nome: string | null;
  telefone: string | null;
  posto_id: number;
  estado: boolean;
  data_criacao: Date;
  data_alteracao: Date;
}

// Criar um novo técnico
export const createTecnico = async (
  tecnico: Omit<Tecnico, "id" | "data_alteracao">
): Promise<number> => {
  const [result] = await pool.execute(
    `INSERT INTO tecnicos (nome, telefone,posto_id, estado, data_criacao) VALUES (?, ?, ?, ?, ?)`,
    [
      tecnico.nome,
      tecnico.telefone,
      tecnico.posto_id,
      tecnico.estado,
      new Date(),
    ]
  );
  return (result as any).insertId;
};

// Obter todos os técnicos ativos
export const getAllTecnicos = async (): Promise<Tecnico[]> => {
  const [rows] = await pool.query<RowDataPacket[]>(
    `SELECT * FROM tecnicos WHERE estado = 1`
  );
  return rows as Tecnico[];
};

// Obter um técnico por ID
export const getTecnicoById = async (id: number): Promise<Tecnico | null> => {
  const [rows] = await pool.query<RowDataPacket[]>(
    `SELECT * FROM tecnicos WHERE id = ? AND estado = 1`,
    [id]
  );
  const [tecnico] = rows as Tecnico[];
  return tecnico || null;
};

// Atualizar um técnico por ID
export const updateTecnico = async (
  id: number,
  updateData: Partial<Omit<Tecnico, "id">>
): Promise<boolean> => {
  const { nome, telefone, posto_id, estado } = updateData;

  const [result] = await pool.execute(
    `UPDATE tecnicos SET nome = ?, telefone = ?, posto_id=?, estado = ?, data_alteracao = ? WHERE id = ?`,
    [nome, telefone, posto_id, estado, new Date(), id]
  );

  return (result as any).affectedRows > 0;
};

// Soft delete de um técnico
export const softDeleteTecnico = async (id: number): Promise<boolean> => {
  const [result] = await pool.execute(
    `UPDATE tecnicos SET estado = 0 WHERE id = ?`,
    [id]
  );
  return (result as any).affectedRows > 0;
};

// Excluir um técnico permanentemente
export const deleteTecnico = async (id: number): Promise<boolean> => {
  const [result] = await pool.execute(`DELETE FROM tecnicos WHERE id = ?`, [
    id,
  ]);
  return (result as any).affectedRows > 0;
};
