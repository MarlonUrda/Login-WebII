import { dbQueries } from "../instances/dbinstances.js";

class Task {
  constructor() {}

  static async createTask(params) {
    const [taskName, taskDesc, idOb, startDate, deadline] = params;

    try {
      const query = await dbQueries.insertTask(
        taskName,
        taskDesc,
        idOb,
        startDate,
        deadline
      );

      if (query) {
        console.log("Actividad creada con exito");
        let taskId = query.rows[0].task_id;
        return {
          success: true,
          message: `Actividad: ${taskName} creada exitosamente!`,
          taskId: taskId,
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
    const [newName, newDesc, newStart, newDeadline, idTask] = params;

    try {
      const query = await dbQueries.updateTask(
        newName,
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
    const [taskId] = params;
    try {
      const query = await dbQueries.deleteTask(taskId);

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
}

export default Task;
