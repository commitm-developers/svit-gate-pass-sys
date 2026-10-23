import api from "../../services/axios.js";

export async function getPasses() {
  const { data } = await api.get("/gate-passes");
  return data;
}

export async function createPass(request) {
  const { data } = await api.post("/gate-passes", request);
  return data;
}
