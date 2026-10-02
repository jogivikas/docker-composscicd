import express from "express";
import { Prisma } from "./generated/prisma/browser";
import { PrismaClient } from "./generated/prisma/client";

const app = express();
const PORT = 3000;
const prismaClient = new PrismaClient();

// Middleware
app.use(express.json());

// Routes
app.get("/", async (req, res) => {
  const data = await prismaClient.user.findMany();

  res.json({
    data,
  });
});

app.post("/", async (req, res) => {
  await prismaClient.user.create({
    data: {
      username: Math.random().toString(),
      password: Math.random().toString(),
    },
  });
});

app.get("/api/health", (req, res) => {
  res.json({
    status: "ok",
  });
});

// Start server
app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});