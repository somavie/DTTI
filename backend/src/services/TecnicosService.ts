import { ResultSetHeader, RowDataPacket } from "mysql2/promise";
import pool from "../utils/database";

// Definindo a interface para Tecnico
interface Tecnico extends RowDataPacket {
  id: number;
  nome: string;
  telefone?: string; // Campo opcional
  estado: number;
  data_criacao?: Date;
  data_alteracao?: Date;
  data_remocao?: Date;
  posto_id: number; // FK para a tabela posto
}

// Função para criar um técnico
export const createTecnico = async (
  nome: string,
  telefone: string | null,
  posto_id: number
): Promise<number> => {
  try {
    const [result] = await pool.query(
      `INSERT INTO tecnicos (nome, telefone, posto_id, estado)
       VALUES (?, ?, ?, ?)`,
      [nome, telefone, posto_id, 1] // Define estado como ativo (1)
    );
    return (result as ResultSetHeader).insertId;
  } catch (error) {
    console.error("Erro ao criar técnico:", error);
    throw error;
  }
};

// Função para obter todos os técnicos
export const getAllTecnicos = async (): Promise<Tecnico[]> => {
  try {
    const [rows] = await pool.query("SELECT * FROM tecnicos WHERE estado = 1");
    return rows as Tecnico[];
  } catch (error) {
    console.error("Erro ao obter todos os técnicos:", error);
    throw error;
  }
};

// Função para obter um técnico por ID
export const getTecnicoById = async (id: number): Promise<Tecnico | null> => {
  try {
    const [rows] = await pool.query("SELECT * FROM tecnicos WHERE id = ?", [
      id,
    ]);
    const result = rows as Tecnico[];
    return result.length > 0 ? result[0] : null;
  } catch (error) {
    console.error("Erro ao obter técnico por ID:", error);
    throw error;
  }
};

// Função para atualizar um técnico
export const updateTecnico = async (
  id: number,
  tecnico: {
    nome?: string;
    telefone?: string | null;
    posto_id?: number;
  }
): Promise<boolean> => {
  const fields: string[] = [];
  const values: any[] = [];

  // Verifica quais campos foram fornecidos para atualização
  if (tecnico.nome) {
    fields.push("nome = ?");
    values.push(tecnico.nome);
  }

  if (tecnico.telefone) {
    fields.push("telefone = ?");
    values.push(tecnico.telefone);
  }

  if (tecnico.posto_id) {
    fields.push("posto_id = ?");
    values.push(tecnico.posto_id);
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
    return result.affectedRows > 0;
  } catch (error) {
    console.error("Erro ao atualizar técnico:", error);
    throw error;
  }
};

// Função para soft delete (remoção lógica) de um técnico
export const softDeleteTecnico = async (id: number): Promise<boolean> => {
  try {
    const [result] = await pool.query<ResultSetHeader>(
      "UPDATE tecnicos SET estado = 0 WHERE id = ?",
      [id]
    );
    return result.affectedRows > 0;
  } catch (error) {
    console.error("Erro ao remover logicamente técnico:", error);
    throw error;
  }
};

// Função para deletar um técnico (remoção permanente)
export const deleteTecnico = async (id: number): Promise<number> => {
  try {
    const [result] = await pool.query<ResultSetHeader>(
      "DELETE FROM tecnicos WHERE id = ?",
      [id]
    );
    return result.affectedRows;
  } catch (error) {
    console.error("Erro ao deletar técnico:", error);
    throw error;
  }
};
