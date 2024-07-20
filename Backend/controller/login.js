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

    const isPasswordMatch = await compare(req.body.password, user.password);

    if (!isPasswordMatch) {
      return res.send({
        success: false,
        message: "Incorrect Password",
      });
    }

    const getUser = await dbQueries.getPerson(user.person_id);

    let person = getUser.rows[0];

    req.session.idUser = user.users_id;
    req.session.idPerson = user.person_id;
    req.session.user = user.username;
    req.session.email = req.body.email;
    req.session.loggedin = true;
    req.session.name = person.name;
    req.session.lastname = person.lastname;
    req.session.perfil = "Basico";

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
