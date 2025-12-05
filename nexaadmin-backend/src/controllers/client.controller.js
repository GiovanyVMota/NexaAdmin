import * as Client from "../models/client.model.js";

export const getAll = async (req, res) => {
  res.json(await Client.getAll());
};

export const getById = async (req, res) => {
  res.json(await Client.getById(req.params.id));
};

export const create = async (req, res) => {
  res.json(await Client.create(req.body));
};

export const update = async (req, res) => {
  res.json(await Client.update(req.params.id, req.body));
};

export const remove = async (req, res) => {
  res.json(await Client.remove(req.params.id));
};
