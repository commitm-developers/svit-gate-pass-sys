import api from "../../services/axios.js";

export async function getProfile() {
  const { data } = await api.get("/profile");
  return data;
}

export async function updateProfile(profile) {
  const { data } = await api.put("/profile", profile);
  return data;
}
