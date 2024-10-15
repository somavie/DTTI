// controllers/videoController.ts
import { Request, Response } from "express";
import multer from "multer";
import path from "path";
import pool from "../utils/database"; // Importe sua conexão com o banco de dados
import { Video } from "../models/Video"; // Importe a interface do vídeo
import { ResultSetHeader } from "mysql2"; // Importa o tipo correto para resultados de consulta

// Configuração do armazenamento de arquivos
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "src/uploads/"); // Pasta onde os vídeos serão armazenados
  },
  filename: (req, file, cb) => {
    const ext = path.extname(file.originalname);
    cb(null, `${Date.now()}${ext}`); // Renomeia o arquivo
  },
});

const upload = multer({ storage });

export const uploadVideo = upload.single("video"); // Define o campo do formulário que irá carregar o vídeo

export const handleUploadVideo = async (req: Request, res: Response) => {
  try {
    if (!req.file) {
      return res.status(400).json({ message: "Nenhum arquivo enviado." });
    }

    const videoPath = `${req.file.filename}`; // O caminho para acessar o vídeo

    // Cria o objeto do vídeo
    const newVideo: Video = {
      nome: req.file.originalname, // O nome original do arquivo
      caminho: videoPath,
      estado: true, // Se desejar definir como ativo
      data_criacao: new Date(), // Data atual
    };

    // Salva o vídeo no banco de dados
    const result = await pool.query<ResultSetHeader>(
      "INSERT INTO videos (nome, caminho, estado, data_criacao) VALUES (?, ?, ?, ?)",
      [newVideo.nome, newVideo.caminho, newVideo.estado, newVideo.data_criacao]
    );

    // A propriedade insertId está dentro do resultado
    const insertId = result[0].insertId;

    return res.status(201).json({
      message: "Vídeo enviado com sucesso!",
      video: { id: insertId, ...newVideo }, // Retorna o vídeo salvo com seu ID
    });
  } catch (error) {
    console.error("Erro ao enviar o vídeo:", error);
    return res
      .status(500)
      .json({ message: "Erro ao enviar o vídeo. Tente novamente." });
  }
};
