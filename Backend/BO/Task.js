import { dbQueries } from "../instances/dbinstances";

class Task {
  constructor() {}

  static async createTask(params) {
    const [descAct, idOb] = params;

    try {
      const query = await dbQueries.insertTask(descAct, idOb);

      if (query) {
        console.log("Actividad creada con exito");
        let idAct = query.rows[0].id_actividad;
        return {
          success: true,
          message: "Actividad creada exitosamente!",
          idAct: idAct,
        };
      } else {
        return {
          success: false,
          code: 400,
          message: "No se pudo crear la actividad",
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

  static async getTask(params) {
    const [idOb] = params;

    try {
      const query = await dbQueries.getTasks(idOb);

      if (query) {
        let activities = [];
        query.rows.forEach((row) => {
          activities.push(row);
        });
        return {
          success: true,
          activities: activities,
        };
      } else {
        return {
          success: false,
          code: 404,
          message: "No se encontraron actividades",
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

  static async updateTask(params) {
    const [newDesc, newStart, newDeadline, idTask] = params;

    try {
      const query = await dbQueries.updateTask(
        newDesc,
        newStart,
        newDeadline,
        idTask
      );
      if (query) {
        console.log("Actividad actualizada con éxito");
        return {
          success: true,
          message: "Actividad actualizada exitosamente!",
        };
      } else {
        return {
          success: false,
          code: 400,
          message: "No se pudo actualizar la actividad",
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

  static async deleteTask(params) {
    const [idObj] = params;
    try {
      const query = await dbQueries.deleteTask(idObj);

      if (query) {
        console.log("Actividad eliminada con exito");
        return {
          success: true,
          message: "Actividad eliminada exitosamente!",
        };
      } else {
        return {
          success: false,
          message: "No se pudo eliminar la actividad",
        };
      }
    } catch (error) {
      return {
        success: false,
        error: error,
      };
    }
  }

  static async deleteTask(params) {
    const [idTask] = params;

    try {
      const query = await dbQueries.deleteTask(idTask);

      if (query) {
        console.log("Tarea eliminada con éxito");
        return {
          success: true,
          message: "Tarea eliminada exitosamente!",
        };
      } else {
        return {
          success: false,
          message: "No se pudo eliminar la tarea",
        };
      }
    } catch (error) {
      return {
        success: false,
        error: error,
      };
    }
  }
}

export default Task;
