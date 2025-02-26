export const corsOptions = {
  origin: [
    "http://192.168.104.192:3000",
    "http://192.168.104.192:8088",
    "http://localhost:8088",
    "http://localhost:3000",
  ], // URL do frontend
  methods: ["GET", "POST", "PUT", "DELETE", "PATCH", "OPTIONS"],
  allowedHeaders: ["Content-Type", "Authorization"],
  credentials: true, // Permite envio de cookies e cabeçalhos de autorização
};
