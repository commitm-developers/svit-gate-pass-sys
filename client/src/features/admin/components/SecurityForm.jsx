import { useState } from "react";
import Button from "../../../components/ui/Button.jsx";
import Input from "../../../components/ui/Input.jsx";

export default function SecurityForm({ onSubmit }) {
  const [form, setForm] = useState({ name: "", email: "" });
  return (
    <form
      className="inline-form"
      onSubmit={(event) => {
        event.preventDefault();
        onSubmit?.(form);
      }}
    >
      <Input
        label="Name"
        required
        value={form.name}
        onChange={(event) => setForm({ ...form, name: event.target.value })}
      />
      <Input
        label="Email"
        type="email"
        required
        value={form.email}
        onChange={(event) => setForm({ ...form, email: event.target.value })}
      />
      <Button type="submit">Add staff</Button>
    </form>
  );
}
