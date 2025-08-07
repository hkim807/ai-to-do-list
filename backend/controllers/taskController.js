// This file contains the task controller logic for handling task creation requests.

import { createTaskService } from "../services/taskService.js";

export async function createTask(req, res) {
  const { taskDescription } = req.body;
  console.log("Received task description:", taskDescription);

  try {
    const task = await createTaskService(taskDescription);
    res.status(201).json({ task });
  } catch (err) {
    console.error("Error creating task:", err.message);
    res.status(500).json({ error: "Failed to create task." });
  }
}
