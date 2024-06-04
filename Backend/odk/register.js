import { pool } from "../database/pool.js";

export const regApi = async (req, res) => {
  const { name, email, password } = req.body;
  const values = [email, password, name];
  try {
    const result = await pool.query(
      "INSERT INTO users (email, password, name) VALUES ($1, $2, $3)",
      values
    );
    res.status(201).send(result.rows[0]);
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: error.message });
  }
};
