import express from "express";
import * as equipamentoController from "../controllers/EquipamentoController";

const router = express.Router();

router.post("/", equipamentoController.createEquipamento);
router.get("/", equipamentoController.getAllEquipamentos);
router.get("/:id", equipamentoController.getEquipamentoById);
router.put("/:id", equipamentoController.updateEquipamento);
router.patch("/:id", equipamentoController.softDeleteEquipamento); // Soft delete
router.delete("/equipamentos/:id", equipamentoController.deleteEquipamento); // Hard delete

export default router;
