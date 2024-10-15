import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import path from "path";
import { createServer } from "http";
import { Server } from "socket.io";
import fs from "fs";
import videoRoutes from "./routes/videoRoutes";
import pool from "./utils/database"; // Certifique-se de ter seu pool de conexões

dotenv.config();

const app = express();
app.use(express.json()); // Para fazer o parse do JSON no corpo da requisição

// Definição da interface Video
export interface Video {
  nome: string; // Nome do vídeo
  caminho: string; // Caminho do vídeo
  estado: boolean; // Estado do vídeo
  data_criacao?: Date; // Data de criação (opcional)
  data_alteracao?: Date; // Data de alteração (opcional)
}

// Configurando o CORS para permitir requisições da origem específica do frontend
app.use(cors({ origin: "http://localhost:3000", credentials: true }));

const server = createServer(app);

// Configurando o Socket.IO com CORS
const io = new Server(server, {
  cors: {
    origin: "*",
    methods: ["GET", "POST"],
    credentials: true,
  },
});

app.use("/uploads", express.static(path.join(__dirname, "uploads")));
app.use("/videos", videoRoutes); // Roteamento para as operações de vídeo

// Variáveis de controle
let videoStreamTime = 0; // Controla o tempo de reprodução em segundos
let videoPath = ""; // O caminho do vídeo será determinado dinamicamente
let isVideoPlaying = false;

// Função para obter o último vídeo inserido
const getVideos = async (): Promise<Video[]> => {
  const [rows] = await pool.query(
    "SELECT * FROM videos ORDER BY id DESC LIMIT 1"
  );
  return rows as Video[];
};

// Rota para transmitir o vídeo como um fluxo
app.get("/video-stream", async (req, res) => {
  try {
    const latestVideos = await getVideos(); // Aguarda a resolução da promessa

    // Verifica se o vídeo foi encontrado
    if (latestVideos.length === 0) {
      return res.status(404).json({ error: "Nenhum vídeo encontrado." });
    }

    const latestVideo = latestVideos[0]; // Obtém o vídeo mais recente

    // Definir o caminho do vídeo
    videoPath = path.join(__dirname, "uploads", latestVideo.caminho); // Ajuste o nome do campo de acordo com seu banco de dados

    // Verificar se o arquivo de vídeo existe
    if (!fs.existsSync(videoPath)) {
      return res
        .status(404)
        .json({ error: "Vídeo não encontrado no servidor." });
    }

    const stat = fs.statSync(videoPath);
    const fileSize = stat.size;
    const range = req.headers.range;

    if (range) {
      const parts = range.replace(/bytes=/, "").split("-");
      const start = parseInt(parts[0], 10);
      const end = parts[1] ? parseInt(parts[1], 10) : fileSize - 1;
      const chunkSize = end - start + 1;
      const file = fs.createReadStream(videoPath, { start, end });
      const head = {
        "Content-Range": `bytes ${start}-${end}/${fileSize}`,
        "Accept-Ranges": "bytes",
        "Content-Length": chunkSize,
        "Content-Type": "video/mp4",
      };
      res.writeHead(206, head);
      file.pipe(res);
    } else {
      const head = {
        "Content-Length": fileSize,
        "Content-Type": "video/mp4",
      };
      res.writeHead(200, head);
      fs.createReadStream(videoPath).pipe(res);
    }
  } catch (error) {
    console.error("Erro ao transmitir o vídeo:", error); // Log do erro
    res.status(500).json({ error: "Erro ao transmitir o vídeo" });
  }
});

// Socket.IO para sincronizar a reprodução
io.on("connection", (socket) => {
  // Quando um cliente solicita o stream
  socket.on("requestLiveStream", () => {
    if (!isVideoPlaying) {
      isVideoPlaying = true;
      setInterval(() => {
        videoStreamTime += 1; // Incrementa o tempo de reprodução
      }, 1000); // A cada segundo
    }

    // Envia o tempo de reprodução atual para o cliente
    socket.emit("liveStream", { currentTime: videoStreamTime });
  });

  socket.on("disconnect", () => {
    console.log("Cliente desconectado");
  });
});

// Inicializando o servidor
const PORT = process.env.PORT || 8088;
server.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});
