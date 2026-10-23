import mongoose from "mongoose";

const connectDatabase = async () => {
  const { MONGODB_URI } = process.env;

  if (!MONGODB_URI) {
    throw new Error("MONGODB_URI must be set before starting the server");
  }

  await mongoose.connect(MONGODB_URI);
  console.info("Connected to MongoDB");
};

const disconnectDatabase = async () => {
  await mongoose.disconnect();
};

export { connectDatabase, disconnectDatabase };
