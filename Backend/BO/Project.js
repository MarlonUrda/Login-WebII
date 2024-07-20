import { dbQueries } from "../instances/dbinstances.js";

class Project {
  constructor() {}

  static async createProject(
    nameP,
    typeP,
    startDate,
    endDate,
    idPerson,
    membersDefault = []
  ) {
    try {
      const query = await dbQueries.insertProject(
        nameP,
        typeP,
        startDate,
        endDate
      );

      if (query) {
        let idProject = query.rows[0].project_id;

        console.log(idPerson);

        const projectManager = await dbQueries.insertProjectManager(
          idPerson,
          idProject
        );

        if (projectManager) {
          console.log("ProjectManager insertado exitosamente");
        } else {
          return {
            success: false,
            code: 500,
            message: "Error al registrar al creador del proyecto",
          };
        }

        if (membersDefault.length > 0) {
          for (const member of membersDefault) {
            await dbQueries.insertMember(
              member.person_id,
              member.profile_id,
              idProject
            );
          }

          console.log("Miembros adicionados con exito!");

          return {
            success: true,
            message: `Proyecto: ${nameP} creado y miembros añadidos!`,
            idProject: idProject,
          };
        } else {
          console.log("No se encontraron miembros");
        }
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
        code: 500,
        message: "Error interno del servidor",
      };
    }
  }

  static async updateProject(
    newName,
    newType,
    newState,
    newStart,
    newEnd,
    idProject
  ) {
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
        message: "Error interno del servidor.",
      };
    }
  }

  static async getProjectsByPersone(idPerson) {
    console.log(idPerson);
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
        message: "Error interno del servidor.",
      };
    }
  }

  static async deleteProject(idProject) {
    try {
      const query = await dbQueries.eliminateProject(idProject);
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
