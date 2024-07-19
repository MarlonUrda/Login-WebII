import { dbQueries } from "../instances/dbinstances.js";

class Members {
  constructor() {}

  /**
   * Agrega los miembros de un proyecto.
   * @param {Array<Array<number|string>>} membersData - Un array de arrays, donde cada sub-array contiene [idPerson, idProfile, idProject].
   * @returns {Promise<{message: string}>} Te devuelve un objeto con el mensaje 'Todos los miembros han sido insertados exitosamente'.
   */
  static async newMember(membersData) {
    try {
      const result = await dbQueries.newMembers(membersData);
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
  static async getMembers(idProject) {
    try {
      const result = dbQueries.getMembers(idProject);
      return { data: result.rows };
    } catch (error) {
      console.log("Error al obtener los miembros");
      throw new Error(error);
    }
  }

  /**
   * obtiene los miembros de un proyecto
   * @param {string} idProject
   * @param {string} idProfile
   * @param {string} idUser
   * @returns {Array} te devuelve un {message: "Eliminado correctamente"} si se agrego correctamente
   */
  static async deleteMembers(idProject, idMember) {
    try {
      const result = await dbQueries.deleteMember(idProject, idMember);
      return { message: result, success: true };
    } catch (error) {
      console.log("Error al eliminar miembro del proyecto");
      throw new Error(error);
    }
  }
}

export default Members;
