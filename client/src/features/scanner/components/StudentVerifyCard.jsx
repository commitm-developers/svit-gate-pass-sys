import StatusBadge from "../../../components/ui/StatusBadge.jsx";

export default function StudentVerifyCard({ result }) {
  return (
    <article className="card">
      <div className="row-between"><h2>{result.student?.name || result.name || "Student"}</h2><StatusBadge status={result.status} /></div>
      <p>{result.student?.studentId || result.studentId || "Student details verified"}</p>
      {result.reason && <p>Reason: {result.reason}</p>}
    </article>
  );
}
