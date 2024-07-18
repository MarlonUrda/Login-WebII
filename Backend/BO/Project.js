import { dbQueries } from "../instances/dbinstances.js";

class Project {
  constructor() {}

  static async createProject(params) {
    const [nameP, typeP, state, startDate, endDate] = params; //modificar state a 1 por defecto en la query
    try {
      const query = await dbQueries.insertProject(
        nameP,
        typeP,
        state,
        startDate,
        endDate
      );

      if (query) {
        console.log("Proyecto creado con exito!.");
        let idProject = query.rows[0].id_proyecto;
        return {
          success: true,
          message: `Proyecto: ${nameP} creado exitosamente!`,
          idProject: idProject,
        };
      } else {
        console.error("Error al crear el proyecto");
        return {
          success: false,
          message: "Error al crear el proyecto",
        };
      }
    } catch (error) {
      console.error("Error al conectar con la base de datos: ", error);
      return {
        success: false,
        message: error.message,
      };
    }
  }

  static async updateProject(params) {
    const [newValue, idProject] = params;

    try {
      const query = await dbQueries.updateProjectName(newValue, idProject);

      if (query) {
        console.log("Nombre del proyecto cambiado a: " + newValue);
        return true;
      } else {
        console.log("Error al actualizar el proyecto.");
        return false;
      }
    } catch (error) {
      console.log("Error: ", error);
    }
  }

  static async getProjectsByPersone(params) {
    let [idPersone] = params;

    try {
      let query = await dbQueries.getProjects(idPersone);
      if (query.rows.length > 0) {
        console.log("Proyectos encontrados:");
        query.rows.forEach((row) => {
          console.log(row);
        });
        return {
          code: 200,
          status: "succes",
        };
      } else {
        return {
          code: 404,
          status: "not found",
          message: "No se encontraron proyectos.",
        };
      }
    } catch (error) {
      return {
        code: 500,
        status: "internal server error",
        message: "Error al conectar con la base de datos.",
      };
    }
  }

  static async deleteProject(params) {
    const [idP] = params;
    try {
      const query = await dbQueries.eliminateProject(idP);
      if (query) {
        console.log("Proyecto eliminado con éxito!");
        return true;
      } else {
        console.error("Error al eliminar el proyecto");
        return false;
      }
    } catch (error) {
      console.error("Error al conectar con la base de datos: ", error);
      return false;
    }
  }
}

export default Project;
