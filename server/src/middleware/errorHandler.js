const errorHandler = (error, _req, res, _next) => {
  if (res.headersSent) {
    return;
  }

  const status = Number(error.status) || 500;
  const message =
    status < 500 || process.env.NODE_ENV !== "production"
      ? error.message
      : "Internal server error";

  if (status >= 500) {
    console.error(error);
  }

  res.status(status).json({ error: message });
};

export { errorHandler };
