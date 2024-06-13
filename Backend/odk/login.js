import { pool } from "../database/pool.js";
import { compare } from "./encrypt.js";
export const login = async (req, res) => {
  try {
    console.log(req.body.email, req.body.password);
    const response = await pool.query("SELECT * FROM users WHERE email = $1", [
      req.body.email,
    ]);

    let user = response.rows[0];

    const decPass = await compare(req.body.password, user.password);

    console.log(decPass);

    console.log(response.rows);

    if (response.length === 0) {
      res.status(404).send({ message: "User not found" });
      return;
    }

    if (user === undefined) {
      res.status(401).send({ message: "Incorrect Email" });
      return;
    }

    // if (!user || !user.password) {
    //   res.status(401).send({ message: "Incorrect Password" });
    //   return;
    // }

    if (decPass) {
      res.status(200).send({ message: "You logged in succesfully!" });
      console.log(user);
      req.session.user = user;
      req.session.loggedin = true;
    } else if (!decPass) {
      res.status(401).send({ message: "Incorrect Password" });
      return;
    }
  } catch (error) {
    console.log(error.message);
  }
};

export const logout = (req, res) => {
  req.session.destroy();
  res.status(200).send({ message: "You logged out succesfully!" });
};
