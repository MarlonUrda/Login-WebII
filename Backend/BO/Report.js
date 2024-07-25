import { dbQueries } from "../instances/dbinstances.js";

class Report {
  constructor() {}

  /**
   * Agrega los miembros de un proyecto.
   * @param {Array<Array<number|string>>} membersData - Un array de arrays, donde cada sub-array contiene [idPerson, idProfile, idProject].
   * @returns {Promise<{message: string}>} Te devuelve un objeto con el mensaje 'Todos los miembros han sido insertados exitosamente'.
   */
  static async newReport(nombre,actividad,progreso,comentario,fecha,idProject) {
    try {
    console.log("llego a la funcion", nombre,actividad,progreso,comentario,fecha,idProject);
      const result = await dbQueries.newReport(nombre,actividad,progreso,comentario,fecha,idProject);
      console.log("apunto del return", result);
      return { message: result };
    } catch (error) {
      console.log("Error agregar miembros");
      throw new Error(error);
    }
  }

  /**
   * obtiene los miembros de un proyecto
   * @param {string} idProject
   * @param {string} idProfile
   * @param {string} idUser
   * @returns {Array} te devuelve la informacion en esta forma {data:[{Member},{lastname},{email}]} si se agrego correctamente
   */
  static async getReport(idProject) {
    console.log("Obteniendo miembros del proyecto", idProject);
    try {
      const result = await dbQueries.getReports(idProject);
      console.log("apunto del return", result);
      return { data: result.rows };
    } catch (error) {
      console.log("Error al obtener los miembros");
      throw new Error(error);
    }
  }
}

export default Report;
