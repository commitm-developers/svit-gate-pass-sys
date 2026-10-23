import { Link } from "react-router-dom";

export default function NotFoundPage() {
  return (
    <main className="auth-page">
      <section className="auth-card card empty-state">
        <p className="eyebrow">404</p>
        <h1>Page not found</h1>
        <p>The page you requested does not exist or you do not have access to it.</p>
        <Link className="button button-primary" to="/">Go to dashboard</Link>
      </section>
    </main>
  );
}
