import express from "express";
import * as postoController from "../controllers/postoController";

const router = express.Router();

router.post("/", postoController.createPosto);
router.get("/", postoController.getAllPostos);
router.get("/:id", postoController.getPostoById);
router.put("/:id", postoController.updatePosto);
router.patch("/:id", postoController.softDeletePosto); // Soft delete
router.delete("/posto:id", postoController.deletePosto); // Hard delete

export default router;
