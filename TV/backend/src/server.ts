import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import path from "path";
import { createServer } from "http";
import { Server } from "socket.io";
import fs from "fs";

dotenv.config();

const app = express();

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

// Variáveis de controle
let videoStreamTime = 0; // Controla o tempo de reprodução em segundos
const videoPath = path.join(__dirname, "uploads", "1728924331095.mp4"); // Caminho do vídeo correto
let isVideoPlaying = false;

// Rota para transmitir o vídeo como um fluxo
app.get("/video-stream", (req, res) => {
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
});

// Socket.IO para sincronizar a reprodução
io.on("connection", (socket) => {
  console.log("Novo cliente conectado");

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
