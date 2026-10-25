import { render, screen } from "@testing-library/react";
import { describe, it, expect } from "vitest";

describe("test setup", () => {
  it("renders a React element", () => {
    render(<h1>Gate Pass</h1>);
    expect(screen.getByText("Gate Pass")).toBeInTheDocument();
  });
});
