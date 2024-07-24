import { dbQueries } from "../instances/dbinstances.js";

class Objectives {
  constructor() {}

  static async createObjective(nameO, objdesc, idProject, dateLimit) {
    console.log("create", nameO,objdesc,idProject,dateLimit)
    try {
      const query = await dbQueries.insertObjective(
        nameO,
        objdesc,
        idProject,
        dateLimit
      );
      if (query) {
        let idObjective = query.rows[0].objective_id;
        console.log("Objetivo creado con exito!");
        return {
          success: true,
          message: `Objetivo: ${nameO} creado con exito!`,
          idO: idObjective,
        };
      } else {
        console.log("No se pudo crear el objetivo");
        return {
          success: false,
          code: 400,
          message: "No se pudo crear el objetivo",
        };
      }
    } catch (error) {
      console.error(error.message);
      return {
        success: false,
        code: 500,
        message: "Error interno del servidor",
      };
    }
  }

  static async getObjectives(idProject) {
    console.log(idProject);
    try {
      const query = await dbQueries.getObjectivesFromProject(idProject);

      if (query) {
        let objectives = [];

        if (query.rows.length === 0) {
          return {
            success: true,
            message: "No hay objetivos para este proyecto!",
            objectives: [],
          };
        }
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
          message: "Hubo un error al cargar los objetivos!",
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

  static async deleteObjective(idObjective) {
    try {
      const query = await dbQueries.deleteObjective(idObjective);

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
        message: "Error interno del servidor",
      };
    }
  }

  static async updateObjective(newName, newDesc, newDateLimit, idOb) {
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
          message: "No se pudo actualizar el objetivo",
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
