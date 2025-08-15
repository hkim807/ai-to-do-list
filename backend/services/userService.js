import { supabase } from "../utils/supabaseClient.js";

export async function getUserPreferencesService(userId) {
  const { data, error } = await supabase
    .from("user_information")
    .select(
      "priority_information, importance_information, preferred_no_deadline_feel, preferred_work_time, deadline_management"
    )
    .eq("user_id", userId)
    .single();

  if (error) throw new Error(error.message);

  console.log("User preferences retrieved:", data[0]);
  return data;
}
