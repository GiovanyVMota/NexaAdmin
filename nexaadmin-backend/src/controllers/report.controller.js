import * as Report from "../models/report.model.js";

export const getAll = async (req, res) => {
  res.json(await Report.getAll());
};
