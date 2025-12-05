import { pool } from "../config/db.js";

export const getAll = async () => {
  const [rows] = await pool.query("SELECT * FROM clientes");
  return rows;
};

export const getById = async (id) => {
  const [rows] = await pool.query("SELECT * FROM clientes WHERE id = ?", [id]);
  return rows[0];
};

export const create = async (data) => {
  const { nome, email, telefone, cidade } = data;
  await pool.query(
    "INSERT INTO clientes (nome, email, telefone, cidade) VALUES (?, ?, ?, ?)",
    [nome, email, telefone, cidade]
  );
  return { message: "Cliente criado!" };
};

export const update = async (id, data) => {
  const { nome, email, telefone, cidade } = data;
  await pool.query(
    "UPDATE clientes SET nome=?, email=?, telefone=?, cidade=? WHERE id=?",
    [nome, email, telefone, cidade, id]
  );
  return { message: "Cliente atualizado!" };
};

export const remove = async (id) => {
  await pool.query("DELETE FROM clientes WHERE id = ?", [id]);
  return { message: "Cliente deletado!" };
};
