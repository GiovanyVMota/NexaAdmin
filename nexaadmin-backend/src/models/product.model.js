import { pool } from "../config/db.js";

export const getAll = async () => {
  const [rows] = await pool.query("SELECT * FROM produtos");
  return rows;
};

export const getById = async (id) => {
  const [rows] = await pool.query("SELECT * FROM produtos WHERE id = ?", [id]);
  return rows[0];
};

export const create = async (data) => {
  const { nome, preco, estoque, categoria } = data;
  await pool.query(
    "INSERT INTO produtos (nome, preco, estoque, categoria) VALUES (?, ?, ?, ?)",
    [nome, preco, estoque, categoria]
  );
  return { message: "Produto criado!" };
};

export const update = async (id, data) => {
  const { nome, preco, estoque, categoria } = data;
  await pool.query(
    "UPDATE produtos SET nome=?, preco=?, estoque=?, categoria=? WHERE id=?",
    [nome, preco, estoque, categoria, id]
  );
  return { message: "Produto atualizado!" };
};

export const remove = async (id) => {
  await pool.query("DELETE FROM produtos WHERE id = ?", [id]);
  return { message: "Produto deletado!" };
};
