import express from "express";
import * as tecnicoController from "../controllers/tecnicoController";

const router = express.Router();

router.post("/", tecnicoController.createTecnicoController);
router.get("/", tecnicoController.getAllTecnicosController);
router.get("/:id", tecnicoController.getTecnicoByIdController);
router.put("/:id", tecnicoController.updateTecnicoController);
router.patch("/:id", tecnicoController.softDeleteTecnicoController); // Soft delete
router.delete("/tecnico/:id", tecnicoController.deleteTecnicoController); // Hard delete

export default router;
