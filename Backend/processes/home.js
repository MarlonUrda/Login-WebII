import { pool } from "../database/pool.js";
import { compare } from "./encrypt.js";

export const userData = async (req, res) => {
    try {
        console.log(req.body.email, req.body.password);
        const user = req.session.user;
        console.log(user);
        res.json({
            user: user
          });
    } catch (error) {
        console.log(error.message);
    }
};

export const logout = (req, res) => {
  req.session.destroy();
  res.status(200).send({ message: "You logged out succesfully!" });
};
