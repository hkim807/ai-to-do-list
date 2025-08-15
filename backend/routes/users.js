import express from "express";
import { getUserPreferences } from "../controllers/userController.js";

const router = express.Router();

router.get("/", getUserPreferences);

export default router;
