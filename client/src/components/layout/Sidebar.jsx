import { NavLink } from "react-router-dom";
import { ROUTES } from "../../constants/routes.js";
import { ROLES } from "../../constants/roles.js";
import { useAuth } from "../../features/auth/hooks/useAuth.js";

const links = {
  [ROLES.STUDENT]: [
    ["Dashboard", ROUTES.STUDENT],
    ["My profile", ROUTES.PROFILE],
    ["Request a pass", ROUTES.CREATE_PASS],
    ["Pass history", ROUTES.HISTORY],
  ],
  [ROLES.SECURITY]: [
    ["Dashboard", ROUTES.SECURITY],
    ["Verify a pass", ROUTES.SCANNER],
    ["My profile", ROUTES.SECURITY_PROFILE],
  ],
  [ROLES.ADMIN]: [
    ["Dashboard", ROUTES.ADMIN],
    ["Students", ROUTES.STUDENTS],
    ["Security staff", ROUTES.SECURITY_STAFF],
  ],
};

export default function Sidebar({ open, onNavigate }) {
  const { user } = useAuth();
  return (
    <aside className={`sidebar ${open ? "sidebar-open" : ""}`}>
      <nav aria-label="Main navigation">
        {(links[user?.role] || []).map(([label, to]) => (
          <NavLink
            key={to}
            to={to}
            end
            onClick={onNavigate}
            className={({ isActive }) => (isActive ? "nav-link nav-link-active" : "nav-link")}
          >
            {label}
          </NavLink>
        ))}
      </nav>
    </aside>
  );
}
