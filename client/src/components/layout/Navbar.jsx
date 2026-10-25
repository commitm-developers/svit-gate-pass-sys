import { LogOut, Menu } from "lucide-react";
import { useAuth } from "../../features/auth/hooks/useAuth.js";
import Button from "../ui/Button.jsx";

export default function Navbar({ onMenuClick }) {
  const { user, logout } = useAuth();
  return (
    <header className="navbar">
      <Button
        variant="ghost"
        className="menu-button"
        aria-label="Open navigation"
        onClick={onMenuClick}
      >
        <Menu />
      </Button>
      <a className="brand" href="/">
        SVIT <span>Gate Pass</span>
      </a>
      <div className="navbar-user">
        <span>{user?.name || user?.email}</span>
        <Button variant="ghost" onClick={logout}>
          <LogOut size={17} /> <span className="logout-label">Sign out</span>
        </Button>
      </div>
    </header>
  );
}
