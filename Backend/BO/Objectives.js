import { dbQueries } from "../instances/dbinstances";

class Objectives {
  constructor() {}

  static async createObjective(params) {
    const [nameO, dateLimit, idProject] = params;

    try {
      const query = await dbQueries.insertObjective(
        nameO,
        dateLimit,
        idProject
      );
      if (query) {
        let idObjective = query.rows[0].id_objetivo;
        console.log("Objetico creado con exito!");
        return {
          status: "success",
          message: "Objetivo creado con exito",
          idO: idObjective,
        };
      } else {
        console.log("No se pudo crear el objetivo");
        return {
          status: "error",
          message: "No se pudo crear el objetivo",
        };
      }
    } catch (error) {
      console.error(error.message);
    }
  }
}

export default Objectives;
