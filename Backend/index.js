import express from "express";
import session from "express-session";
import { fileURLToPath } from "url";
import { dirname, resolve } from "path";
import morgan from "morgan";
import { getConnection } from "./database/pool.js";
import { login } from "./odk/login.js";
import { regApi } from "./odk/register.js";
import cors from "cors";

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
const parentDirectory = resolve(__dirname, "..");

const app = express();
const host = "localhost";
const port = 3000;

app.use(cors());
app.use(morgan(parentDirectory));
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

app.get("/", (req, res) => {
  console.log(__dirname);
  //muestra log in
  res.sendFile(parentDirectory + "/client/dist/index.html");
});

app.get("/create-session", (req, res) => {
  req.session.user = {
    id: "004",
    name: "nose",
  };
  res.send("signed in");
});

app.get("/get-session", cors(), (req, res) => {
  if (req.session.user) {
    res.send(`Session exists for user ${req.session.user.name}`);
  } else {
    res.send("No session exists");
  }
});

app.post("/get-session", cors(), (req, res) => {
  login(req, res);
});

app.post("/toProcess", async (req, res) => {
  const obj = await import("./" + req.body.objectName + ".js");
  const instance = new obj.default();
  res.send(instance[req.body.methodName](req.body.params));
  res.status(200);
});

app.post("/Register", cors(), async (req, res) => {
  regApi(req, res);
});

app.listen(port, "0.0.0.0", () => {
  console.log(`Server running at http://${host}:${port}/`);
});

app.use((req, res) => {
  res.status(404).send({ error: "Not found" });
});
