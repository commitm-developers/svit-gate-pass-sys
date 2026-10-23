import { Clock3, UserRoundCheck } from "lucide-react";
import PageHeader from "../../components/layout/PageHeader.jsx";
import StatCard from "../../features/dashboard/components/StatCard.jsx";
import OutNowTable from "../../features/dashboard/components/OutNowTable.jsx";

export default function StaffDashboardPage() {
  return (
    <>
      <PageHeader title="Security dashboard" description="Monitor active gate passes and student movement." />
      <div className="stats-grid">
        <StatCard label="Students currently out" value="—" icon={UserRoundCheck} />
        <StatCard label="Passes awaiting review" value="—" icon={Clock3} />
      </div>
      <section className="content-section"><h2>Students currently out</h2><OutNowTable /></section>
    </>
  );
}
