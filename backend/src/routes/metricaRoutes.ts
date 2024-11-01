// routes/metricaRoutes.ts
import { Router } from "express";
import MetricaController from "../controllers/MetricaController";

const router = Router();

router.get("/", MetricaController.getAll);
router.get("/:id", MetricaController.getById);
router.get("/data/:data", MetricaController.getByDay);
router.post("/", MetricaController.create);
router.put("/:id", MetricaController.update);
router.delete("/:id", MetricaController.delete);

export default router;
