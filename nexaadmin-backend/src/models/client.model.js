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
  // CORREÇÃO: Usando os campos novos do PDF
  const { nome, sobrenome, email, idade, foto } = data;
  await pool.query(
    "INSERT INTO clientes (nome, sobrenome, email, idade, foto) VALUES (?, ?, ?, ?, ?)",
    [nome, sobrenome, email, idade, foto]
  );
  return { message: "Cliente criado!" };
};

export const update = async (id, data) => {
  // CORREÇÃO: Usando os campos novos no Update também
  const { nome, sobrenome, email, idade, foto } = data;
  await pool.query(
    "UPDATE clientes SET nome=?, sobrenome=?, email=?, idade=?, foto=? WHERE id=?",
    [nome, sobrenome, email, idade, foto, id]
  );
  return { message: "Cliente atualizado!" };
};

export const remove = async (id) => {
  await pool.query("DELETE FROM clientes WHERE id = ?", [id]);
  return { message: "Cliente deletado!" };
};