import { describe, it, expect } from "vitest";

describe("test setup", () => {
  it("runs in test mode with test secrets", () => {
    expect(process.env.NODE_ENV).toBe("test");
    expect(process.env.QR_SECRET).toBeDefined();
  });
});
