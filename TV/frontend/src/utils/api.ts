// utils/axiosMiddleware.ts
import axios from "axios";

const api = axios.create({
  baseURL: process.env.NEXT_PUBLIC_API_URL || "http://localhost:8088", // URL padrão do backend
  headers: {
    "Content-Type": "application/json",
  },
});

// Middleware para adicionar interceptores, se necessário
api.interceptors.request.use(
  (config) => {
    // Aqui você pode adicionar lógica antes de fazer a requisição, como adicionar tokens
    // Exemplo:
    // const token = getAuthToken();
    // if (token) {
    //     config.headers['Authorization'] = `Bearer ${token}`;
    // }
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

api.interceptors.response.use(
  (response) => {
    // Manipulação de respostas antes de retornar
    return response;
  },
  (error) => {
    // Aqui você pode lidar com erros globais
    console.error("Erro na requisição:", error);
    return Promise.reject(error);
  }
);

export default api;
