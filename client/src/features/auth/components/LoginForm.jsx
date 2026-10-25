import { useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import { toast } from "sonner";
import { useAuth } from "../hooks/useAuth.js";
import { getHomeRoute } from "../../../utils/routeForRole.js";
import Button from "../../../components/ui/Button.jsx";
import Input from "../../../components/ui/Input.jsx";

export default function LoginForm() {
  const { signIn } = useAuth();
  const navigate = useNavigate();
  const [form, setForm] = useState({ email: "", password: "" });
  const [isSubmitting, setIsSubmitting] = useState(false);

  async function handleSubmit(event) {
    event.preventDefault();
    setIsSubmitting(true);
    try {
      const user = await signIn(form);
      navigate(getHomeRoute(user.role), { replace: true });
    } catch (error) {
      toast.error(error.response?.data?.message || "Unable to sign in. Please try again.");
    } finally {
      setIsSubmitting(false);
    }
  }

  return (
    <form className="form-stack" onSubmit={handleSubmit}>
      <Input
        label="Email address"
        type="email"
        autoComplete="email"
        required
        value={form.email}
        onChange={(event) => setForm({ ...form, email: event.target.value })}
      />
      <Input
        label="Password"
        type="password"
        autoComplete="current-password"
        required
        value={form.password}
        onChange={(event) => setForm({ ...form, password: event.target.value })}
      />
      <Button type="submit" disabled={isSubmitting}>
        {isSubmitting ? "Signing in..." : "Sign in"}
      </Button>
      <p className="form-note">
        New to SVIT Gate Pass? <Link to="/register">Create an account</Link>
      </p>
    </form>
  );
}
