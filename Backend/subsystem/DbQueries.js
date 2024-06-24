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
  async insertUser(email, password, name) {
    try {
      const result = await this.pool.query(
        "INSERT INTO users (email, password, name) VALUES ($1, $2, $3)",
        [email, password, name]
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

  async getPermissions() {}
}

export default DbQueries;
