import { dbQueries } from "../instances/dbinstances";

class Members {
  constructor() {}

  static async newMember(idProject, idProfile, idPerson) {
    try {
        const result = await dbQueries.getMembers(idProject, idProfile, idPerson);
        return  {message: result};
    } catch (error) {
        console.log('Error agregar miembro');
        throw new Error(error);
    }
  }

  static async getMembers(idProject) {
    try {
        const result = await dbQueries.getMembers(idProject);
        return  {data: result.rows};
    } catch (error) {
        console.log('Error al obtener los miembros');
        throw new Error(error);
    }
  }

  static async deleteMembers(idProject,idMember) {
    try {
        const result = await dbQueries.deleteMember(idProject, idMember);
        return  {message: result};
    } catch (error) {
        console.log('Error al eliminar miembro del proyecto');
        throw new Error(error);
    }
  }
}

export default Members;
