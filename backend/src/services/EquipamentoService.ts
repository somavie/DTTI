import { ResultSetHeader, RowDataPacket } from "mysql2/promise";
import pool from "../utils/database";

// Definindo a interface para equipamento
interface Equipamento extends RowDataPacket {
  id: number;
  nome: string;
  estado?: number; // 1 para ativo, 0 para inativo
  data_criacao?: Date;
  data_remocao?: Date;
  data_alteracao?: Date;
}

// Função para criar um equipamento
export const createEquipamento = async (
  nome: string,
  estado: number = 1 // Define estado como ativo (1) por padrão
): Promise<number> => {
  try {
    const [result] = await pool.query(
      `INSERT INTO equipamentos (nome, estado)
       VALUES (?, ?)`,
      [nome, estado]
    );
    console.log("Query SQL:", result);
    return (result as ResultSetHeader).insertId; // Retorna o ID do equipamento criado
  } catch (error) {
    console.error("Erro ao criar equipamento:", error);
    throw error; // Lança o erro para tratamento posterior
  }
};

// Função para obter todos os equipamentos
export const getAllEquipamentos = async (): Promise<Equipamento[]> => {
  const [rows] = await pool.query(
    "SELECT * FROM equipamentos WHERE estado = 1"
  );
  return rows as Equipamento[];
};

// Função para obter um equipamento por ID
export const getEquipamentoById = async (
  id: number
): Promise<Equipamento | null> => {
  const [rows] = await pool.query("SELECT * FROM equipamentos WHERE id = ?", [
    id,
  ]);
  const result = rows as Equipamento[];
  return result.length > 0 ? result[0] : null;
};

// Função para atualizar um equipamento
export const updateEquipamento = async (
  id: number,
  equipamento: {
    nome?: string;
    estado?: number; // Atualização do estado (opcional)
  }
): Promise<boolean> => {
  const fields: string[] = [];
  const values: any[] = [];

  // Verifica quais campos foram fornecidos para atualização
  if (equipamento.nome) {
    fields.push("nome = ?");
    values.push(equipamento.nome);
  }

  if (equipamento.estado !== undefined) {
    fields.push("estado = ?");
    values.push(equipamento.estado);
  }

  // Se não houverem campos para atualizar, retorna falso
  if (fields.length === 0) {
    return false;
  }

  // Adiciona o ID no final dos valores para o WHERE
  values.push(id);

  try {
    const [result] = await pool.query<ResultSetHeader>(
      `UPDATE equipamentos SET ${fields.join(", ")} WHERE id = ?`,
      values
    );

    // Verifica se alguma linha foi afetada
    return result.affectedRows > 0;
  } catch (error) {
    console.error("Erro ao atualizar equipamento:", error);
    throw error; // Lança o erro para tratamento posterior
  }
};

// Soft delete (remoção segura) de equipamento
export const softDeleteEquipamento = async (id: number): Promise<boolean> => {
  const [result] = await pool.query<ResultSetHeader>(
    "UPDATE equipamentos SET estado = 0 WHERE id = ?",
    [id]
  );

  // Verifica se alguma linha foi afetada
  return result.affectedRows > 0;
};

// Função para deletar um equipamento
export const deleteEquipamento = async (id: number): Promise<number> => {
  const [result] = await pool.query("DELETE FROM equipamentos WHERE id = ?", [
    id,
  ]);
  return (result as ResultSetHeader).affectedRows; // Retorna o número de linhas afetadas
};
