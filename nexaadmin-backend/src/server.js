import express from "express";
import cors from "cors";
import dotenv from "dotenv";

// Configura .env
dotenv.config();

import clientRoutes from "./routes/client.routes.js";
import productRoutes from "./routes/product.routes.js";
import reportRoutes from "./routes/report.routes.js";

const app = express();

// Middleware
app.use(cors({
  origin: "*",
  methods: ["GET", "POST", "PUT", "DELETE"]
}));
app.use(express.json());

// Rotas
app.use("/clients", clientRoutes);
app.use("/products", productRoutes);
app.use("/reports", reportRoutes);

// Porta
const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`🔥 Servidor rodando na porta ${PORT}`);
});
