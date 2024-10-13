import pool from "../utils/database";
import { RowDataPacket } from "mysql2";

// Interface para o tipo de dados Relatório
interface Relatorio {
  id: number;
  tecnico_cessante_id: number | null;
  tecnico_entrante_id: number | null;
  data_criacao: Date;
  observacoes_finais: string | null;
  estado: boolean;
  data_criacao_registro: Date;
  data_alteracao: Date;
}

// Criar um novo relatório
export const createRelatorio = async (
  relatorio: Omit<Relatorio, "id" | "data_alteracao" | "data_criacao_registro">
): Promise<number> => {
  const [result] = await pool.execute(
    `INSERT INTO relatorios (tecnico_cessante_id, tecnico_entrante_id, data_criacao, observacoes_finais, estado) 
     VALUES (?, ?, ?, ?, ?)`,
    [
      relatorio.tecnico_cessante_id,
      relatorio.tecnico_entrante_id,
      relatorio.data_criacao,
      relatorio.observacoes_finais,
      relatorio.estado,
    ]
  );
  return (result as any).insertId;
};

// Obter todos os relatórios ativos
export const getAllRelatorios = async (): Promise<Relatorio[]> => {
  const [rows] = await pool.query<RowDataPacket[]>(
    `SELECT * FROM relatorios WHERE estado = 1`
  );
  return rows as Relatorio[];
};

// Obter um relatório por ID
export const getRelatorioById = async (
  id: number
): Promise<Relatorio | null> => {
  const [rows] = await pool.query<RowDataPacket[]>(
    `SELECT * FROM relatorios WHERE id = ? AND estado = 1`,
    [id]
  );
  const [relatorio] = rows as Relatorio[];
  return relatorio || null;
};

// Atualizar um relatório por ID
export const updateRelatorio = async (
  id: number,
  updateData: Partial<Omit<Relatorio, "id">>
): Promise<boolean> => {
  const {
    tecnico_cessante_id,
    tecnico_entrante_id,
    data_criacao,
    observacoes_finais,
    estado,
  } = updateData;

  const [result] = await pool.execute(
    `UPDATE relatorios SET tecnico_cessante_id = ?, tecnico_entrante_id = ?, data_criacao = ?, observacoes_finais = ?, estado = ?, data_alteracao = ? WHERE id = ?`,
    [
      tecnico_cessante_id,
      tecnico_entrante_id,
      data_criacao,
      observacoes_finais,
      estado,
      new Date(),
      id,
    ]
  );

  return (result as any).affectedRows > 0;
};

// Soft delete de um relatório
export const softDeleteRelatorio = async (id: number): Promise<boolean> => {
  const [result] = await pool.execute(
    `UPDATE relatorios SET estado = 0 WHERE id = ?`,
    [id]
  );
  return (result as any).affectedRows > 0;
};

// Excluir um relatório permanentemente
export const deleteRelatorio = async (id: number): Promise<boolean> => {
  const [result] = await pool.execute(`DELETE FROM relatorios WHERE id = ?`, [
    id,
  ]);
  return (result as any).affectedRows > 0;
};
