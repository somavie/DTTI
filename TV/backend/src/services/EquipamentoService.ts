import pool from "../utils/database";
import { ResultSetHeader, RowDataPacket } from "mysql2";

// Interface para definir o tipo de dados esperado para criar um equipamento
interface CreateEquipamentoInput {
  relatorios_id: number;
  quantidade: number;
  status: string;
  localizacao: string | null; // Pode ser string ou null
  data_verificacao: Date | null; // Pode ser Date ou null
}

// Interface para representar o equipamento retornado do banco de dados
interface Equipamento extends RowDataPacket {
  equipamentos_id: number;
  relatorios_id: number;
  quantidade: number;
  status: string;
  localizacao: string | null;
  data_verificacao: Date | null;
  estado: number;
  data_criacao: Date;
  data_alteracao: Date;
  data_remocao: Date | null;
}

// Criar um equipamento
export const createEquipamento = async (
  equipamento: CreateEquipamentoInput
): Promise<number> => {
  const query = `
    INSERT INTO equipamento (relatorios_id, quantidade, status, localizacao, data_verificacao)
    VALUES (?, ?, ?, ?, ?)
  `;

  const [result] = await pool.execute<ResultSetHeader>(query, [
    equipamento.relatorios_id,
    equipamento.quantidade,
    equipamento.status,
    equipamento.localizacao,
    equipamento.data_verificacao,
  ]);

  return result.insertId;
};

// Obter todos os equipamentos
export const getAllEquipamentos = async (): Promise<Equipamento[]> => {
  const query = "SELECT * FROM equipamento WHERE estado = 1"; // Apenas equipamentos ativos
  const [equipamentos] = await pool.execute<Equipamento[]>(query);
  return equipamentos;
};

// Obter um equipamento por ID
export const getEquipamentoById = async (
  equipamentos_id: number
): Promise<Equipamento | null> => {
  const query =
    "SELECT * FROM equipamento WHERE equipamentos_id = ? AND estado = 1";
  const [equipamentos] = await pool.execute<Equipamento[]>(query, [
    equipamentos_id,
  ]);

  return equipamentos.length > 0 ? equipamentos[0] : null;
};

// Atualizar um equipamento
export const updateEquipamento = async (
  equipamentos_id: number,
  equipamento: Partial<CreateEquipamentoInput>
): Promise<boolean> => {
  const query = `
    UPDATE equipamento
    SET relatorios_id = ?, quantidade = ?, status = ?, localizacao = ?, data_verificacao = ?
    WHERE equipamentos_id = ? AND estado = 1
  `;

  const [result] = await pool.execute<ResultSetHeader>(query, [
    equipamento.relatorios_id,
    equipamento.quantidade,
    equipamento.status,
    equipamento.localizacao,
    equipamento.data_verificacao,
    equipamentos_id,
  ]);

  return result.affectedRows > 0;
};

// Soft delete (remoção segura) de um equipamento
export const softDeleteEquipamento = async (
  equipamentos_id: number
): Promise<boolean> => {
  const query = `
    UPDATE equipamento
    SET estado = 0, data_remocao = NOW()
    WHERE equipamentos_id = ?
  `;

  const [result] = await pool.execute<ResultSetHeader>(query, [
    equipamentos_id,
  ]);

  return result.affectedRows > 0;
};

// Deletar um equipamento (exclusão permanente)
export const deleteEquipamento = async (
  equipamentos_id: number
): Promise<boolean> => {
  const query = "DELETE FROM equipamento WHERE equipamentos_id = ?";

  const [result] = await pool.execute<ResultSetHeader>(query, [
    equipamentos_id,
  ]);

  return result.affectedRows > 0;
};