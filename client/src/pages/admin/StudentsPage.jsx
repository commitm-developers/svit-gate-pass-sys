import { useQuery } from "@tanstack/react-query";
import PageHeader from "../../components/layout/PageHeader.jsx";
import Loader from "../../components/ui/Loader.jsx";
import ErrorState from "../../components/common/ErrorState.jsx";
import StudentList from "../../features/admin/components/StudentList.jsx";
import { getStudents } from "../../features/admin/api.js";

export default function StudentsPage() {
  const { data, isLoading, isError, refetch } = useQuery({
    queryKey: ["admin", "students"],
    queryFn: getStudents,
  });
  return (
    <>
      <PageHeader title="Students" description="Browse registered student accounts." />
      {isLoading ? (
        <Loader label="Loading students..." />
      ) : isError ? (
        <ErrorState message="Student list could not be loaded." onRetry={refetch} />
      ) : (
        <StudentList students={Array.isArray(data) ? data : data?.students || []} />
      )}
    </>
  );
}
