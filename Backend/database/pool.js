import pkg from "pg";
import dotenv from "dotenv";

const result = dotenv.config({ path: "./env/.env" });

if (result.error) {
  throw result.error;
} else {
  console.log(result.parsed);
}

const { Pool } = pkg;

export const pool = new Pool({
  // user: process.env.DB_USER,
  // host: process.env.DB_HOST,
  // password: process.env.DB_PASSWORD,
  // database: process.env.DB_NAME,
  // port: process.env.DB_PORT,

  user: "postgres",
  host: "localhost",
  password: "123456789",
  database: "Login",
  port: 5432,
});

export const getConnection = () => {
  pool
    .connect()
    .then(() => {
      console.log("Connected to database");
    })
    .catch((error) => {
      console.error("Error connecting to database:", error);
    });
};
