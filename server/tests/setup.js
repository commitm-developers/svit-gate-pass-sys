// Runs before every test file. Use test-only env values here, never real secrets.
process.env.NODE_ENV = "test";
process.env.JWT_SECRET = process.env.JWT_SECRET || "test-jwt-secret";
process.env.QR_SECRET = process.env.QR_SECRET || "test-qr-secret";
