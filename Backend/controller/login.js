import { compare } from "../subsystem/encrypt.js";
import { dbQueries } from "../instances/dbinstances.js";

export const login = async (req, res) => {
  try {
    if (req.body.email === undefined || req.body.password === undefined) {
      return res.send({
        success: false,
        message: "Missing email or password",
      });
    }
    console.log(req.body);

    const response = await dbQueries.getUsersByEmail(req.body.email);

    let user = response.rows[0];

    if (user === undefined) {
      console.log("Incorrect Email");
      return res.send({
        success: false,
        message: "Incorrect Email",
      });
    }

    const isPasswordMatch = await compare(req.body.password, user.pass_usuario);

    if (!isPasswordMatch) {
      return res.send({
        success: false,
        message: "Incorrect Password",
      });
    }

    req.session.idUser = user.id_usuario;
    req.session.idPersone = user.id_persona;
    req.session.user = user.name;
    req.session.email = req.body.email;
    req.session.loggedin = true;

    return res.send({
      message: "You logged in succesfully!",
      success: true,
    });
  } catch (error) {
    return res.send({
      success: false,
      message: error.message,
    });
  }
};

export const logout = (req, res) => {
  req.session.destroy();
  res.send({
    message: "You logged out succesfully!",
    success: true,
  });
};
