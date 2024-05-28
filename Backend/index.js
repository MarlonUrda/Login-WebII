import express from "express";
import session from "express-session";
import { fileURLToPath } from "url";
import { dirname } from "path";



const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const app = express();
const host = "localhost";
const port = 3000;

app.use(session({
  secret: "secret",
  resave: false,
  saveUninitialized: false,
  cookie: { maxAge: 60000 }
}));

app.use(express.json());

// Sirve los archivos estáticos de Vue desde la carpeta dist
app.use(express.static("C:/Users/ATS/Documents/Visual studio/Universidad/Login-WebII/client/dist"));

app.get("/", (req, res) => {
  console.log(__dirname);
  // Usa sendFile en lugar de sendfile, y asegúrate de que la ruta al archivo index.html es correcta
  res.sendFile("C:/Users/ATS/Documents/Visual studio/Universidad/Login-WebII/client/dist" + "/index.html");
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


