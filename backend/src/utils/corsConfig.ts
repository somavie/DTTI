export const corsOptions = {
  origin: "http://192.168.104.235:3000", // URL do frontend
  methods: ["GET", "POST", "PUT", "DELETE", "PATCH", "OPTIONS"],
  allowedHeaders: ["Content-Type", "Authorization"],
  credentials: true, // Permite envio de cookies e cabeçalhos de autorização
};
