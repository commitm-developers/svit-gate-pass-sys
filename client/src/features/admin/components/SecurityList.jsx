import EmptyState from "../../../components/common/EmptyState.jsx";

export default function SecurityList({ staff = [] }) {
  if (!staff.length) return <EmptyState title="No security staff found" />;
  return <ul className="data-list">{staff.map((person) => <li key={person._id || person.id}>{person.name} <span>{person.email}</span></li>)}</ul>;
}
