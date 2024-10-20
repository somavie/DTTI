import { ResultSetHeader, RowDataPacket } from "mysql2/promise";
import pool from "../utils/database";

// Definindo a interface para observacao
// observacao.ts
interface Observacao {
  situacao_id: number;
  relatorios_id: number;
  descricao?: string | null; // Descrição pode ser nula
  estado: boolean;
  data_criacao: Date;
  data_alteracao: Date;
  data_remocao?: Date | null; // data_remocao é opcional
}

// Criar uma nova observação
export const createObservacao = async (
  observacao: Omit<
    Observacao,
    "data_criacao" | "data_alteracao" | "data_remocao"
  >
): Promise<number> => {
  const [result] = await pool.execute(
    `INSERT INTO observacao (situacao_id, relatorios_id, descricao) VALUES (?, ?, ?)`,
    [observacao.situacao_id, observacao.relatorios_id, observacao.descricao]
  );
  return (result as any).insertId;
};

// Obter todas as observações
export const getAllObservacoes = async (): Promise<Observacao[]> => {
  const [rows] = await pool.query<RowDataPacket[]>(
    `SELECT * FROM observacao WHERE estado = 1`
  );
  return rows as Observacao[];
};

// Obter uma observação por ID
export const getObservacaoById = async (
  situacao_id: number,
  relatorios_id: number
): Promise<Observacao | null> => {
  const [rows] = await pool.query<RowDataPacket[]>(
    `SELECT * FROM observacao WHERE situacao_id = ? AND relatorios_id = ? AND estado = 1`,
    [situacao_id, relatorios_id]
  );
  const [observacao] = rows as Observacao[];
  return observacao || null;
};

// Atualizar uma observação por ID
export const updateObservacao = async (
  situacao_id: number,
  relatorios_id: number,
  updateData: Partial<
    Omit<
      Observacao,
      "situacao_id" | "relatorios_id" | "data_criacao" | "data_alteracao"
    >
  >
): Promise<boolean> => {
  const { descricao, estado } = updateData;

  const [result] = await pool.execute(
    `UPDATE observacao SET descricao = ?, estado = ?, data_alteracao = ? WHERE situacao_id = ? AND relatorios_id = ?`,
    [descricao, estado, new Date(), situacao_id, relatorios_id]
  );

  return (result as any).affectedRows > 0;
};

// Soft delete de uma observação
export const softDeleteObservacao = async (
  situacao_id: number,
  relatorios_id: number
): Promise<boolean> => {
  const [result] = await pool.execute(
    `UPDATE observacao SET estado = 0 WHERE situacao_id = ? AND relatorios_id = ?`,
    [situacao_id, relatorios_id]
  );
  return (result as any).affectedRows > 0;
};

// Excluir uma observação permanentemente
export const deleteObservacao = async (
  situacao_id: number,
  relatorios_id: number
): Promise<boolean> => {
  const [result] = await pool.execute(
    `DELETE FROM observacao WHERE situacao_id = ? AND relatorios_id = ?`,
    [situacao_id, relatorios_id]
  );
  return (result as any).affectedRows > 0;
};
