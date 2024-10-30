// routes/grupoRoutes.ts
import { Router } from "express";
import GrupoController from "../controllers/GrupoController";

const router = Router();

router.get("/", GrupoController.getAll);
router.get("/:id", GrupoController.getById);
router.post("/", GrupoController.create);
router.put("/:id", GrupoController.update);
router.delete("/:id", GrupoController.delete);

export default router;
