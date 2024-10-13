import express from "express";
import * as tecnicoController from "../controllers/tecnicoController";

const router = express.Router();

router.post("/", tecnicoController.createTecnico);
router.get("/", tecnicoController.getAllTecnicos);
router.get("/:id", tecnicoController.getTecnicoById);
router.put("/:id", tecnicoController.updateTecnico);
router.patch("/:id", tecnicoController.softDeleteTecnico); // Soft delete
router.delete("/tecnico/:id", tecnicoController.deleteTecnico); // Hard delete

export default router;
