import PageHeader from "../../components/layout/PageHeader.jsx";
import PassHistory from "../../features/gatepass/components/PassHistory.jsx";

export default function HistoryPage() {
  return (
    <>
      <PageHeader
        title="Pass history"
        description="Review the status of your previous gate pass requests."
      />
      <PassHistory />
    </>
  );
}
