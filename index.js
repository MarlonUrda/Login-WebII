const express = require("express");
const host = "localhost";
const port = 3000;

const app = express();

app.use(express.json());

app.get("/", (res, req) => {
  res.header("Content-Type", "application/json");
  res.send(JSON.stringify({ message: "Hello World" }));
});

app.post("/toProcess", async (req, res) => {
  const obj = await import("./" + req.body.objectName + ".mjs");
  const instance = new obj.default();
  res.send(instance[req.body.methodName](req.body.params));
  res.status(200);
});

app.listen(port, host, () => {
  console.log(`Server running at http://${host}:${port}/`);
});
