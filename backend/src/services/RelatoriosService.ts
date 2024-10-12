import { ResultSetHeader, RowDataPacket } from "mysql2/promise";
import pool from "../utils/database";

// Definindo a interface para relatório
interface Relatorio extends RowDataPacket {
  id: number;
  tecnico_cessante_id?: number | null; // ID do técnico cessante (opcional)
  tecnico_entrante_id?: number | null; // ID do técnico entrante (opcional)
  data_criacao?: Date; // Data de criação do relatório
  observacoes_finais?: string | null; // Observações finais (opcional)
  estado?: boolean; // O estado é booleano
  data_criacao_registro?: Date; // Data da criação do registro
  data_alteracao?: Date; // Data da última alteração
  data_remocao?: Date | null; // Data de remoção (opcional)
}

// Função para criar um relatório
export const createRelatorio = async (
  tecnico_cessante_id?: number | null,
  tecnico_entrante_id?: number | null,
  data_criacao?: Date,
  observacoes_finais?: string | null,
  estado: boolean = true // Define estado como ativo (true) por padrão
): Promise<number> => {
  try {
    const [result] = await pool.query(
      `INSERT INTO relatorios (tecnico_cessante_id, tecnico_entrante_id, data_criacao, observacoes_finais, estado) VALUES (?, ?, ?, ?, ?)`,
      [
        tecnico_cessante_id,
        tecnico_entrante_id,
        data_criacao,
        observacoes_finais,
        estado,
      ]
    );
    console.log("Query SQL:", result);
    return (result as ResultSetHeader).insertId; // Retorna o ID do relatório criado
  } catch (error) {
    console.error("Erro ao criar relatório:", error);
    throw error; // Lança o erro para tratamento posterior
  }
};

// Função para obter todos os relatórios
export const getAllRelatorios = async (): Promise<Relatorio[]> => {
  const [rows] = await pool.query("SELECT * FROM relatorios WHERE estado = 1");
  return rows as Relatorio[];
};

// Função para obter um relatório por ID
export const getRelatorioById = async (
  id: number
): Promise<Relatorio | null> => {
  const [rows] = await pool.query("SELECT * FROM relatorios WHERE id = ?", [
    id,
  ]);
  const result = rows as Relatorio[];
  return result.length > 0 ? result[0] : null;
};

// Função para atualizar um relatório
export const updateRelatorio = async (
  id: number,
  relatorio: {
    tecnico_cessante_id?: number | null;
    tecnico_entrante_id?: number | null;
    data_criacao?: Date;
    observacoes_finais?: string | null;
    estado?: boolean; // Atualização do estado (opcional)
  }
): Promise<boolean> => {
  const fields: string[] = [];
  const values: any[] = [];

  // Verifica quais campos foram fornecidos para atualização
  if (relatorio.tecnico_cessante_id !== undefined) {
    fields.push("tecnico_cessante_id = ?");
    values.push(relatorio.tecnico_cessante_id);
  }

  if (relatorio.tecnico_entrante_id !== undefined) {
    fields.push("tecnico_entrante_id = ?");
    values.push(relatorio.tecnico_entrante_id);
  }

  if (relatorio.data_criacao) {
    fields.push("data_criacao = ?");
    values.push(relatorio.data_criacao);
  }

  if (relatorio.observacoes_finais) {
    fields.push("observacoes_finais = ?");
    values.push(relatorio.observacoes_finais);
  }

  if (relatorio.estado !== undefined) {
    fields.push("estado = ?");
    values.push(relatorio.estado);
  }

  // Se não houverem campos para atualizar, retorna falso
  if (fields.length === 0) {
    return false;
  }

  // Adiciona o ID no final dos valores para o WHERE
  values.push(id);

  try {
    const [result] = await pool.query<ResultSetHeader>(
      `UPDATE relatorios SET ${fields.join(", ")} WHERE id = ?`,
      values
    );

    // Verifica se alguma linha foi afetada
    return result.affectedRows > 0;
  } catch (error) {
    console.error("Erro ao atualizar relatório:", error);
    throw error; // Lança o erro para tratamento posterior
  }
};

// Soft delete (remoção segura) de relatório
export const softDeleteRelatorio = async (id: number): Promise<boolean> => {
  const [result] = await pool.query<ResultSetHeader>(
    "UPDATE relatorios SET estado = 0, data_remocao = CURRENT_TIMESTAMP WHERE id = ?",
    [id]
  );

  // Verifica se alguma linha foi afetada
  return result.affectedRows > 0;
};

// Função para deletar um relatório
export const deleteRelatorio = async (id: number): Promise<number> => {
  const [result] = await pool.query("DELETE FROM relatorios WHERE id = ?", [
    id,
  ]);
  return (result as ResultSetHeader).affectedRows; // Retorna o número de linhas afetadas
};
