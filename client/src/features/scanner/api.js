import api from "../../services/axios.js";

export async function verifyPass(code) {
  const { data } = await api.post("/gate-passes/verify", { code });
  return data;
}

export async function searchStudent(query) {
  const { data } = await api.get("/students/search", { params: { query } });
  return data;
}
