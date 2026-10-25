import EmptyState from "../../../components/common/EmptyState.jsx";
import Table from "../../../components/ui/Table.jsx";

export default function OutNowTable({ rows = [] }) {
  if (!rows.length) return <EmptyState title="No students currently out" />;
  return (
    <Table
      headers={["Student", "Pass", "Expected return"]}
      rows={rows.map((row) => [row.studentName, row.passCode, row.expectedReturn])}
    />
  );
}
