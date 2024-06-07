import { pool } from "../database/pool.js";

export const login = async (req, res) => {
  console.log(req.body.email, req.body.password);
  const response = await pool.query("SELECT * FROM users WHERE email = $1", [
    req.body.email,
  ]);

  let user = response.rows[0];

  console.log(response.rows);

  if (response.length === 0) {
    res.status(404).send({ message: "User not found" });
    return;
  }

  if (!user || !user.password) {
    res.status(401).send({ message: "Usuario no autorizado" });
  } else if (user.password.trim() === req.body.password.trim()) {
    res.status(200).send({ message: "You logged in succesfully!" });
    console.log(user);
    req.session.user = user;
    req.session.loggedin = true;
  }
};

export const logout = (req, res) => {
  req.session.destroy();
  res.status(200).send({ message: "You logged out succesfully!" });
};
