import express from "express";
import session from "express-session";
import morgan from "morgan";
import cors from "cors";
import { login } from "./controller/login.js";
import { register } from "./controller/register.js";
import { forgotPass } from "./controller/forgot.js";
import { userData } from "./controller/home.js";
import ResetControler  from "./controller/ResetControler.js";
import "./instances/dbinstances.js";


const app = express();
const host = "localhost";
const port = 3000;

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
      maxAge: 600000,
      sameSite: false,
    },
  })
);

app.use(express.json());


app.get("/user-data",userData)//home

app.post("/forgot-password", forgotPass);

app.post("/login", login);

app.post("/register", register);

app.get("/reset/:token", ResetControler.resetPasswordGet);

app.post("/reset/:token", ResetControler.resetPasswordPost);

app.post("/toProcess", async (req, res) => {
  const obj = await import("./" + req.body.objectName + ".js");
  const instance = new obj.default();
  instance[req.body.methodName](req.body.params);
  res.send({ message: "Metodo Ejecutado con exito!" });
  res.status(200);
});

app.use((req, res) => {
  res.status(404).send({ error: "Not found" });
});

app.listen(port, "0.0.0.0", () => {
  console.log(`Server running at http://${host}:${port}/`);
});
