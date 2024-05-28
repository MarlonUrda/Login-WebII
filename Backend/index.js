import express from "express";
import session from "express-session";
import { fileURLToPath } from "url";
import { dirname, resolve } from "path";
import morgan from "morgan";



const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
const parentDirectory = resolve(__dirname, '..');

const app = express();
const host = "localhost";
const port = 3000;

app.use(morgan(parentDirectory));

app.use(session({
  secret: "secret",
  resave: false,
  saveUninitialized: false,
  cookie: { maxAge: 60000 }
}));

app.use(express.json());

// Sirve los archivos estáticos de Vue desde la carpeta dist
app.use(express.static( parentDirectory +"/client/dist"));

app.get("/", (req, res) => {
  console.log(__dirname);
  //muestra log in
  res.sendFile(parentDirectory + "/client/dist/index.html");
});

app.get('/create-session', (req, res) => {
  req.session.user = {
    id: '004', 
    name: 'nose' 
  };
  res.send('signed in');
});

app.get('/get-session', (req, res) => {
  if (req.session.user) {
    res.send(`Session exists for user ${req.session.user.name}`);
  } else {
    res.send('No session exists');
  }
});

app.post("/toProcess", async (req, res) => {
  const obj = await import("./" + req.body.objectName + ".js");
  const instance = new obj.default();
  res.send(instance[req.body.methodName](req.body.params));
  res.status(200);
});

app.listen(port, '0.0.0.0', () => {
  console.log(`Server running at http://${host}:${port}/`);
});

app.use((req, res) => {
  res.status(404).send({ error: "Not found" });
})


