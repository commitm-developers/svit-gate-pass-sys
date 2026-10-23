import { ArrowUpRight, Clock3, FileCheck2 } from "lucide-react";
import { Link } from "react-router-dom";
import PageHeader from "../../components/layout/PageHeader.jsx";
import StatCard from "../../features/dashboard/components/StatCard.jsx";
import PassHistory from "../../features/gatepass/components/PassHistory.jsx";
import { ROUTES } from "../../constants/routes.js";

export default function StudentDashboardPage() {
  return (
    <>
      <PageHeader title="Student dashboard" description="Manage your gate pass requests and profile." />
      <div className="stats-grid">
        <StatCard label="Passes requested" value="—" icon={FileCheck2} />
        <StatCard label="Pending approvals" value="—" icon={Clock3} />
      </div>
      <section className="content-section">
        <div className="row-between"><h2>Recent passes</h2><Link to={ROUTES.HISTORY}>View history <ArrowUpRight size={15} /></Link></div>
        <PassHistory />
      </section>
    </>
  );
}
