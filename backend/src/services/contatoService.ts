import { RowDataPacket } from "mysql2/promise";
import pool from "../utils/database";

// Definindo a interface para contato
interface Contato extends RowDataPacket {
  id: number;
  pessoa_id: number;
  tipo: "Telefone" | "Email";
  valor: string;
  estado?: number;
  data_criacao?: Date;
  data_remocao?: Date;
  data_alteracao?: Date;
}

// Função para criar um contato
export const createContato = async (
  pessoa_id: number,
  tipo: "Telefone" | "Email",
  valor: string
) => {
  const [result] = await pool.query(
    "INSERT INTO contato (pessoa_id, tipo, valor) VALUES (?, ?, ?)",
    [pessoa_id, tipo, valor]
  );
  return (result as any).insertId;
};

// Função para obter todos os contatos
export const getAllContatos = async (): Promise<Contato[]> => {
  const [rows] = await pool.query("SELECT * FROM contato");
  return rows as Contato[];
};

// Função para obter um contato por ID
export const getContatoById = async (id: number): Promise<Contato | null> => {
  const [rows] = await pool.query("SELECT * FROM contato WHERE id = ?", [id]);
  const result = rows as Contato[];
  return result.length > 0 ? result[0] : null;
};

// Função para atualizar um contato
export const updateContato = async (
  id: number,
  pessoa_id: number,
  tipo: "Telefone" | "Email",
  valor: string
): Promise<number> => {
  const [result] = await pool.query(
    "UPDATE contato SET pessoa_id = ?, tipo = ?, valor = ? WHERE id = ?",
    [pessoa_id, tipo, valor, id]
  );
  return (result as any).affectedRows;
};

// Função para deletar um contato
export const deleteContato = async (id: number): Promise<number> => {
  const [result] = await pool.query("DELETE FROM contato WHERE id = ?", [id]);
  return (result as any).affectedRows;
};
