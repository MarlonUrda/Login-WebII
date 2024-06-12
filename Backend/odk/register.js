import { pool } from "../database/pool.js";
import { encryptPass } from "./encrypt.js";

export const regApi = async (req, res) => {
  const { username, email, password } = req.body;

  const passwordEncrypt = encryptPass(password);

  const values = [email, passwordEncrypt, username];
  try {
    const result = await pool.query(
      "INSERT INTO users (email, password, name) VALUES ($1, $2, $3)",
      values
    );
    res.status(201).send({ message: "Datos insertados: " + values });
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: error.message });
  }
};
