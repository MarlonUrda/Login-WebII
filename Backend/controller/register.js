import { encrypt } from "../subsystem/encrypt.js";
import { dbQueries } from "../instances/dbinstances.js";

export const register = async (req, res) => {
  console.log("s");
  const { name, lastname, ident, username, email, password } = req.body;
  const passwordEncrypt = await encrypt(password);

  try {
    const personeQuery = await dbQueries.insertPerson(name, lastname, ident);
    if (personeQuery) {
      res.status(200).send({ message: "Persona insertada con exito!" });
    } else {
      return res.status(400).json({ message: "Error al insertar la persona" });
    }

    const idPersone = personeQuery.rows[0].id_persona;

    if (!idPersone) return;

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
      idPersone
    );

    if (result) {
      res.status(201).send({
        message: "Datos insertados: ",
        email,
        username,
        password,
        idPersone,
      });
    } else {
      return res.status(400).send({ message: "Error al insertar los datos" });
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: error.message });
  }
};
