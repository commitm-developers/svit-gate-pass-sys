import { useState } from "react";
import Button from "../../../components/ui/Button.jsx";
import Input from "../../../components/ui/Input.jsx";

export default function QrScanner({ onScan }) {
  const [code, setCode] = useState("");
  return (
    <form
      className="form-stack card"
      onSubmit={(event) => {
        event.preventDefault();
        onScan?.(code);
      }}
    >
      <p>Enter the pass code to verify a student gate pass.</p>
      <Input
        label="Pass code"
        required
        value={code}
        onChange={(event) => setCode(event.target.value)}
      />
      <Button type="submit">Verify pass</Button>
    </form>
  );
}
