import StatusBadge from "../../../components/ui/StatusBadge.jsx";
import { formatDate } from "../../../utils/formatDate.js";

export default function PassCard({ pass }) {
  return (
    <article className="card pass-card">
      <div>
        <h3>{pass.reason || "Gate pass request"}</h3>
        <p>Requested {formatDate(pass.createdAt)}</p>
      </div>
      <StatusBadge status={pass.status} />
    </article>
  );
}
