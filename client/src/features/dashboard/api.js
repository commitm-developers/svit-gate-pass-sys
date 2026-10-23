import api from "../../services/axios.js";

export async function getDashboardStats() {
  const { data } = await api.get("/dashboard");
  return data;
}
