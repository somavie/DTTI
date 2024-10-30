// routes/turnoRoutes.ts
import { Router } from "express";
import TurnoController from "../controllers/TurnoController";

const router = Router();

router.get("/", TurnoController.getAll);
router.get("/:id", TurnoController.getById);
router.post("/", TurnoController.create);
router.put("/:id", TurnoController.update);
router.delete("/:id", TurnoController.delete);

export default router;
