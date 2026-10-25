import { useState } from "react";
import PageHeader from "../../components/layout/PageHeader.jsx";
import ErrorState from "../../components/common/ErrorState.jsx";
import QrScanner from "../../features/scanner/components/QrScanner.jsx";
import StudentVerifyCard from "../../features/scanner/components/StudentVerifyCard.jsx";
import { usePassVerification } from "../../features/scanner/hooks/usePassVerification.js";

export default function ScannerPage() {
  const verification = usePassVerification();
  const [result, setResult] = useState(null);
  function verify(code) {
    setResult(null);
    verification.mutate(code, { onSuccess: setResult });
  }
  return (
    <>
      <PageHeader
        title="Verify a gate pass"
        description="Check a student's pass before allowing campus entry or exit."
      />
      <QrScanner onScan={verify} />
      {verification.isError && (
        <ErrorState
          message={verification.error.response?.data?.message || "Pass verification failed."}
        />
      )}
      {result && <StudentVerifyCard result={result} />}
    </>
  );
}
