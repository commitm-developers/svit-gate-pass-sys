import "dotenv/config";
import app from "./app.js";
import { connectDatabase, disconnectDatabase } from "./config/database.js";

const port = Number(process.env.PORT) || 5000;

const startServer = async () => {
  await connectDatabase();

  const server = app.listen(port, () => {
    console.info(`Server listening on port ${port}`);
  });

  const shutdown = (signal) => {
    console.info(`${signal} received; shutting down`);
    server.close(async (error) => {
      if (error) {
        console.error("Failed to close the HTTP server", error);
        process.exitCode = 1;
      }

      try {
        await disconnectDatabase();
      } catch (disconnectError) {
        console.error("Failed to disconnect from MongoDB", disconnectError);
        process.exitCode = 1;
      }
    });
  };

  process.once("SIGINT", () => shutdown("SIGINT"));
  process.once("SIGTERM", () => shutdown("SIGTERM"));
};

startServer().catch((error) => {
  console.error("Failed to start the server", error);
  process.exitCode = 1;
});
