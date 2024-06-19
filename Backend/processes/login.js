import { pool } from "../database/pool.js";
import { compare } from "./encrypt.js";

export const login = async (req, res) => {
  try {
    console.log(req.body.email, req.body.password);
    const response = await pool.query("SELECT * FROM users WHERE email = $1", [
      req.body.email,
    ]);



    let user = response.rows[0];
    
    if (user === undefined) {
      console.log("Incorrect Email");
      return res.status(401).send({ message: "Incorrect Email" });
    }
    
    const decPass = await compare(req.body.password, user.password);



    if (decPass) {
      console.log("You logged in succesfully!");
      req.session.user = user;
      req.session.email = req.body.email;
      req.session.loggedin = true;
      res
        .status(301)
        //.redirect("/Home");
        .send({ message: "You logged in succesfully!" });


    } else if (!decPass) {
      
      return res.status(401).send({ message: "Incorrect Password" });
    }
  } catch (error) {
    console.log(error.message);
  }
};

export const logout = (req, res) => {
  req.session.destroy();
  res.status(200).send({ message: "You logged out succesfully!" });
};
