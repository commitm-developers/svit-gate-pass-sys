import { ShieldCheck, UsersRound } from "lucide-react";
import PageHeader from "../../components/layout/PageHeader.jsx";
import StatCard from "../../features/dashboard/components/StatCard.jsx";
import WeeklyChart from "../../features/dashboard/components/WeeklyChart.jsx";

export default function AdminDashboardPage() {
  return (
    <>
      <PageHeader
        title="Admin dashboard"
        description="Overview of students, staff, and campus pass activity."
      />
      <div className="stats-grid">
        <StatCard label="Registered students" value="—" icon={UsersRound} />
        <StatCard label="Security staff" value="—" icon={ShieldCheck} />
      </div>
      <section className="content-section card">
        <h2>Weekly activity</h2>
        <WeeklyChart />
      </section>
    </>
  );
}
