import { ResultSetHeader, RowDataPacket } from "mysql2/promise";
import pool from "../utils/database";

// Definindo a interface para posto
interface Posto extends RowDataPacket {
  id: number;
  nome?: string; // Campo nome é opcional
  sigla?: string; // Campo sigla é opcional
  estado: boolean; // O estado é booleano
  data_criacao?: Date;
  data_alteracao?: Date;
  data_remocao?: Date;
}

// Função para criar um posto
export const createPosto = async (
  nome?: string,
  sigla?: string,
  estado: boolean = true // Define estado como ativo (true) por padrão
): Promise<number> => {
  try {
    const [result] = await pool.query(
      `INSERT INTO posto (nome, sigla, estado) VALUES (?, ?, ?)`,
      [nome, sigla, estado]
    );
    console.log("Query SQL:", result);
    return (result as ResultSetHeader).insertId; // Retorna o ID do posto criado
  } catch (error) {
    console.error("Erro ao criar posto:", error);
    throw error; // Lança o erro para tratamento posterior
  }
};

// Função para obter todos os postos
export const getAllPostos = async (): Promise<Posto[]> => {
  const [rows] = await pool.query("SELECT * FROM posto WHERE estado = 1");
  return rows as Posto[];
};

// Função para obter um posto por ID
export const getPostoById = async (id: number): Promise<Posto | null> => {
  const [rows] = await pool.query("SELECT * FROM posto WHERE id = ?", [id]);
  const result = rows as Posto[];
  return result.length > 0 ? result[0] : null;
};

// Função para atualizar um posto
export const updatePosto = async (
  id: number,
  posto: {
    nome?: string;
    sigla?: string;
    estado?: boolean; // Atualização do estado (opcional)
  }
): Promise<boolean> => {
  const fields: string[] = [];
  const values: any[] = [];

  // Verifica quais campos foram fornecidos para atualização
  if (posto.nome) {
    fields.push("nome = ?");
    values.push(posto.nome);
  }

  if (posto.sigla) {
    fields.push("sigla = ?");
    values.push(posto.sigla);
  }

  if (posto.estado !== undefined) {
    fields.push("estado = ?");
    values.push(posto.estado);
  }

  // Se não houverem campos para atualizar, retorna falso
  if (fields.length === 0) {
    return false;
  }

  // Adiciona o ID no final dos valores para o WHERE
  values.push(id);

  try {
    const [result] = await pool.query<ResultSetHeader>(
      `UPDATE posto SET ${fields.join(", ")} WHERE id = ?`,
      values
    );

    // Verifica se alguma linha foi afetada
    return result.affectedRows > 0;
  } catch (error) {
    console.error("Erro ao atualizar posto:", error);
    throw error; // Lança o erro para tratamento posterior
  }
};

// Soft delete (remoção segura) de posto
export const softDeletePosto = async (id: number): Promise<boolean> => {
  const [result] = await pool.query<ResultSetHeader>(
    "UPDATE posto SET estado = 0, data_remocao = CURRENT_TIMESTAMP WHERE id = ?",
    [id]
  );

  // Verifica se alguma linha foi afetada
  return result.affectedRows > 0;
};

// Função para deletar um posto
export const deletePosto = async (id: number): Promise<number> => {
  const [result] = await pool.query("DELETE FROM posto WHERE id = ?", [id]);
  return (result as ResultSetHeader).affectedRows; // Retorna o número de linhas afetadas
};
