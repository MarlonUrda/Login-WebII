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
      "SELECT * FROM usuario WHERE email = $1",
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
      "SELECT * FROM usuario WHERE pass_usuario = $1",
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
  async insertUser(email, password, name, id_persona) {
    try {
      const result = await this.pool.query(
        "INSERT INTO usuario (pass_usuario, nombre_usuario, id_persona, email) VALUES ($1, $2, $3, $4)",
        [password, name, id_persona, email]
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
        `INSERT INTO persona (nombre_persona, apellido_persona, ident) VALUES ($1, $2, $3) 
             RETURNING id_persona
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
        "UPDATE usuario SET resetPasswordToken = $1, resetPasswordExpires = $2 WHERE email = $3",
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
        "SELECT * FROM usuario WHERE resetPasswordToken = $1 AND resetPasswordExpires > $2",
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
        "UPDATE usuario SET pass_usuario = $1, resetPasswordToken = NULL, resetPasswordExpires = NULL WHERE email = $2",
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

  async getPermissions() {
    try {
      const result = await this.pool.query(
        `SELECT DISTINCT desc_perfil AS perfil, nombre_metodo AS metodo, nombre_clase AS clase, desc_modulo AS modulo 
          FROM perfil pf 
          INNER JOIN metodo_perfil mp ON pf.id_perfil = mp.id_perfil
          INNER JOIN metodo met ON mp.id_metodo = met.id_metodo
          INNER JOIN clase c ON met.id_clase = c.id_clase
          INNER JOIN modulo m ON c.id_modulo = m.id_modulo
          INNER JOIN modulo_perfil mop ON m.id_modulo = mop.id_modulo;` //Arreglado
      );

      return result;
    } catch (error) {
      console.log("Error: ", error);
    }
  }

  async insertProject(nameP, typeP, state, start, end) {
    try {
      const result = await this.pool.query(
        "INSERT INTO proyecto (nombre_proyecto, tipo_proyecto, id_estado, fecha_inicio, fecha_final) VALUES ($1, $2, $3, $4, $5)",
        [nameP, typeP, state, start, end]
      );
      return result;
    } catch (error) {
      console.log("Error: ", error);
    }
  }

  async updateProjectName(newName, idProject) {
    try {
      const result = await this.pool.query(
        "UPDATE proyecto SET nombre_proyecto = $1 WHERE id_proyecto = $2",
        [newName, idProject]
      );
      return result;
    } catch (error) {
      console.log(error);
    }
  }

  async updateTypeProject(newType, idProject) {
    try {
      const result = await this.pool.query(
        "UPDATE proyecto SET tipo_proyecto = $1 WHERE id_proyecto = $2",
        [newType, idProject]
      );
      return result;
    } catch (error) {
      console.log(error);
    }
  }

  async updateStateProject(newState, idProject) {
    try {
      const result = await this.pool.query(
        "UPDATE proyecto SET id_estado = $1 WHERE id_proyecto = $2",
        [newState, idProject]
      );
      return result;
    } catch (error) {
      console.log(error);
    }
  }

  async updateStartDateProject(newDate, idProject) {
    try {
      const result = await this.pool.query(
        "UPDATE proyecto SET fecha_inicio = $1 WHERE id_proyecto = $2",
        [newDate, idProject]
      );
      return result;
    } catch (error) {
      console.log(error);
    }
  }

  async updateEndDateProject(newDate, idProject) {
    try {
      const result = await this.pool.query(
        "UPDATE proyecto SET fecha_final = $1 WHERE id_proyecto = $2",
        [newDate, idProject]
      );
      return result;
    } catch (error) {
      console.log(error);
    }
  }

  async eliminateProject(idProject) {
    try {
      const result = await this.pool.query(
        "DELETE FROM proyecto WHERE id_proyecto = $1",
        [idProject]
      );
      return result;
    } catch (error) {
      console.log(error);
    }
  }
}

export default DbQueries;
