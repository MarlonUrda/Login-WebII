import { dbQueries } from "../instances/dbinstances.js";

class Task {
  constructor() {}

  static async createTask(taskName, taskDesc, idOb, deadline) {
    try {
      const query = await dbQueries.insertTask(
        taskName,
        taskDesc,
        idOb,
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

  static async getTask(idObjective) {
    try {
      const query = await dbQueries.getTasks(idObjective);

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

  static async updateTask(newName, newDesc, newDeadline, idTask) {
    try {
      const query = await dbQueries.updateTask(
        newName,
        newDesc,
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

  static async deleteTask(taskId) {
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
