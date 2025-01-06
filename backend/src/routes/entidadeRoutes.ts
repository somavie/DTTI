import { Router } from "express";
import entidadeController from "../controllers/entidadeController";

const router = Router();

router.get("/", entidadeController.getAllEntidades);
router.get("/:id", entidadeController.getEntidadeById);
router.post("/", entidadeController.createEntidade);
router.put("/:id", entidadeController.updateEntidade);
router.delete("/:id", entidadeController.deleteEntidade);
router.get("/:id/radios", entidadeController.getEntidadeRadios);
router.post("/:id/radios", entidadeController.associateRadio);
router.delete("/:entidadeId/radios/:radioId", entidadeController.removeRadio);

export default router;

