import { ResultSetHeader, RowDataPacket } from "mysql2/promise";
import pool from "../utils/database";

// Definindo a interface para técnicos
interface Tecnico extends RowDataPacket {
  id: number;
  nome: string; // Nome do técnico
  telefone?: string | null; // Telefone do técnico (opcional)
  estado: boolean; // O estado é booleano
  data_criacao?: Date; // Data de criação
  data_alteracao?: Date; // Data da última alteração
  data_remocao?: Date | null; // Data de remoção (opcional)
}

// Função para criar um técnico
export const createTecnico = async (
  nome: string,
  telefone?: string | null,
  estado: boolean = true // Define estado como ativo (true) por padrão
): Promise<number> => {
  try {
    const [result] = await pool.query(
      `INSERT INTO tecnicos (nome, telefone, estado) VALUES (?, ?, ?)`,
      [nome, telefone, estado]
    );
    console.log("Query SQL:", result);
    return (result as ResultSetHeader).insertId; // Retorna o ID do técnico criado
  } catch (error) {
    console.error("Erro ao criar técnico:", error);
    throw error; // Lança o erro para tratamento posterior
  }
};

// Função para obter todos os técnicos
export const getAllTecnicos = async (): Promise<Tecnico[]> => {
  const [rows] = await pool.query("SELECT * FROM tecnicos WHERE estado = 1");
  return rows as Tecnico[];
};

// Função para obter um técnico por ID
export const getTecnicoById = async (id: number): Promise<Tecnico | null> => {
  const [rows] = await pool.query("SELECT * FROM tecnicos WHERE id = ?", [id]);
  const result = rows as Tecnico[];
  return result.length > 0 ? result[0] : null;
};

// Função para atualizar um técnico
export const updateTecnico = async (
  id: number,
  tecnico: {
    nome?: string;
    telefone?: string | null;
    estado?: boolean; // Atualização do estado (opcional)
  }
): Promise<boolean> => {
  const fields: string[] = [];
  const values: any[] = [];

  // Verifica quais campos foram fornecidos para atualização
  if (tecnico.nome !== undefined) {
    fields.push("nome = ?");
    values.push(tecnico.nome);
  }

  if (tecnico.telefone !== undefined) {
    fields.push("telefone = ?");
    values.push(tecnico.telefone);
  }

  if (tecnico.estado !== undefined) {
    fields.push("estado = ?");
    values.push(tecnico.estado);
  }

  // Se não houverem campos para atualizar, retorna falso
  if (fields.length === 0) {
    return false;
  }

  // Adiciona o ID no final dos valores para o WHERE
  values.push(id);

  try {
    const [result] = await pool.query<ResultSetHeader>(
      `UPDATE tecnicos SET ${fields.join(", ")} WHERE id = ?`,
      values
    );

    // Verifica se alguma linha foi afetada
    return result.affectedRows > 0;
  } catch (error) {
    console.error("Erro ao atualizar técnico:", error);
    throw error; // Lança o erro para tratamento posterior
  }
};

// Soft delete (remoção segura) de técnico
export const softDeleteTecnico = async (id: number): Promise<boolean> => {
  const [result] = await pool.query<ResultSetHeader>(
    "UPDATE tecnicos SET estado = 0, data_remocao = CURRENT_TIMESTAMP WHERE id = ?",
    [id]
  );

  // Verifica se alguma linha foi afetada
  return result.affectedRows > 0;
};

// Função para deletar um técnico
export const deleteTecnico = async (id: number): Promise<number> => {
  const [result] = await pool.query("DELETE FROM tecnicos WHERE id = ?", [id]);
  return (result as ResultSetHeader).affectedRows; // Retorna o número de linhas afetadas
};
