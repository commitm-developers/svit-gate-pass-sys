import { createBrowserRouter, Navigate } from "react-router-dom";
import ProtectedRoute from "../routes/ProtectedRoute.jsx";
import RoleRoute from "../routes/RoleRoute.jsx";
import AppLayout from "../components/layout/AppLayout.jsx";
import LoginPage from "../pages/public/LoginPage.jsx";
import RegisterPage from "../pages/public/RegisterPage.jsx";
import NotFoundPage from "../pages/public/NotFoundPage.jsx";
import StudentDashboardPage from "../pages/student/StudentDashboardPage.jsx";
import ProfilePage from "../pages/student/ProfilePage.jsx";
import CreatePassPage from "../pages/student/CreatePassPage.jsx";
import HistoryPage from "../pages/student/HistoryPage.jsx";
import ScannerPage from "../pages/security/ScannerPage.jsx";
import StaffDashboardPage from "../pages/security/StaffDashboardPage.jsx";
import SecurityProfilePage from "../pages/security/SecurityProfilePage.jsx";
import AdminDashboardPage from "../pages/admin/AdminDashboardPage.jsx";
import StudentsPage from "../pages/admin/StudentsPage.jsx";
import SecurityStaffPage from "../pages/admin/SecurityStaffPage.jsx";
import { ROLES } from "../constants/roles.js";
import { ROUTES } from "../constants/routes.js";
import { useAuth } from "../features/auth/hooks/useAuth.js";

function HomeRedirect() {
  const { user } = useAuth();
  if (user?.role === ROLES.ADMIN) return <Navigate to={ROUTES.ADMIN} replace />;
  if (user?.role === ROLES.SECURITY) return <Navigate to={ROUTES.SECURITY} replace />;
  return <Navigate to={ROUTES.STUDENT} replace />;
}

export const router = createBrowserRouter([
  { path: ROUTES.LOGIN, element: <LoginPage /> },
  { path: ROUTES.REGISTER, element: <RegisterPage /> },
  {
    element: <ProtectedRoute />,
    children: [
      {
        element: <AppLayout />,
        children: [
          { path: "/", element: <HomeRedirect /> },
          {
            element: <RoleRoute allowedRoles={[ROLES.STUDENT]} />,
            children: [
              { path: ROUTES.STUDENT, element: <StudentDashboardPage /> },
              { path: ROUTES.PROFILE, element: <ProfilePage /> },
              { path: ROUTES.CREATE_PASS, element: <CreatePassPage /> },
              { path: ROUTES.HISTORY, element: <HistoryPage /> },
            ],
          },
          {
            element: <RoleRoute allowedRoles={[ROLES.SECURITY]} />,
            children: [
              { path: ROUTES.SECURITY, element: <StaffDashboardPage /> },
              { path: ROUTES.SCANNER, element: <ScannerPage /> },
              { path: ROUTES.SECURITY_PROFILE, element: <SecurityProfilePage /> },
            ],
          },
          {
            element: <RoleRoute allowedRoles={[ROLES.ADMIN]} />,
            children: [
              { path: ROUTES.ADMIN, element: <AdminDashboardPage /> },
              { path: ROUTES.STUDENTS, element: <StudentsPage /> },
              { path: ROUTES.SECURITY_STAFF, element: <SecurityStaffPage /> },
            ],
          },
        ],
      },
    ],
  },
  { path: "*", element: <NotFoundPage /> },
]);
