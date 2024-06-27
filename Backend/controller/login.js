
import { compare } from "../subsystem/encrypt.js";
import { dbQueries } from "../instances/dbinstances.js";

export const login = async (req, res) => {
  try {
    if(req.body.email === undefined || req.body.password === undefined){
      return res.status(400).send({ message: "El E-mail o la contraseña no están..." });
    }
    console.log(req.body)

    const response = await dbQueries.getUsersByEmail(req.body.email);
    
    let user = response.rows[0];
    
    if (user === undefined) {
      console.log("Incorrect Email");
      return res.status(401).send({ message: "E-mail incorrecto." });
    }
    
    
    const isPasswordMatch  = await compare(req.body.password, user.password);

    if (!isPasswordMatch) {
      return res.status(401).send({ message: "Contraseña incorrecta." });
    } 

    console.log("¡Iniciaste sesión con éxito!");
    req.session.user = user.name;
    req.session.email = req.body.email;
    req.session.loggedin = true;
    return res
      .status(301)
      //.redirect("/Home");
      .send({ message: "¡Iniciaste sesión con éxito!" });
  } catch (error) {
    console.log(error.message);
  }
};

export const logout = (req, res) => {
  req.session.destroy();
  res.status(200).send({ message: "¡Saliste de la sesión con éxito!" });
};
