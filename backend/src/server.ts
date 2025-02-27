import express from "express";
import bodyParser from "body-parser";
import helmet from "helmet";
import cors from "cors";
import { corsOptions } from "./utils/corsConfig";
import { checkDatabaseConnection } from "./utils/dbConnection";
import dotenv from "dotenv";
import path from "path";
import { checkPermissionsAuto } from "./middleware/checkPermissionsAuto"; // Importa o middleware de permissões automáticas
import authRoutes from "./routes/authRoutes";

import enderecoRoutes from "./routes/enderecoRoutes";

import municipioRoutes from "./routes/municipioRoutes";

import pessoaRoutes from "./routes/pessoaRoutes";
import contatoRoutes from "./routes/contatoRoutes";
import provinciaRoutes from "./routes/provinciaRoutes";
import causaRoutes from "./routes/causaRoutes";
import tipoUsuarioRoutes from "./routes/tipoUsuarioRoutes";
import postoRoutes from "./routes/postoRoutes"; // Rota para posto
import situacaoRoutes from "./routes/situacaoRoutes"; // Rota para situacao
import tecnicoRoutes from "./routes/tecnicoRoutes"; // Rota para tecnicos
import relatorioRoutes from "./routes/relatorioRoutes"; // Rota para relatorios
import equipamentoRoutes from "./routes/equipamentoRoutes"; // Rota para equipamentos
import observacaoRoutes from "./routes/observacaoRoutes"; // Rota para observacao
import equipamentosRoutes from "./routes/equipamentosRoutes";
import grupoRoutes from "./routes/grupoRoutes";
import turnoRoutes from "./routes/turnoRoutes";
import metricaRoutes from "./routes/metricaRoutes";

import { verifyToken } from "./middleware/verifyToken";
import entidadeRoutes from "./routes/entidadeRoutes";
import radioRoutes from "./routes/radioRoutes";
import gruposRoutes from "./routes/gruposRoutes";
import radioStatusRoutes from "./routes/radioStatusRoutes";

const app = express();
app.use(express.json());
app.use(cors(corsOptions));
app.use(helmet({ hidePoweredBy: true, contentSecurityPolicy: false }));

app.use((req, res, next) => {
  res.setHeader("X-Custom-Header", "YourValue");
  next();
});
app.use(bodyParser.json({ limit: "10mb" }));

dotenv.config();

// Usar as rotas com verificação automática de permissões
app.use("/auth", authRoutes);

// Rota para a tabela 'grupo'
//app.use("/grupos", verifyToken, checkPermissionsAuto, grupoRoutes);
app.use("/grupo", verifyToken, checkPermissionsAuto, gruposRoutes);

app.use("/radio-status", verifyToken, checkPermissionsAuto, radioStatusRoutes);
// Rota para a tabela 'turno'
app.use("/turnos", verifyToken, checkPermissionsAuto, turnoRoutes);

// Rota para a tabela 'métrica'
app.use("/metricas", verifyToken, checkPermissionsAuto, metricaRoutes);

app.use("/entidades", verifyToken, checkPermissionsAuto, entidadeRoutes);
app.use("/radios", verifyToken, checkPermissionsAuto, radioRoutes);

app.use("/enderecos", verifyToken, checkPermissionsAuto, enderecoRoutes);

app.use("/municipios", verifyToken, checkPermissionsAuto, municipioRoutes);

app.use("/pessoas", verifyToken, checkPermissionsAuto, pessoaRoutes);
app.use("/contatos", verifyToken, checkPermissionsAuto, contatoRoutes);
app.use("/provincias", verifyToken, checkPermissionsAuto, provinciaRoutes);
app.use("/causas", verifyToken, checkPermissionsAuto, causaRoutes);
app.use("/tipousuarios", verifyToken, checkPermissionsAuto, tipoUsuarioRoutes);
app.use("/postos", postoRoutes); // Usar as rotas de posto
app.use("/situacoes", situacaoRoutes); // Usar as rotas de situacao
app.use("/tecnicos", tecnicoRoutes); // Usar as rotas de tecnicos
app.use("/relatorios", relatorioRoutes); // Usar as rotas de relatorios
app.use("/equipamentos", equipamentosRoutes); // Usar as rotas de equipamentos
app.use("/equipamento", equipamentoRoutes);
app.use("/observacoes", observacaoRoutes); // Usar as rotas de observacao

app.use("/uploads", express.static(path.join(__dirname, "uploads")));

checkDatabaseConnection().then(() => {
  const port = process.env.PORT || 8083;
  app.listen(port, () => {
    console.log(`Servidor rodando na porta ${port}`);
  });
});
