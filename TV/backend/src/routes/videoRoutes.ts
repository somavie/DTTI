// backend/src/routes/videoRoutes.ts
import express from "express";
import * as Video from "../models/Video"; // Certifique-se de que as funções estão corretamente exportadas
import { uploadVideo, handleUploadVideo } from "../controllers/videoController";

const router = express.Router();

let isPlaying = false;
let currentTime = 0;

// Endpoint para iniciar o vídeo
router.post("/play", (req, res) => {
  isPlaying = true;
  currentTime = req.body.currentTime || 0;
  res.json({ status: "playing", currentTime });
});

// Endpoint para pausar o vídeo
router.post("/pause", (req, res) => {
  isPlaying = false;
  res.json({ status: "paused" });
});

// Endpoint para obter o status atual do vídeo
router.get("/status", (req, res) => {
  res.json({ isPlaying, currentTime });
});
// Rota para obter todos os vídeos
router.get("/", async (req, res) => {
  try {
    const videos = await Video.getAllVideos(); // Função que busca todos os vídeos
    res.json(videos);
  } catch (error) {
    res.status(500).json({ message: (error as Error).message });
  }
});

// Rota para adicionar um novo vídeo
router.post("/", uploadVideo, handleUploadVideo, async (req, res) => {
  try {
    const videoId = await Video.addVideo(req.body); // Adiciona o vídeo no banco de dados
    res.status(201).json({ id: videoId }); // Retorna o ID do vídeo adicionado
  } catch (error) {
    res.status(500).json({ message: (error as Error).message });
  }
});

export default router;
