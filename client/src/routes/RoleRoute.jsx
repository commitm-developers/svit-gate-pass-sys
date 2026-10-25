import { Navigate, Outlet } from "react-router-dom";
import { ROUTES } from "../constants/routes.js";
import { useAuth } from "../features/auth/hooks/useAuth.js";

export default function RoleRoute({ allowedRoles }) {
  const { user } = useAuth();
  return allowedRoles.includes(user?.role) ? (
    <Outlet />
  ) : (
    <Navigate to={ROUTES.NOT_FOUND} replace />
  );
}
