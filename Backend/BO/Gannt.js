import { dbQueries } from "../instances/dbinstances.js";

class Gannt {
  constructor() {}

  /**
   * Agrega los miembros de un proyecto.
   * @param {Array<Array<number|string>>} membersData - Un array de arrays, donde cada sub-array contiene [idPerson, idProfile, idProject].
   * @returns {Promise<{message: string}>} Te devuelve un objeto con el mensaje 'Todos los miembros han sido insertados exitosamente'.
   */
  static async ganntData(idProject) {
    try {
        console.log("llego a la funcion", idProject);
        const result = await dbQueries.ganntData(idProject);
        console.log("apunto del return", result.rows);
        return { message: result.rows };
    } catch (error) {
        console.log("Error agregar miembros");
        throw new Error(error);
    }
  }
}

export default Gannt;
