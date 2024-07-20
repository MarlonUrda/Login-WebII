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
import { toProcess } from "./controller/toProcess.js";
import "./instances/dbinstances.js";
import { updateProfile } from "./controller/updateProfile.js";

const app = express();
const host = "localhost";
const port = 3000;

app.use(cookieParser());

app.use(express.static("public"));

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

app.post("/update-profile", updateProfile);

app.post("/toProcess", toProcess);

app.use((req, res) => {
  res.status(404).send({ error: "Not found" });
});

app.listen(port, "0.0.0.0", async () => {
  console.log(`Server running at http://${host}:${port}/`);
});
