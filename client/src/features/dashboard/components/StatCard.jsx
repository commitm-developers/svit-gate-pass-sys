export default function StatCard({ label, value = "—", icon: Icon }) {
  return (
    <article className="stat-card">
      <div><p>{label}</p><strong>{value}</strong></div>
      {Icon && <Icon size={22} aria-hidden="true" />}
    </article>
  );
}
