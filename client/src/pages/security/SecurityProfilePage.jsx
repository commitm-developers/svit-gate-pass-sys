import PageHeader from "../../components/layout/PageHeader.jsx";
import { useAuth } from "../../features/auth/hooks/useAuth.js";

export default function SecurityProfilePage() {
  const { user } = useAuth();
  return (
    <>
      <PageHeader title="Staff profile" description="Your security staff account details." />
      <section className="card"><h2>{user?.name || "Security staff"}</h2><p>{user?.email}</p></section>
    </>
  );
}
