import { dbQueries } from "../instances/dbinstances.js";

class Project {
  constructor() {}

  static async createProject(params) {
    const [nameP, typeP, startDate, endDate] = params; //modificar state a 1 por defecto en la query
    try {
      const query = await dbQueries.insertProject(
        nameP,
        typeP,
        startDate,
        endDate
      );

      if (query) {
        console.log("Proyecto creado con exito!.");
        let idProject = query.rows[0].project_id;
        console.log(idProject);
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
    const [newName, newType, newState, newStart, newEnd, idProject] = params;

    try {
      const query = await dbQueries.updateProject(
        newName,
        newType,
        newState,
        newStart,
        newEnd,
        idProject
      );

      if (query) {
        return {
          success: true,
          message: "Proyecto actualizado!",
        };
      } else {
        console.log("Error al actualizar el proyecto.");
        return {
          success: false,
          code: 400,
          message: "Error al actualizar el proyecto.",
        };
      }
    } catch (error) {
      console.log("Error: ", error);
      return {
        success: false,
        code: 500,
        message: "Error al conectar con la base de datos.",
      };
    }
  }

  static async getProjectsByPersone(params) {
    let [idPerson] = params;

    try {
      let query = await dbQueries.getProjects(idPerson);
      if (query.rows.length > 0) {
        let projects = [];
        console.log("Proyectos encontrados:");
        query.rows.forEach((row) => {
          projects.push(row);
        });
        return {
          success: true,
          projects: projects,
        };
      } else {
        return {
          success: false,
          code: 404,
          message: "No se encontraron proyectos.",
        };
      }
    } catch (error) {
      return {
        code: 500,
        success: false,
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
        return {
          success: true,
          message: "Proyecto eliminado!",
        };
      } else {
        console.error("Error al eliminar el proyecto");
        return {
          success: false,
          code: 400,
          message: "Error al eliminar el proyecto",
        };
      }
    } catch (error) {
      console.error("Error al conectar con la base de datos: ", error);
      return {
        success: false,
        code: 500,
        message: "Error al conectar con la base de datos.",
      };
    }
  }
}

export default Project;
