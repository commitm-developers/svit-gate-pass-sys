import { Navigate } from "react-router-dom";
import LoginForm from "../../features/auth/components/LoginForm.jsx";
import { useAuth } from "../../features/auth/hooks/useAuth.js";

export default function LoginPage() {
  const { user } = useAuth();
  if (user) return <Navigate to="/" replace />;
  return (
    <main className="auth-page">
      <section className="auth-card card">
        <a className="brand brand-auth" href="/">SVIT <span>Gate Pass</span></a>
        <h1>Welcome back</h1>
        <p>Sign in to manage your campus gate passes.</p>
        <LoginForm />
      </section>
    </main>
  );
}
