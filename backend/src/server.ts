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
import cargoRoutes from "./routes/cargoRoutes";
import anoLetivoRoutes from "./routes/anoLetivoRoutes";
import assiduidadeRoutes from "./routes/assiduidadeRoutes";
import classeRoutes from "./routes/classeRoutes";
import classedisciplinaRoutes from "./routes/classeDisciplinaRoutes";
import contatoRoutes from "./routes/contatoRoutes";
import cursoRoutes from "./routes/cursoRoutes";
import disciplinaRoutes from "./routes/disciplinaRoutes";
import documentoRoutes from "./routes/documentoRoutes";
import enderecoRoutes from "./routes/enderecoRoutes";
import epocaRoutes from "./routes/epocaRoutes";
import epocaturmaRoutes from "./routes/epocaturmaRoutes";
import funcionarioRoutes from "./routes/funcionarioRoutes";
import horarioRoutes from "./routes/horarioRoutes";
import matriculaRoutes from "./routes/matriculasRoutes";
import municipioRoutes from "./routes/municipioRoutes";
import pagamentoRoutes from "./routes/pagamentoRoutes";
import permissaoRoutes from "./routes/permissaoRoutes";
import pessoaRoutes from "./routes/pessoaRoutes";
import professorRoutes from "./routes/professorRoutes";
import professorDisciplinaRoutes from "./routes/professorDisciplinaRoutes";
import professorTurmaRoutes from "./routes/professorTurmaRoutes";
import professorTurmaAssRoutes from "./routes/professorTurmaAssRoutes";
import provasRoutes from "./routes/provasRoutes";
import salaRoutes from "./routes/salaRoutes";
import provinciaRoutes from "./routes/provinciaRoutes";
import servicoRoutes from "./routes/servicoRoutes";
import tipoProvaRoutes from "./routes/tipoProvaRoutes";
import tipoUsuarioRoutes from "./routes/tipoUsuarioRoutes";
import turnoRoutes from "./routes/turnoRoutes";
import turmaRoutes from "./routes/turmaRoutes";
import encarregadoRoutes from "./routes/encarregadoRoute";
import { verifyToken } from "./middleware/verifyToken";
import especializacaoRoutes from "./routes/especializacaoRoutes";
import livroRoutes from "./routes/livroRoutes";
import meioRoutes from "./routes/meioRoutes";

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
app.use("/cargos", verifyToken, checkPermissionsAuto, cargoRoutes);
app.use("/anoletivos", verifyToken, checkPermissionsAuto, anoLetivoRoutes);
app.use("/assiduidade", verifyToken, checkPermissionsAuto, assiduidadeRoutes);
app.use("/classes", verifyToken, checkPermissionsAuto, classeRoutes);
app.use(
  "/classedisciplinas",
  verifyToken,
  checkPermissionsAuto,
  classedisciplinaRoutes
);
app.use("/contatos", verifyToken, checkPermissionsAuto, contatoRoutes);
app.use("/cursos", verifyToken, checkPermissionsAuto, cursoRoutes);
app.use("/disciplinas", verifyToken, checkPermissionsAuto, disciplinaRoutes);
app.use("/documentos", verifyToken, checkPermissionsAuto, documentoRoutes);
app.use("/enderecos", verifyToken, checkPermissionsAuto, enderecoRoutes);
app.use("/epocas", verifyToken, checkPermissionsAuto, epocaRoutes);
app.use("/epocaturmas", verifyToken, checkPermissionsAuto, epocaturmaRoutes);
app.use("/funcionarios", verifyToken, checkPermissionsAuto, funcionarioRoutes);
app.use("/horarios", verifyToken, checkPermissionsAuto, horarioRoutes);
app.use("/matriculas", verifyToken, checkPermissionsAuto, matriculaRoutes);
app.use("/municipios", verifyToken, checkPermissionsAuto, municipioRoutes);
app.use("/pagamentos", verifyToken, checkPermissionsAuto, pagamentoRoutes);
app.use("/permissoes", verifyToken, checkPermissionsAuto, permissaoRoutes);
app.use("/pessoas", verifyToken, checkPermissionsAuto, pessoaRoutes);
app.use("/professores", verifyToken, checkPermissionsAuto, professorRoutes);
app.use(
  "/professordisciplinas",
  verifyToken,
  checkPermissionsAuto,
  professorDisciplinaRoutes
);
app.use(
  "/professorturmas",
  verifyToken,
  checkPermissionsAuto,
  professorTurmaRoutes
);
app.use(
  "/professorturmaass",
  verifyToken,
  checkPermissionsAuto,
  professorTurmaAssRoutes
);
app.use("/provas", verifyToken, checkPermissionsAuto, provasRoutes);
app.use("/salas", verifyToken, checkPermissionsAuto, salaRoutes);
app.use("/servicos", verifyToken, checkPermissionsAuto, servicoRoutes);
app.use("/tipoprovas", verifyToken, checkPermissionsAuto, tipoProvaRoutes);
app.use("/provincias", verifyToken, checkPermissionsAuto, provinciaRoutes);
app.use("/tipousuarios", verifyToken, checkPermissionsAuto, tipoUsuarioRoutes);
app.use("/turnos", verifyToken, checkPermissionsAuto, turnoRoutes);
app.use("/turmas", verifyToken, checkPermissionsAuto, turmaRoutes);
app.use("/uploads", express.static(path.join(__dirname, "uploads")));
app.use("/encarregados", verifyToken, checkPermissionsAuto, encarregadoRoutes);
app.use(
  "/especializacoes",
  verifyToken,
  checkPermissionsAuto,
  especializacaoRoutes
);
app.use("/livros", verifyToken, checkPermissionsAuto, livroRoutes);
app.use("/meios", verifyToken, checkPermissionsAuto, meioRoutes);
checkDatabaseConnection().then(() => {
  const port = process.env.PORT || 8083;
  app.listen(port, () => {
    console.log(`Servidor rodando na porta ${port}`);
  });
});
