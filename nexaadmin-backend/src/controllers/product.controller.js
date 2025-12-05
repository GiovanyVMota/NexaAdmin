import * as Product from "../models/product.model.js";

export const getAll = async (req, res) => {
  res.json(await Product.getAll());
};

export const getById = async (req, res) => {
  res.json(await Product.getById(req.params.id));
};

export const create = async (req, res) => {
  res.json(await Product.create(req.body));
};

export const update = async (req, res) => {
  res.json(await Product.update(req.params.id, req.body));
};

export const remove = async (req, res) => {
  res.json(await Product.remove(req.params.id));
};
