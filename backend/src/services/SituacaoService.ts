import { configDotenv } from "dotenv";
import pool from "../utils/database";
import { RowDataPacket } from "mysql2";

// Interface para o tipo de dados Situação
interface Situacao {
  id: number;
  nome: string | null;
  estado: boolean;
  operacionabilidade: boolean;
  data_criacao: Date;
  data_alteracao: Date;
}

// Criar uma nova situação
export const createSituacao = async (
  situacao: Omit<Situacao, "id" | "operacionabilidade" | "data_alteracao">
): Promise<number> => {
  const [result] = await pool.execute(
    `INSERT INTO situacao (nome, estado, data_criacao) VALUES (?, ?, ?)`,
    [situacao.nome, situacao.estado, new Date()]
  );
  return (result as any).insertId;
};

// Obter todas as situações ativas
export const getAllSituacoes = async (): Promise<Situacao[]> => {
  const [rows] = await pool.query<RowDataPacket[]>(
    `SELECT * FROM situacao`
  );
  return rows as Situacao[];
};

// Obter uma situação por ID
export const getSituacaoById = async (id: number): Promise<Situacao | null> => {
  const [rows] = await pool.query<RowDataPacket[]>(
    `SELECT * FROM situacao WHERE id = ?`,
    [id]
  );
  const [situacao] = rows as Situacao[];
  return situacao || null;
};

// Atualizar uma situação por ID
export const updateSituacao = async (
  id: number,
  updateData: Partial<Omit<Situacao, "id">>
): Promise<boolean> => {
  // Filtra os campos que realmente foram enviados na requisição
  const fields = Object.keys(updateData)
    .filter((key) => updateData[key as keyof typeof updateData] !== undefined)
    .map((key) => `${key} = ?`);

  // Se nenhum campo foi enviado, evita rodar um UPDATE inválido
  if (fields.length === 0) {
    throw new Error("Nenhum campo válido para atualizar");
  }

  // Adiciona a data de alteração
  fields.push("data_alteracao = ?");

  const values = [
    ...Object.values(updateData).filter((value) => value !== undefined),
    new Date(), // Adicionando a data_alteracao
    id,
  ];

  const query = `UPDATE situacao SET ${fields.join(", ")} WHERE id = ?`;

  const [result] = await pool.execute(query, values);

  return (result as any).affectedRows > 0;
};


// Soft delete de uma situação
export const softDeleteSituacao = async (id: number): Promise<boolean> => {
  const [result] = await pool.execute(
    `UPDATE situacao SET estado = 0 WHERE id = ?`,
    [id]
  );
  return (result as any).affectedRows > 0;
};

// Excluir uma situação permanentemente
export const deleteSituacao = async (id: number): Promise<boolean> => {
  const [result] = await pool.execute(`DELETE FROM situacao WHERE id = ?`, [
    id,
  ]);
  return (result as any).affectedRows > 0;
};
