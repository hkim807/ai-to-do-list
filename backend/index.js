// Entry point for the backend server - this file sets up the Express app and routes.

import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import taskRoutes from "./routes/tasks.js";

dotenv.config();

const app = express(); // this is where you instantiate the app
app.use(cors()); // use CORS middleware
app.use(express.json()); // parse incoming JSON

const PORT = process.env.PORT || 8080;

// Middleware
app.use(cors());
app.use(express.json());

// Routes
app.use("/api/tasks", taskRoutes);

// Start server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
