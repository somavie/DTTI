import { ResultSetHeader, RowDataPacket } from "mysql2/promise";
import pool from "../utils/database";

// Definindo a interface para observacao
interface Observacao extends RowDataPacket {
  situacao_id: number;
  relatorios_id: number;
  descricao?: string; // Campo descrição é opcional
  estado: boolean; // O estado é booleano
  data_criacao?: Date;
  data_alteracao?: Date;
  data_remocao?: Date;
}

// Função para criar uma observacao
export const createObservacao = async (
  situacao_id: number,
  relatorios_id: number,
  descricao?: string,
  estado: boolean = true // Define estado como ativo (true) por padrão
): Promise<number> => {
  try {
    const [result] = await pool.query(
      `INSERT INTO observacao (situacao_id, relatorios_id, descricao, estado)
       VALUES (?, ?, ?, ?)`,
      [situacao_id, relatorios_id, descricao, estado]
    );
    console.log("Query SQL:", result);
    return (result as ResultSetHeader).insertId; // Retorna o ID da observação criada
  } catch (error) {
    console.error("Erro ao criar observação:", error);
    throw error; // Lança o erro para tratamento posterior
  }
};

// Função para obter todas as observacoes
export const getAllObservacoes = async (): Promise<Observacao[]> => {
  const [rows] = await pool.query("SELECT * FROM observacao WHERE estado = 1");
  return rows as Observacao[];
};

// Função para obter uma observacao por ID
export const getObservacaoById = async (
  id: number
): Promise<Observacao | null> => {
  const [rows] = await pool.query(
    "SELECT * FROM observacao WHERE situacao_id = ?",
    [id]
  );
  const result = rows as Observacao[];
  return result.length > 0 ? result[0] : null;
};

// Função para atualizar uma observacao
export const updateObservacao = async (
  situacao_id: number,
  observacao: {
    relatorios_id?: number;
    descricao?: string;
    estado?: boolean; // Atualização do estado (opcional)
  }
): Promise<boolean> => {
  const fields: string[] = [];
  const values: any[] = [];

  // Verifica quais campos foram fornecidos para atualização
  if (observacao.relatorios_id) {
    fields.push("relatorios_id = ?");
    values.push(observacao.relatorios_id);
  }

  if (observacao.descricao) {
    fields.push("descricao = ?");
    values.push(observacao.descricao);
  }

  if (observacao.estado !== undefined) {
    fields.push("estado = ?");
    values.push(observacao.estado);
  }

  // Se não houverem campos para atualizar, retorna falso
  if (fields.length === 0) {
    return false;
  }

  // Adiciona o ID no final dos valores para o WHERE
  values.push(situacao_id);

  try {
    const [result] = await pool.query<ResultSetHeader>(
      `UPDATE observacao SET ${fields.join(", ")} WHERE situacao_id = ?`,
      values
    );

    // Verifica se alguma linha foi afetada
    return result.affectedRows > 0;
  } catch (error) {
    console.error("Erro ao atualizar observação:", error);
    throw error; // Lança o erro para tratamento posterior
  }
};

// Soft delete (remoção segura) de observacao
export const softDeleteObservacao = async (
  situacao_id: number
): Promise<boolean> => {
  const [result] = await pool.query<ResultSetHeader>(
    "UPDATE observacao SET estado = 0, data_remocao = CURRENT_TIMESTAMP WHERE situacao_id = ?",
    [situacao_id]
  );

  // Verifica se alguma linha foi afetada
  return result.affectedRows > 0;
};

// Função para deletar uma observacao
export const deleteObservacao = async (
  situacao_id: number
): Promise<number> => {
  const [result] = await pool.query(
    "DELETE FROM observacao WHERE situacao_id = ?",
    [situacao_id]
  );
  return (result as ResultSetHeader).affectedRows; // Retorna o número de linhas afetadas
};
