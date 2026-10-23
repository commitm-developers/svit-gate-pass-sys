import { useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import { toast } from "sonner";
import { ROLES } from "../../../constants/roles.js";
import { useAuth } from "../hooks/useAuth.js";
import { getHomeRoute } from "../../../utils/routeForRole.js";
import Button from "../../../components/ui/Button.jsx";
import Input from "../../../components/ui/Input.jsx";

export default function RegisterForm() {
  const { signUp } = useAuth();
  const navigate = useNavigate();
  const [form, setForm] = useState({ name: "", email: "", password: "", role: ROLES.STUDENT });
  const [isSubmitting, setIsSubmitting] = useState(false);

  async function handleSubmit(event) {
    event.preventDefault();
    setIsSubmitting(true);
    try {
      const user = await signUp(form);
      navigate(getHomeRoute(user.role), { replace: true });
    } catch (error) {
      toast.error(error.response?.data?.message || "Unable to create your account. Please try again.");
    } finally {
      setIsSubmitting(false);
    }
  }

  return (
    <form className="form-stack" onSubmit={handleSubmit}>
      <Input label="Full name" required autoComplete="name" value={form.name}
        onChange={(event) => setForm({ ...form, name: event.target.value })} />
      <Input label="Email address" type="email" required autoComplete="email" value={form.email}
        onChange={(event) => setForm({ ...form, email: event.target.value })} />
      <Input label="Password" type="password" minLength={8} required autoComplete="new-password" value={form.password}
        onChange={(event) => setForm({ ...form, password: event.target.value })} />
      <Button type="submit" disabled={isSubmitting}>{isSubmitting ? "Creating account..." : "Create account"}</Button>
      <p className="form-note">Already registered? <Link to="/login">Sign in</Link></p>
    </form>
  );
}
