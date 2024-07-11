import { dbQueries } from "../instances/dbinstances.js";

class Project {
  constructor() {}

  async createProject(params) {
    const [nameP, typeP, state, startDate, endDate] = params;
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
        return true;
      } else {
        console.error("Error al crear el proyecto");
        return false;
      }
    } catch (error) {
      console.error("Error al conectar con la base de datos: ", error);
      return false;
    }
  }

  async updateProject(params) {
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

  async deleteProject(params) {
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
