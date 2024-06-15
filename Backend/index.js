import express from "express";
import session from "express-session";
import { fileURLToPath } from "url";
import { dirname, resolve } from "path";
import morgan from "morgan";
import { getConnection } from "./database/pool.js";
import { login } from "./odk/login.js";
import { regApi } from "./odk/register.js";
import cors from "cors";
import { emailapi } from "./odk/forgot.js"; 
import { userData } from "./odk/home.js";

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
    cookie: { maxAge: 60000 },
  })
);

app.use(express.json());

// Sirve los archivos estáticos de Vue desde la carpeta dist
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

app.listen(port, "0.0.0.0", () => {
  console.log(`Server running at http://${host}:${port}/`);
});

app.use((req, res) => {
  res.status(404).send({ error: "Not found" });
});
