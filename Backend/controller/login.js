import { compare } from "../subsystem/encrypt.js";
import { dbQueries } from "../instances/dbinstances.js";

export const login = async (req, res) => {
  try {
    if (req.body.email === undefined || req.body.password === undefined) {
      return res.status(400).send({ message: "Email or Password is missing" });
    }
    console.log(req.body);

    const response = await dbQueries.getUsersByEmail(req.body.email);

    let user = response.rows[0];

    if (user === undefined) {
      console.log("Incorrect Email");
      return res.status(401).send({ message: "Incorrect Email" });
    }

    const isPasswordMatch = await compare(req.body.password, user.pass_usuario);

    if (!isPasswordMatch) {
      return res.status(401).send({ message: "Incorrect Password" });
    }

    console.log("You logged in succesfully!");
    req.session.user = user.name;
    req.session.email = req.body.email;
    req.session.loggedin = true;
    return (
      res
        .status(301)
        //.redirect("/Home");
        .send({ message: "You logged in succesfully!" })
    );
  } catch (error) {
    console.log(error.message);
  }
};

export const logout = (req, res) => {
  req.session.destroy();
  res.status(200).send({ message: "You logged out succesfully!" });
};
