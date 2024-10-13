import express from "express";
import * as situacaoController from "../controllers/situacaoController";

const router = express.Router();

router.post("/", situacaoController.createSituacao);
router.get("/", situacaoController.getAllSituacoes);
router.get("/:id", situacaoController.getSituacaoById);
router.put("/:id", situacaoController.updateSituacao);
router.patch("/:id", situacaoController.softDeleteSituacao); // Soft delete
router.delete("/situacao/:id", situacaoController.deleteSituacao); // Hard delete

export default router;
