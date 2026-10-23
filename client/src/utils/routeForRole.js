import { ROLES } from "../constants/roles.js";
import { ROUTES } from "../constants/routes.js";

export function getHomeRoute(role) {
  if (role === ROLES.ADMIN) return ROUTES.ADMIN;
  if (role === ROLES.SECURITY) return ROUTES.SECURITY;
  return ROUTES.STUDENT;
}
