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
        error: error,
      };
    }
  }

  static async getObjectives(params) {
    [idProject] = params;

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
        message: error.message,
      };
    }
  }

  static async deleteObjective(params) {
    [idOb] = params;

    try {
      const query = await dbQueries.deleteObjective(idOb);

      if (query) {
        console.log("Objetivo eliminado");
        return {
          success: true,
          message: "Objetivo eliminado exitosamente!",
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
        error: error,
      };
    }
  }

  static async updateObjective(params) {
    const [newDesc, newDateLimit, idOb] = params;
    try {
      const query = await dbQueries.updateObjective(
        newDesc,
        newDateLimit,
        idOb
      ); //Preguntar mañana sobre los updates

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
        message: "Error interno del servidor",
      };
    }
  }
}

export default Objectives;
