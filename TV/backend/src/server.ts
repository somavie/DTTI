import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import videoRoutes from "./routes/videoRoutes";
import bodyParser from "body-parser";
import path from "path";
import { createServer } from "http";
import { Server } from "socket.io";

dotenv.config();

const app = express();
app.use(cors());
app.use(bodyParser.json());
const server = createServer(app);
const io = new Server(server);

// Serve arquivos estáticos da pasta 'uploads'
app.use("/uploads", express.static(path.join(__dirname, "uploads"))); // Verifique se 'uploads' está no lugar certo

app.use("/videos", videoRoutes); // Roteamento para as operações de vídeo

io.on("connection", (socket) => {
  console.log("Novo cliente conectado");

  socket.on("requestLiveStream", () => {
    // Aqui você pode obter o caminho do vídeo que deseja transmitir
    const liveVideoPath = "/uploads/1728865074712.mp4"; // Substitua pelo seu vídeo
    socket.emit("liveStream", liveVideoPath);
  });

  socket.on("disconnect", () => {
    console.log("Cliente desconectado");
  });
});

const PORT = process.env.PORT || 5000;
server.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});
