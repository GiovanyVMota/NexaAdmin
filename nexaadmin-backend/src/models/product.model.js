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
  // CORREÇÃO: Recebe descricao e data_atualizado em vez de estoque/categoria
  const { nome, descricao, preco, data_atualizado } = data;
  
  await pool.query(
    "INSERT INTO produtos (nome, descricao, preco, data_atualizado) VALUES (?, ?, ?, ?)",
    [nome, descricao, preco, data_atualizado]
  );
  return { message: "Produto criado!" };
};

export const update = async (id, data) => {
  // CORREÇÃO: Atualiza os campos corretos no banco
  const { nome, descricao, preco, data_atualizado } = data;
  
  await pool.query(
    "UPDATE produtos SET nome=?, descricao=?, preco=?, data_atualizado=? WHERE id=?",
    [nome, descricao, preco, data_atualizado, id]
  );
  return { message: "Produto atualizado!" };
};

export const remove = async (id) => {
  await pool.query("DELETE FROM produtos WHERE id = ?", [id]);
  return { message: "Produto deletado!" };
};