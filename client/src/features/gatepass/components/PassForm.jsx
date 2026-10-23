import { useState } from "react";
import { toast } from "sonner";
import Button from "../../../components/ui/Button.jsx";
import Input from "../../../components/ui/Input.jsx";
import { useCreatePass } from "../hooks/usePasses.js";

export default function PassForm() {
  const [reason, setReason] = useState("");
  const [expectedReturn, setExpectedReturn] = useState("");
  const createPass = useCreatePass();

  async function submit(event) {
    event.preventDefault();
    try {
      await createPass.mutateAsync({ reason, expectedReturn });
      toast.success("Gate pass request submitted.");
      setReason("");
      setExpectedReturn("");
    } catch (error) {
      toast.error(error.response?.data?.message || "Could not submit the gate pass request.");
    }
  }

  return (
    <form className="form-stack card" onSubmit={submit}>
      <Input label="Reason for leaving" required value={reason} onChange={(event) => setReason(event.target.value)} />
      <Input label="Expected return" type="datetime-local" required value={expectedReturn}
        onChange={(event) => setExpectedReturn(event.target.value)} />
      <Button disabled={createPass.isPending}>{createPass.isPending ? "Submitting..." : "Request gate pass"}</Button>
    </form>
  );
}
