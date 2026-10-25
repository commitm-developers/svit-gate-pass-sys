import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query";
import { toast } from "sonner";
import PageHeader from "../../components/layout/PageHeader.jsx";
import Loader from "../../components/ui/Loader.jsx";
import ErrorState from "../../components/common/ErrorState.jsx";
import SecurityForm from "../../features/admin/components/SecurityForm.jsx";
import SecurityList from "../../features/admin/components/SecurityList.jsx";
import { createSecurityStaff, getSecurityStaff } from "../../features/admin/api.js";

export default function SecurityStaffPage() {
  const queryClient = useQueryClient();
  const query = useQuery({ queryKey: ["admin", "security-staff"], queryFn: getSecurityStaff });
  const createStaff = useMutation({
    mutationFn: createSecurityStaff,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["admin", "security-staff"] });
      toast.success("Security staff account created.");
    },
    onError: (error) =>
      toast.error(error.response?.data?.message || "Could not add security staff."),
  });
  return (
    <>
      <PageHeader
        title="Security staff"
        description="Manage staff accounts with campus pass verification access."
      />
      <section className="content-section card">
        <h2>Add staff member</h2>
        <SecurityForm onSubmit={(staff) => createStaff.mutate(staff)} />
      </section>
      <section className="content-section">
        <h2>Staff accounts</h2>
        {query.isLoading ? (
          <Loader label="Loading staff..." />
        ) : query.isError ? (
          <ErrorState message="Staff list could not be loaded." onRetry={query.refetch} />
        ) : (
          <SecurityList staff={Array.isArray(query.data) ? query.data : query.data?.staff || []} />
        )}
      </section>
    </>
  );
}
