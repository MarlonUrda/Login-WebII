import { dbQueries } from "../instances/dbinstances.js";

export const updateRole = async (req, res) => {
  try {
    console.log('updateRole');;
    const  {projectId}= req.body
    let  {idPerson}= req.session
    
    const result =await dbQueries.getProfile(projectId,idPerson)
    console.log("apunto del return", result.rows);
    return res.send({ message: result.rows })

  } catch (error) {
    console.log(error.message);
  }
};