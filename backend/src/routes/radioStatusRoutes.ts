import { Router } from "express";
import RadioStatusController from "../controllers/radioStatusController";

const router = Router();

router.post("/", RadioStatusController.createRadioStatus);
router.get("/radio/:radioId/:interval", RadioStatusController.getRadioStatusData);
router.get("/groups/:groupId/entities", RadioStatusController.getGroupEntitiesStatusData);
router.get("/groups", RadioStatusController.getGroupsStatusData);

export default router;