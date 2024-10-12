import { ResultSetHeader, RowDataPacket } from "mysql2/promise";
import pool from "../utils/database";

// Definindo a interface para situação
interface Situacao extends RowDataPacket {
  id: number;
  nome?: string | null; // Nome da situação (opcional)
  estado: boolean; // O estado é booleano
  data_criacao?: Date; // Data de criação
  data_alteracao?: Date; // Data da última alteração
  data_remocao?: Date | null; // Data de remoção (opcional)
}

// Função para criar uma situação
export const createSituacao = async (
  nome?: string | null,
  estado: boolean = true // Define estado como ativo (true) por padrão
): Promise<number> => {
  try {
    const [result] = await pool.query(
      `INSERT INTO situacao (nome, estado) VALUES (?, ?)`,
      [nome, estado]
    );
    console.log("Query SQL:", result);
    return (result as ResultSetHeader).insertId; // Retorna o ID da situação criada
  } catch (error) {
    console.error("Erro ao criar situação:", error);
    throw error; // Lança o erro para tratamento posterior
  }
};

// Função para obter todas as situações
export const getAllSituacoes = async (): Promise<Situacao[]> => {
  const [rows] = await pool.query("SELECT * FROM situacao WHERE estado = 1");
  return rows as Situacao[];
};

// Função para obter uma situação por ID
export const getSituacaoById = async (id: number): Promise<Situacao | null> => {
  const [rows] = await pool.query("SELECT * FROM situacao WHERE id = ?", [id]);
  const result = rows as Situacao[];
  return result.length > 0 ? result[0] : null;
};

// Função para atualizar uma situação
export const updateSituacao = async (
  id: number,
  situacao: {
    nome?: string | null;
    estado?: boolean; // Atualização do estado (opcional)
  }
): Promise<boolean> => {
  const fields: string[] = [];
  const values: any[] = [];

  // Verifica quais campos foram fornecidos para atualização
  if (situacao.nome !== undefined) {
    fields.push("nome = ?");
    values.push(situacao.nome);
  }

  if (situacao.estado !== undefined) {
    fields.push("estado = ?");
    values.push(situacao.estado);
  }

  // Se não houverem campos para atualizar, retorna falso
  if (fields.length === 0) {
    return false;
  }

  // Adiciona o ID no final dos valores para o WHERE
  values.push(id);

  try {
    const [result] = await pool.query<ResultSetHeader>(
      `UPDATE situacao SET ${fields.join(", ")} WHERE id = ?`,
      values
    );

    // Verifica se alguma linha foi afetada
    return result.affectedRows > 0;
  } catch (error) {
    console.error("Erro ao atualizar situação:", error);
    throw error; // Lança o erro para tratamento posterior
  }
};

// Soft delete (remoção segura) de situação
export const softDeleteSituacao = async (id: number): Promise<boolean> => {
  const [result] = await pool.query<ResultSetHeader>(
    "UPDATE situacao SET estado = 0, data_remocao = CURRENT_TIMESTAMP WHERE id = ?",
    [id]
  );

  // Verifica se alguma linha foi afetada
  return result.affectedRows > 0;
};

// Função para deletar uma situação
export const deleteSituacao = async (id: number): Promise<number> => {
  const [result] = await pool.query("DELETE FROM situacao WHERE id = ?", [id]);
  return (result as ResultSetHeader).affectedRows; // Retorna o número de linhas afetadas
};
