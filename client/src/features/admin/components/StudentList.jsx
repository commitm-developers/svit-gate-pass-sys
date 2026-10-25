import EmptyState from "../../../components/common/EmptyState.jsx";
import Table from "../../../components/ui/Table.jsx";

export default function StudentList({ students = [] }) {
  if (!students.length) return <EmptyState title="No students found" />;
  return (
    <Table
      headers={["Name", "Student ID", "Email"]}
      rows={students.map((student) => [student.name, student.studentId, student.email])}
    />
  );
}
