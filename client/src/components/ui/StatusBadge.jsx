import { PASS_STATUS } from "../../constants/passStatus.js";

export default function StatusBadge({ status = PASS_STATUS.PENDING }) {
  const normalized = String(status).toLowerCase().replaceAll(" ", "-");
  return <span className={`status-badge status-${normalized}`}>{status}</span>;
}
