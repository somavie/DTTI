import express from "express";
import * as contatoController from "../controllers/contatoController";

const router = express.Router();

router.post("/", contatoController.createContato);
router.get("/", contatoController.getAllContatos);
router.get("/:id", contatoController.getContatoById);
router.put("/:id", contatoController.updateContato);
router.delete("/:id", contatoController.deleteContato);

export default router;
