import pkg from "pg";
import dotenv from "dotenv";

dotenv.config({ path: "./env/.env" });

const { Pool } = pkg;

class Database {
  constructor() {
    this.pool = new Pool({
      user: process.env.DB_USER,
      host: process.env.DB_HOST,
      password: process.env.DB_PASSWORD,
      database: process.env.DB_NAME,
      port: process.env.DB_PORT,
    });
  }

  connect() {
    this.pool
      .connect()
      .then(() => console.log("Connected to database"))
      .catch((error) => console.error("Error connecting to database:", error));
  }
}

export default Database;