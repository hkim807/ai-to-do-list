// This file contains the task service logic for creating tasks using the Google Gemini AI model.

import { supabase } from "../utils/supabaseClient.js";
import { GoogleGenAI } from "@google/genai";
import dotenv from "dotenv";

dotenv.config();

if (!process.env.GEMINI_API_KEY) {
  throw new Error("Missing Gemini API key in environment variables");
}

const ai = new GoogleGenAI({ apiKey: process.env.GEMINI_API_KEY });

export async function createTaskService(taskDescription) {
  const contents = taskDescription.trim();
  const prompt = `You are an intelligent productivity assistant. Given a raw task description from a user, analyze it using the Eisenhower Matrix.

Your job is to:
- Infer or generate a short **task title**
- Assign an **urgency score** from 0 to 100
- Assign an **importance score** from 0 to 100
- Extract or infer the **due date** if mentioned. If a specific time is mentioned (e.g. "by next Friday"), convert it into an ISO 8601 UTC timestamp ("YYYY-MM-DDTHH:MM:SSZ").
- If no due date is given, return "due_date": null

Today's date is: **${new Date().toISOString().slice(0, 10)}**

IMPORTANT: Return ONLY valid JSON. Do not wrap your response in markdown code blocks or backticks. Return the raw JSON object exactly as shown below:

{
  "title": "string",
  "urgency_score": 0,
  "importance_score": 0,
  "due_date": "YYYY-MM-DDTHH:MM:SSZ or null"
}
`;

  const response = await ai.models.generateContent({
    model: "gemini-2.5-flash",
    contents: contents,
    config: {
      systemInstruction: prompt,
    },
  });

  const parsed = JSON.parse(response.text.trim());

  const { data, error } = await supabase
    .from("tasks")
    .insert([
      {
        title: parsed.title,
        due_date: parsed.due_date,
        importance_score: parsed.importance_score,
        urgency_score: parsed.urgency_score,
      },
    ])
    .select();

  if (error) throw new Error(error.message);

  console.log("Task inserted:", data[0]);
  return data[0];
}
