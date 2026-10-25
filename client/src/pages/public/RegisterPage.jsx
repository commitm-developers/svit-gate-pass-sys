import { Navigate } from "react-router-dom";
import RegisterForm from "../../features/auth/components/RegisterForm.jsx";
import { useAuth } from "../../features/auth/hooks/useAuth.js";

export default function RegisterPage() {
  const { user } = useAuth();
  if (user) return <Navigate to="/" replace />;
  return (
    <main className="auth-page">
      <section className="auth-card card">
        <a className="brand brand-auth" href="/">
          SVIT <span>Gate Pass</span>
        </a>
        <h1>Create your account</h1>
        <p>Register as a student to request and track gate passes.</p>
        <RegisterForm />
      </section>
    </main>
  );
}
