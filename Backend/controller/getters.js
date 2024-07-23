import { dbQueries } from "../instances/dbinstances.js";

export const getUsers = async (req, res) => {
  try {
    const query = await dbQueries.getUsers();

    if (query) {
      let users = [];

      if (query.rows.length > 0) {
        query.rows.forEach((row) => {
          users.push(row);
        });
      }
      console.log(users);

      console.log("Todo listo");

      return res.send(users);
    }

    return "Error no se pudo obtener a los usuarios";
  } catch (error) {
    console.log("si ", error.message);
  }
};

export const getRoles = async (req, res) => {
  try {
    const query = await dbQueries.getRoles();

    if (query) {
      let roles = [];
      if (query.rows.length > 0) {
        query.rows.forEach((row) => {
          roles.push(row);
        });
      }

      console.log(roles);

      console.log("Roles listos");
      return res.send(roles);
    }

    return "Error pa";
  } catch (error) {
    console.log("Error: ", error.message);
  }
};
