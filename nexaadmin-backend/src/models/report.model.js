import { pool } from "../config/db.js";

export const getAll = async () => {
  const [rows] = await pool.query("SELECT * FROM relatorios");
  return rows;
};
