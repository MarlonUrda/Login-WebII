

import { pool } from "../database/pool.js";
import nodemailer from "nodemailer";
import dotenv from "dotenv";

const result = dotenv.config({ path: "./env/.env" });

export const emailapi = async (req, res) => {
  const {email } = req.body;

  try {
    const em = await pool.query("SELECT * FROM users WHERE email = $1", [
      email,
    ]);

    if (em.rows.length > 0) {
      console
      //El email ya existe
      let transporter = nodemailer.createTransport({
        host: process.env.SMTP_HOST,
        port: process.env.SMTP_PORT,
        secure: true,
        auth: {
          user: process.env.SMTP_USER,
          pass: process.env.SMTP_PASS,
        }
      });
      
      let mailOptions = {
        from: process.env.SMTP_USER,
        to: email,
        subject: 'Se te olvido tu contraseña?', 
        text: 'Bobo,entra al link para cambiar tu contraseña:'
      };
      
      transporter.sendMail(mailOptions, function(error, info){
        if (error) {
          console.log(error);
        } else {
           res.status(201).json({ message: `El email si existe Bobo2 ${email}` });
        }
      });

    }else{
      return res.status(400).json({ message: `El email no existe Bobo2 ${email}` });
    }



  } catch (error) {
    console.log(error);
    res.status(500).json({ error: error.message });
  }
};
