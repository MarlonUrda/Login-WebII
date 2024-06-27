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

  async insertPerson(name, phone, lastname) {
    try {
      const result = await this.pool.query(
        `INSERT INTO persona (nombre_persona, telefono, apellido_persona) VALUES ($1, $2, $3) 
             RETURNING id_persona
            `,
        [name, phone, lastname]
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
        "UPDATE usuario SET password = $1, resetPasswordToken = NULL, resetPasswordExpires = NULL WHERE email = $2",
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
        `SELECT * FROM perfil pf 
            join metodo_perfil mp on pf.id_perfil = mp.id_perfil
            join metodo met on mp.id_metodo  = met.id_metodo
            join clase c on met.id_clase = c.id_clase
            join modulo m on c.id_modulo = m.id_modulo
            join modulo_perfil mop on m.id_modulo = mop.id_modulo;` //Tentativo
      );

      return result;
    } catch (error) {
      console.log("Error: ", error);
    }
  }
}

export default DbQueries;
