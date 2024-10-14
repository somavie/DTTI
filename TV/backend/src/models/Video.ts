// backend/src/models/Video.ts
import pool from "../utils/database";

export interface Video {
  nome: string;
  caminho: string;
  estado: boolean;
  data_criacao?: Date;
  data_alteracao?: Date;
}

export const getAllVideos = async (): Promise<Video[]> => {
  const [rows] = await pool.query("SELECT * FROM videos WHERE estado = 1");
  return rows as Video[];
};

export const addVideo = async (
  videoData: Omit<Video, "id" | "data_criacao" | "data_alteracao">
): Promise<number> => {
  const { nome, caminho } = videoData;
  const [result] = await pool.query(
    "INSERT INTO videos (nome, caminho) VALUES (?, ?)",
    [nome, caminho]
  );
  return (result as any).insertId;
};
