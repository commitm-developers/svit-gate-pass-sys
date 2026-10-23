import api from "../../services/axios.js";

export async function getStudents() {
  const { data } = await api.get("/admin/students");
  return data;
}

export async function getSecurityStaff() {
  const { data } = await api.get("/admin/security-staff");
  return data;
}

export async function createSecurityStaff(staff) {
  const { data } = await api.post("/admin/security-staff", staff);
  return data;
}
