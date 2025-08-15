// This file contains the user controller logic for handling user preference addition.

import { getUserPreferencesService } from "../services/userService.js";

export async function getUserPreferences(req, res) {
  const { user_id } = req.body;

  try {
    const userPreferences = await getUserPreferencesService(user_id);
    res.status(201).json({ userPreferences });
  } catch (err) {
    console.error("Error retrieving user preferences:", err.message);
    res.status(500).json({ error: "Failed to retrieve user preferences." });
  }
}
