import { security } from "../instances/dbinstances.js";

export const toProcess = async (req, res) => {
  try {
    //Validar si el usuario tiene session
    if (!req.session.loggedin) {
      return res.status(401).send({ error: "No tiene session" });
    }

    const validate = await security.validPermissions(req, req.session.perfil);

    //Validar si el usuario tiene permisos para ejecutar el metodo solicitado
    if (!validate) {
      return res
        .status(401)
        .send({ error: "No tiene autorizacion para ejecutar el metodo!" });
    }

    const obj = await import(`../BO/${req.body.clase}.js`);

    //Validar si el metodo solicitado es una función
    if (!(typeof obj.default[req.body.metodo] === "function")) {
      return res
        .status(401)
        .send({ error: "El método solicitado no es una función" });
    }

    console.log(req.body.params);

    //console.log('req.body.metodo',req.body.metodo);
    const response = await obj.default[req.body.metodo](
      ...Object.values(req.body.params)
    );
    return res.status(200).send(response);
  } catch (error) {
    console.log("error en toProcess", error);
    res.status(500).send({ error: "Error al procesar la solicitud." });
  }
};
