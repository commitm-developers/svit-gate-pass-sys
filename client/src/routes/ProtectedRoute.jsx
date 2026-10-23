import { Navigate, Outlet } from "react-router-dom";
import Loader from "../components/ui/Loader.jsx";
import { useAuth } from "../features/auth/hooks/useAuth.js";
import { ROUTES } from "../constants/routes.js";

export default function ProtectedRoute() {
  const { user, isLoading } = useAuth();
  if (isLoading) return <Loader label="Loading your account..." />;
  return user ? <Outlet /> : <Navigate to={ROUTES.LOGIN} replace />;
}
