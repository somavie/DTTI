import { Router } from "express";
import GruposController from "../controllers/GruposController";

const router = Router();

router.get("/", GruposController.getAll);
router.get("/:id", GruposController.getById);
router.post("/", GruposController.create);
router.put("/:id", GruposController.update);
router.delete("/:id", GruposController.delete);
router.get("/:id/entidades", GruposController.getEntidades);
router.post("/:id/entidades", GruposController.associateEntidades);
router.delete("/:grupoId/entidades/:entidadeId", GruposController.removeEntidadeFromGrupo);
router.get("/:id/radios", GruposController.getRadios);
router.get("/grupos/with-entidades-and-radios", GruposController.getGruposWithEntidadesAndRadios);

export default router;

