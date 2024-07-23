class DbQueries {
  /**
   * @param {import('pg').Pool} pool
   */
  constructor(pool) {
    this.pool = pool;
  }

  /**
   *   Obtener un usuario por su email
   * @param {string} email
   * @returns {Promise<import('pg').QueryResult>}
   */
  async getUsersByEmail(email) {
    const result = await this.pool.query(
      "SELECT * FROM users WHERE email = $1",
      [email]
    );
    return result;
  }

  /**
   *  Obtener un usuario por su contraseña
   * @param {string} password
   * @returns {Promise<import('pg').QueryResult>}
   */
  async getUsersByPassword(password) {
    const result = await this.pool.query(
      "SELECT * FROM users WHERE password = $1",
      [password]
    );
    return result;
  }

  /**
   * Insertar un usuario en la base de datos
   * @param {string} email
   * @param {string} password
   * @param {string} name
   * @returns {Promise<boolean}
   */
  async insertUser(email, password, username, person_id) {
    try {
      const result = await this.pool.query(
        "INSERT INTO users (password, username, person_id, email) VALUES ($1, $2, $3, $4) RETURNING users_id",
        [password, username, person_id, email]
      );
      if (1 != result.rowCount) {
        console.log("Error insertando usuario");
        return false;
      }
      return true;
    } catch (error) {
      console.error("Error :", error);
    }
  }

  async insertPerson(name, lastname, ident) {
    try {
      const result = await this.pool.query(
        `INSERT INTO person (name, lastname, ident) VALUES ($1, $2, $3) 
             RETURNING person_id
            `,
        [name, lastname, ident]
      );

      if (1 != result.rowCount) {
        console.log("Error insertando persona");
        return false;
      }

      return true, result;
    } catch (error) {
      console.error(error);
    }
  }

  async getPerson(personId) {
    try {
      const result = await this.pool.query(
        "SELECT * FROM person WHERE person_id = $1",
        [personId]
      );
      return result;
    } catch (error) {
      console.error(error);
    }
  }

  async getUsers() {
    try {
      const result = this.pool.query(
        `SELECT p.person_id AS pId , p.name || ' ' || p.lastname AS user, p.ident, us.username  FROM person AS p
          INNER JOIN users AS us ON p.person_id = us.person_id`
      );
      return result;
    } catch (error) {
      console.error("Error: ", error.message);
    }
  }

  async getRoles() {
    try {
      const result = this.pool.query(
        "SELECT profile_id, profile_desc FROM profile WHERE profile_type_id = 6 AND profile_id != 13 AND profile_id != 7"
      );
      return result;
    } catch (error) {
      log.error("Error: ", error.message);
    }
  }

  /**
   * Actualizar el token de restablecimiento de contraseña
   * @param {string} email
   * @param {string} token
   * @param {string} expires
   * @returns {Promise<boolean>}
   */
  async updateResetPasswordToken(email, token, expires) {
    try {
      const result = await this.pool.query(
        "UPDATE users SET resetPasswordToken = $1, resetPasswordExpires = $2 WHERE email = $3",
        [token, expires, email]
      );
      if (1 != result.rowCount) {
        console.log(
          "Error al actualizar el token de restablecimiento de contraseña"
        );
        return false;
      }
      return true;
    } catch (error) {
      console.error("Error:", error);
    }
  }

  /**
   * Actualizar el token de restablecimiento de contraseña
   * @param {string} token
   * @returns {Promise<import('pg').QueryResult>}
   */
  async getUserwithValidToken(token) {
    try {
      const result = await this.pool.query(
        "SELECT * FROM users WHERE resetPasswordToken = $1 AND resetPasswordExpires > $2",
        [token, Date.now()]
      );
      return result;
    } catch (error) {
      console.error(
        "Error al Buscar en la base de datos el token de restablecimiento de contraseña:",
        error
      );
      return false; // Asegurarse de retornar false en caso de error.
    }
  }

  /**
   * Actualizar el token de restablecimiento de contraseña
   * @param {string} email
   * @param {string} Hashedpassword Hashed password
   * @returns {Promise<import('pg').QueryResult>}
   */
  async UpdatePassword(email, Hashedpassword) {
    try {
      const result = await this.pool.query(
        "UPDATE users SET password = $1, resetPasswordToken = NULL, resetPasswordExpires = NULL WHERE email = $2",
        [Hashedpassword, email]
      );
      if (1 != result.rowCount) {
        console.log("Error al actualizar contraseña");
        return false;
      }
      return true;
    } catch (error) {
      console.error("Error:", error);
    }
  }

  async getProfile(projectId, idPerson) {
    try {
      console.log("projectId", projectId);
      console.log("idPerson", idPerson);

      const result = await this.pool.query(
        `SELECT pro.profile_desc, pr.project_name FROM member m
         JOIN projects pr ON m.project_id = pr.project_id
         JOIN person p ON p.person_id = m.person_id
         JOIN profile pro ON pro.profile_id = m.profile_id
         WHERE pr.project_id=$1 AND m.person_id=$2`,
        [projectId, idPerson]
      );

      return result;
    } catch (error) {
      console.error("Error:", error);
      return false;
    }
  }

  async getPermissions() {
    try {
      const result = await this.pool.query(
        `SELECT DISTINCT profile_desc AS perfil, method_name AS metodo, classname AS clase, module_desc AS modulo 
          FROM profile pf 
          INNER JOIN profile_methods pm ON pf.profile_id = pm.profile_id
          INNER JOIN methods met ON pm.method_id = met.method_id
          INNER JOIN classes c ON met.class_id = c.class_id
          INNER JOIN modules m ON c.module_id = m.module_id
          INNER JOIN module_profile mop ON m.module_id = mop.module_id;` //Arreglado
      );

      return result;
    } catch (error) {
      console.log("Error: ", error);
    }
  }

  async insertProject(nameP, typeP, start, end) {
    try {
      const result = await this.pool.query(
        "INSERT INTO projects (project_name, type, state_id, start_date, end_date) VALUES ($1, $2, 1, $3, $4) RETURNING project_id",
        [nameP, typeP, start, end]
      );
      return result;
    } catch (error) {
      console.log("Error: ", error);
    }
  }

  async getProjects(personId) {
    try {
      const result = await this.pool.query(
        `SELECT 
          pj.project_id, 
          pj.project_name,
          pr.profile_desc,
          pj.type,
          pj.start_date,
          pj.end_date, 
            (SELECT ps2.name ||' '|| ps2.lastname
              FROM "public".member m2
              INNER JOIN "public".person ps2 ON m2.person_id = ps2.person_id
              WHERE m2.project_id = pj.project_id AND m2.profile_id = 7
              LIMIT 1) AS creator
          FROM "public".projects pj
          INNER JOIN "public".member m ON pj.project_id = m.project_id
          INNER JOIN "public".profile pr ON m.profile_id = pr.profile_id
          WHERE m.person_id = $1`,
        [personId]
      );

      return result;
    } catch (error) {
      console.log("Error: ", error);
    }
  }

  async updateProject(newName, newType, newStart, newEnd, idProject) {
    try {
      const result = await this.pool.query(
        `UPDATE projects SET project_name = $1,
        type = $2,
        start_date = $3,
        end_date = $4 WHERE project_id = $5`,
        [newName, newType, newStart, newEnd, idProject]
      );
      return result;
    } catch (error) {
      console.log(error);
    }
  }

  async eliminateProject(idProject) {
    try {
      const result = await this.pool.query(
        "DELETE FROM projects WHERE project_id = $1 RETURNING project_name",
        [idProject]
      );
      return result;
    } catch (error) {
      console.log(error);
    }
  }

  async deleteProjectFromMembers(idProject) {
    try {
      const result = await this.pool.query(
        "DELETE FROM member WHERE project_id = $1",
        [idProject]
      );
      return result;
    } catch (error) {
      console.log("Error: ", error.message);
    }
  }

  async leaveProject(idPerson, idProject) {
    try {
      const result = await this.pool.query(
        "DELETE FROM member WHERE person_id = $1 AND project_id = $2",
        [idPerson, idProject]
      );
      return result;
    } catch (error) {
      console.log("Error: ", error.message);
    }
  }

  async insertObjective(nameO, objdesc, idProject, dateLimit) {
    try {

      const result = this.pool.query(
        "INSERT INTO objective (objective_name, objective_desc, project_id, deadline) VALUES ($1, $2, $3, $4) RETURNING objective_id",
        [nameO, objdesc, idProject, dateLimit]
      );

      return result;
    } catch (error) {
      console.log("Error: ", error);
    }
  }

  async getObjectivesFromProject(idProject) {
    try {
      const result = this.pool.query(
        "SELECT * FROM objective WHERE project_id = $1",
        [idProject]
      );

      return result;
    } catch (error) {
      console.log("Error: ", error);
    }
  }

  async updateObjective(newName, newDesc, newDateLimit, idOb) {
    try {
      const result = this.pool.query(
        "UPDATE objective SET objective_name = $1, objective_desc = $2, deadline = $3 WHERE objective_id = $4",
        [newName, newDesc, newDateLimit, idOb]
      );
      return result;
    } catch (error) {
      console.log("Error: ", error);
    }
  }

  async deleteObjective(idOb) {
    try {
      const result = this.pool.query(
        "DELETE FROM objective WHERE objective_id = $1 RETURNING objective_name",
        [idOb]
      );

      return result;
    } catch (error) {
      console.log("Error: ", error);
    }
  }

  async insertTask(taskName, taskDesc, idOb, deadline) {
    try {
      const result = this.pool.query(
        "INSERT INTO tasks (task_name, task_desc, obj_id, deadline) VALUES ($1, $2, $3, $4) RETURNING task_id",
        [taskName, taskDesc, idOb, deadline]
      );

      return result;
    } catch (error) {
      console.log("Error: ", error);
    }
  }

  async getTasks(idObj) {
    try {
      const result = this.pool.query("SELECT * FROM tasks WHERE obj_id = $1", [
        idObj,
      ]);

      return result;
    } catch (error) {
      console.log("Error: ", error);
    }
  }

  async deleteTask(idTask) {
    try {
      const result = this.pool.query("DELETE FROM tasks WHERE task_id = $1", [
        idTask,
      ]);

      return result;
    } catch (error) {
      console.log("Error: ");
    }
  }

  async updateTask(newName, newDesc, newDeadline, idTask) {
    try {
      const result = await this.pool.query(
        `UPDATE tasks SET task_name = $1 ,
              task_desc = $2,
              deadline = $3,
              WHERE task_id = $4`,
        [newName, newDesc, newDeadline, idTask]
      );
      return result;
    } catch (error) {
      console.log("Error: ", error);
    }
  }

  async insertProjectManager(idPerson, idProject) {
    try {
      const result = await this.pool.query(
        "INSERT INTO member (person_id, profile_id, project_id) VALUES ($1, 7, $2)",
        [idPerson, idProject]
      );
      return result;
    } catch (error) {
      console.log("Error: ", error);
    }
  }

  async insertMember(idPerson, idProfile, idProject) {
    try {
      const result = await this.pool.query(
        "INSERT INTO member (person_id, profile_id, project_id) VALUES ($1, $2, $3) RETURNING member_id",
        [idPerson, idProfile, idProject]
      );
      return result;
    } catch (error) {
      throw new Error("Error al obtener miembros");
    }
  }

  /**
   * Devuelve los miembros de un proyecto
   * @param {string} idProject
   * @param {string} idProfile
   * @param {string} idUser
   * @returns {string} te devueve un 'Todos los miembros han sido insertados exitosamente'
   */
  async newMembers(membersData) {
    try {
      await this.pool.query("BEGIN");
      for (let i = 0; i < membersData.length; i++) {
        const [idPerson, idProfile, idProject] = membersData[i];
        await this.pool.query(
          "INSERT INTO member (person_id, profile_id, project_id) VALUES ($1, $2, $3)",
          [idPerson, idProfile, idProject]
        );
      }
      await this.pool.query("COMMIT");
      console.log("Todos los miembros han sido insertados exitosamente");
      const message = "Todos los miembros han sido insertados exitosamente";
      return message;
    } catch (error) {
      await this.pool.query("ROLLBACK");
      throw new Error("Error al agregar miembro");
    }
  }

  /**
   * Devuelve los miembros de un proyecto
   * @param {string} idProject
   * @returns {Array} te devueve un array con los miembros del proyecto [{"Member": "","lastname":"" ,"email":""}]
   */
  async getMembers(idProject) {
    try {
      const result = await this.pool.query(
        `
            SELECT name member, lastname,email 
            FROM projects p
            JOIN member m ON m.project_id = p.project_id
            JOIN person per ON per.person_id = m.person_id
            JOIN users u ON u.person_id = per.person_id
            WHERE p.project_id = $1 
          `,
        [idProject]
      );
      return result;
    } catch (error) {
      throw new Error("Error al obtener miembros");
    }
  }

  /**
   * Devuelve los miembros de un proyecto
   * @param {string} idProject
   * @param {string} idMember
   * @returns {Array} te devueve un "Eliminado miembro correctamente"
   */
  async deleteMember(idProject, idMember) {
    try {
      const result = await this.pool.query(
        "DELETE FROM member  WHERE project_id = $1 AND person_id = $2",
        [idProject, idMember]
      );
      return "Eliminado miembro correctamente";
    } catch (error) {
      throw new Error("Error al eliminar miembro");
    }
  }
}

export default DbQueries;
