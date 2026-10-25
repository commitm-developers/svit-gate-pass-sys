import { useState } from "react";
import Button from "../../../components/ui/Button.jsx";
import Input from "../../../components/ui/Input.jsx";

export default function ManualSearch({ onSearch }) {
  const [query, setQuery] = useState("");
  return (
    <form
      className="inline-form"
      onSubmit={(event) => {
        event.preventDefault();
        onSearch?.(query);
      }}
    >
      <Input
        aria-label="Search students"
        placeholder="Search by name or student ID"
        value={query}
        onChange={(event) => setQuery(event.target.value)}
      />
      <Button type="submit" variant="secondary">
        Search
      </Button>
    </form>
  );
}
