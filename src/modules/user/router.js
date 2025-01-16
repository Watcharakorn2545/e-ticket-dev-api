import { Router } from "express";
import { getUsersController } from "./controller.js";

// const { Router } = require("express");
// const { getUsersController } = require("./controller");

const router = Router();

router.get('/', getUsersController);

export default router;