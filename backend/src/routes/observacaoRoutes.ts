import express from "express";
import * as observacaoController from "../controllers/observacaoController";

const router = express.Router();

// Rota para criar uma nova observação
router.post("/", observacaoController.createObservacaoController);

// Rota para obter todas as observações
router.get("/", observacaoController.getAllObservacoesController);

// Rota para obter uma observação específica por situacao_id e relatorios_id
router.get(
  "/:situacao_id/:relatorios_id",
  observacaoController.getObservacaoByIdController
);

// Rota para atualizar uma observação específica
router.put(
  "/:situacao_id/:relatorios_id",
  observacaoController.updateObservacaoController
);

// Rota para soft delete de uma observação
router.patch(
  "/:situacao_id/:relatorios_id",
  observacaoController.softDeleteObservacaoController
);

// Rota para excluir permanentemente uma observação
router.delete(
  "/:situacao_id/:relatorios_id",
  observacaoController.deleteObservacaoController
);

export default router;
