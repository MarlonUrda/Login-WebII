import express from "express";
import session from "express-session";
import { fileURLToPath } from "url";
import { dirname, resolve } from "path";
import morgan from "morgan";
import { getConnection, pool } from "./database/pool.js";
import { login } from "./odk/login.js";
import { regApi } from "./odk/register.js";
import cors from "cors";
import { emailapi } from "./odk/forgot.js"; 
import { userData } from "./odk/home.js";
import { encrypt } from "./odk/encrypt.js";

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
const parentDirectory = resolve(__dirname, "..");

const app = express();
const host = "localhost";
const port = 3000;

app.use(cors({
  origin: 'http://localhost:5173', 
  credentials: true
}));
app.use(morgan("dev"));
getConnection();

app.use(
  session({
    secret: "secret",
    resave: false,
    saveUninitialized: false,
    cookie: { 
      maxAge: 600000, 
      sameSite: false,
    },
  })
);

app.use(express.json());


app.use(express.static(parentDirectory + "/client/dist"));



app.get("/user-data", (req, res) => {
  console.log("userData");
  userData(req, res);

});


app.post("/emailProccess", (req, res) => {
  console.log("req.body.email");
  emailapi(req, res);
});

app.post("/get-session", (req, res) => {
  login(req, res);
});

app.post("/toProcess", async (req, res) => {
  const obj = await import("./" + req.body.objectName + ".js");
  const instance = new obj.default();
  res.send(instance[req.body.methodName](req.body.params));
  res.status(200);
});

app.post("/register",  (req, res) => {
  regApi(req, res);
});

app.get('/reset/:token', async (req, res) => {
  const { token } = req.params;
  console.log(token);

  try {
    const result = await pool.query('SELECT * FROM users WHERE resetPasswordToken = $1 AND resetPasswordExpires > $2', [token, Date.now()]);
    if (!(result.rows.length > 0)) {
      return res.status(400).json({ message: 'El token de restablecimiento de contraseña es inválido o ha expirado.' });
    }
    // Obtén el token del resultado
    const user = result.rows[0];
    const tokenFromDatabase = user.resetpasswordtoken; 


    console.log(tokenFromDatabase);
  }catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Error al procesar la solicitud.' });
  }
});

app.post('/reset/:token', async (req, res) => {
  const { token } = req.params;
  const { password } = req.body;
  console.log(token);
  console.log(password  );

  try {
    const result = await pool.query('SELECT * FROM users WHERE resetPasswordToken = $1 AND resetPasswordExpires > $2', [token, Date.now()]);
    if (!(result.rows.length > 0)) {
      return res.status(400).json({ message: 'El token de restablecimiento de contraseña es inválido o ha expirado.' });
    }

    const user = result.rows;

    const hashedPassword = await encrypt(password, 10);
    await pool.query('UPDATE users SET password = $1, resetPasswordToken = NULL, resetPasswordExpires = NULL WHERE email = $2', [hashedPassword, user[0].email]);

    res.json({ message: 'Contraseña restablecida con éxito.' });
  } catch (error) {
  console.error(error);
  res.status(500).json({ message: 'Error al restablecer la contraseña.' });
}
});

app.use((req, res) => {
  res.status(404).send({ error: "Not found" });
});

app.listen(port, "0.0.0.0", () => {
  console.log(`Server running at http://${host}:${port}/`);
});





