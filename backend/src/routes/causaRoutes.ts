import express from "express";
import * as causaController from "../controllers/causaController";

const router = express.Router();

router.post("/", causaController.createCausa);
router.get("/", causaController.getAllCausas);
router.get("/:id", causaController.getCausaById);
router.put("/:id", causaController.updateCausa);
router.delete("/:id", causaController.deleteCausa);

export default router;
