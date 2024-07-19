import { dbQueries } from "../instances/dbinstances.js";

class Objectives {
  constructor() {}

  static async createObjective(params) {
    const [nameO, objdesc, idProject, dateLimit] = params;

    try {
      const query = await dbQueries.insertObjective(
        nameO,
        objdesc,
        idProject,
        dateLimit
      );
      if (query) {
        let idObjective = query.rows[0].id_objetivo;
        console.log("Objetivo creado con exito!");
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
      return {
        success: false,
        code: 500,
        message: error.message,
      };
    }
  }

  static async getObjectives(params) {
    const [idProject] = params;

    try {
      const query = await dbQueries.getObjectivesFromProject(idProject);

      if (query) {
        console.log("Objetivos encontrados!");

        let objectives = [];
        query.rows.forEach((row) => {
          objectives.push(row);
        });

        return {
          success: true,
          objectives: objectives,
        };
      } else {
        return {
          success: false,
          message: "Error al obtener los proyectos.",
        };
      }
    } catch (error) {
      return {
        success: false,
        code: 500,
        message: error.message,
      };
    }
  }

  static async deleteObjective(params) {
    const [idOb] = params;

    try {
      const query = await dbQueries.deleteObjective(idOb);

      if (query) {
        let nameObj = query.rows[0].objective_name;
        return {
          success: true,
          message: `Objetivo: ${nameObj} eliminado`,
        };
      } else {
        return {
          success: false,
          message: "Error al eliminar el objetivo",
        };
      }
    } catch (error) {
      return {
        success: false,
        code: 500,
        message: error.message,
      };
    }
  }

  static async updateObjective(params) {
    const [newName, newDesc, newDateLimit, idOb] = params;
    try {
      const query = await dbQueries.updateObjective(
        newName,
        newDesc,
        newDateLimit,
        idOb
      );

      if (query) {
        return {
          success: true,
          message: "Objetivo actualizado",
        };
      } else {
        return {
          success: false,
          code: 400,
          message: "No se puso actualizar el objetivo",
        };
      }
    } catch (error) {
      return {
        success: false,
        code: 500,
        message: error.message,
      };
    }
  }
}

export default Objectives;
