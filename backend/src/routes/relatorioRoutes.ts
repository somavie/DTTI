import express from "express";
import * as relatorioController from "../controllers/relatorioController";

const router = express.Router();

router.post("/", relatorioController.CreateRelatorioE);
router.get("/", relatorioController.getAllRelatorios);
router.get("/:id", relatorioController.getRelatorioById);
router.put("/:id", relatorioController.updateRelatorio);
router.patch("/:id", relatorioController.softDeleteRelatorio); // Soft delete
router.delete("/relatorio/:id", relatorioController.deleteRelatorio); // Hard delete

export default router;
