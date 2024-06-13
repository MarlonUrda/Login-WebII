import { pool } from "../database/pool.js";
import { encryptPass } from "./encrypt.js";

export const regApi = async (req, res) => {
  const { username, email, password } = req.body;

  const passwordEncrypt = encryptPass(password);

  const values = [email, passwordEncrypt, username];
  try {
    const em = await pool.query("SELECT * FROM users WHERE email = $1", [
      email,
    ]);
    const pass = await pool.query("SELECT * FROM users WHERE password = $1", [
      password,
    ]);

    if (em.rows.length > 0) {
      return res.status(400).json({ message: "El email ya existe" });
    }

    if (pass.rows.length > 0) {
      return res.status(400).json({ message: "La contraseña ya existe" });
    }

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
