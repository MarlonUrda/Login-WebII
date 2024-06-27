import { encrypt } from "../subsystem/encrypt.js";
import { dbQueries } from "../instances/dbinstances.js";

export const register = async (req, res) => {
  console.log("s");
  const { username, email, password } = req.body;
  const passwordEncrypt = await encrypt(password);

  try {
    const resultbyEmail = await dbQueries.getUsersByEmail(email);

    const resultbyPass= await dbQueries.getUsersByPassword(passwordEncrypt);

    if (resultbyEmail.rows.length > 0) {
      return res.status(400).json({ message: "El E-mail ya existe." });
    }

    if (resultbyPass.rows.length > 0) {
      return res.status(400).json({ message: "La contraseña ya existe." });
    }

    const result = await dbQueries.insertUser(email, passwordEncrypt,username);

    if (result) {
      res.status(201).send({ message: "Datos insertados: " ,email, username, password});
    } else {
      return res.status(400).send({ message: "Error al insertar los datos." });
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: error.message });
  }
};

export const registerPerson = async (req, res) => {
  const { name, lastname, phone } = req.body;

  console.log(name, lastname, phone);

  try {
    const result = await dbQueries.insertPerson(name, lastname, phone);

    if (result) {
      res.status(201).send({ message: "Datos insertados: " ,name, lastname, phone});
    } else {
      return res.status(400).send({ message: "Error al insertar los datos" });
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: error.message });
  }
}