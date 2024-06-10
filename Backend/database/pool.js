import pkg from "pg";

const { Pool } = pkg;

export const pool = new Pool({
  user: "postgres",
  host: "localhost",
  password: "postgres",
  database: "Login",
  port: 5432,
});

export const getConnection = () => {
  pool.connect((error) => {
    if (error) {
      console.log("error: " + error);
    } else {
      console.log("Connected to database");
    }
  });
};
