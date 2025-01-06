import { Router } from "express";
import RadioController from "../controllers/radioController";

const router = Router();

router.get("/", RadioController.getAllRadios);
router.get("/:id", RadioController.getRadioById);
router.post("/", RadioController.createRadio);
router.put("/:id", RadioController.updateRadio);
router.delete("/:id", RadioController.deleteRadio);
router.get("/:id/status", RadioController.getRadioStatus);

export default router;

