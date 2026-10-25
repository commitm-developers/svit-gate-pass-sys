import PageHeader from "../../components/layout/PageHeader.jsx";
import PassForm from "../../features/gatepass/components/PassForm.jsx";

export default function CreatePassPage() {
  return (
    <>
      <PageHeader
        title="Request a gate pass"
        description="Submit your reason and expected return time for approval."
      />
      <PassForm />
    </>
  );
}
