import { encrypt } from "../subsystem/encrypt.js";
import { dbQueries } from "../instances/dbinstances.js";

let idPersona = "";

export const registerPerson = async (req, res) => {
  try {
    const { name, phone, lastname } = req.body;
    console.log(name, phone, lastname);

    const query = await dbQueries.insertPerson(name, phone, lastname);

    if (query) {
      const idPersona = query.rows[0].id_persona;
      console.log(idPersona);

      res.status(200).send({
        message: "Datos personales insertados: ",
        name,
        phone,
        lastname,
      });
      return idPersona;
    } else {
      return res
        .status(400)
        .send({ message: "Error al insertar los datos personales" });
    }
  } catch (error) {
    console.error("Error: ", error);
  }
};
export const register = async (req, res) => {
  console.log("s");
  const { username, email, password } = req.body;
  const passwordEncrypt = await encrypt(password);

  try {
    const resultbyEmail = await dbQueries.getUsersByEmail(email);

    const resultbyPass = await dbQueries.getUsersByPassword(passwordEncrypt);

    if (resultbyEmail.rows.length > 0) {
      return res.status(400).json({ message: "El email ya existe" });
    }

    if (resultbyPass.rows.length > 0) {
      return res.status(400).json({ message: "La contraseña ya existe" });
    }

    const result = await dbQueries.insertUser(
      email,
      passwordEncrypt,
      username,
      idPersona
    );

    if (result) {
      res
        .status(201)
        .send({ message: "Datos insertados: ", email, username, password });
    } else {
      return res.status(400).send({ message: "Error al insertar los datos" });
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: error.message });
  }
};
