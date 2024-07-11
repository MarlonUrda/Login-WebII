import express from "express";
import session from "express-session";
import morgan from "morgan";
import cors from "cors";
import cookieParser from "cookie-parser";
import { login, logout } from "./controller/login.js";
import { register } from "./controller/register.js";
import { forgotPass } from "./controller/forgot.js";
import { userData } from "./controller/home.js";
import ResetControler from "./controller/ResetControler.js";
import Security from "./subsystem/security.js";
import "./instances/dbinstances.js";

const app = express();
const host = "localhost";
const port = 3000;

const s = new Security();

app.use(cookieParser());

app.use(
  cors({
    origin: "http://localhost:5173",
    credentials: true,
  })
);
app.use(morgan("dev"));

app.use(
  session({
    secret: "secret",
    resave: false,
    saveUninitialized: false,
    cookie: {
      maxAge: 5 * 24 * 60 * 60 * 1000,
      sameSite: "Lax",
    },
  })
);

app.use(express.json());

app.get("/user-data", userData); //home

app.get("/logout", logout);

app.post("/forgot-password", forgotPass);

app.post("/login", login);

app.post("/register", register);

app.get("/reset/:token", ResetControler.resetPasswordGet);

app.post("/reset/:token", ResetControler.resetPasswordPost);

app.post("/toProcess", async (req, res) => {
  const validate = await s.validPermissions(req);
  if (validate) {
    const obj = await import("./BO/" + req.body.clase + ".js");
    const instance = new obj.default();
    instance[req.body.metodo](req.body.params);
    res.status(200).send({ message: "Metodo Ejecutado con exito!" });
  } else {
    res
      .status(401)
      .send({ error: "No tiene autorizacion para ejecutar el metodo!" });
  }
});

app.use((req, res) => {
  res.status(404).send({ error: "Not found" });
});

app.listen(port, "0.0.0.0", async () => {
  console.log(`Server running at http://${host}:${port}/`);
});
