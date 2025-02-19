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
export const getObservacaoBysituacao_id = async (
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
// Função para obter um observacao por ID
export const getObservacaoById = async (id: number): Promise<Observacao | null> => {
  const [rows] = await pool.query("SELECT * FROM observacao WHERE id = ?", [id]);
  const result = rows as Observacao[];
  return result.length > 0 ? result[0] : null;
};
// Obter observações sem relatorio_id de um dia especifico
export const getObservacaoByRelatorioNull = async (
  relatorios_id: number
): Promise<Observacao[] | null> => {
  const [rows] = await pool.query<RowDataPacket[]>(
    `SELECT * FROM view_observacao WHERE  relatorios_id IS NULL AND estado = 1`,
    [ relatorios_id]
  );
  
  return rows as Observacao[];
};

// Atualizar uma observação por ID
export const updateObservacao = async (
  id: number,
  updateData: Partial<{
    descricao: string;
    estado: number;
    relatorios_id: number;
  }>
): Promise<boolean> => {
  // Lista de campos válidos
  const validFields = ['descricao', 'estado', 'relatorios_id'];

  // Filtrar as chaves e valores enviados para incluir apenas campos válidos
  const fields = Object.keys(updateData).filter((field) => validFields.includes(field)) as (keyof typeof updateData)[];
  const values = fields.map((field) => updateData[field]);

  // Verificar se há campos para atualizar
  if (fields.length === 0) {
    return false; // Nenhum dado para atualizar
  }

  // Construir a cláusula SET dinamicamente
  const setClause = fields.map((field) => `${field} = ?`).join(", ");

  // Adicionar o ID ao final dos valores para o WHERE
  values.push(id);
  try {
    const [result] = await pool.query<ResultSetHeader>(
      `UPDATE observacao SET ${setClause} WHERE id = ?`,
      [...values, new Date(), id]
    );

    return result.affectedRows > 0; // Retornar se alguma linha foi afetada
  } catch (error) {
    console.error("Erro ao atualizar observação:", error);
    throw error; // Lançar o erro para tratamento
  }
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
