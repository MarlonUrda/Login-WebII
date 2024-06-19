

import { pool } from "../database/pool.js";
import nodemailer from "nodemailer";
import dotenv from "dotenv";
import crypto from 'crypto';

const result = dotenv.config({ path: "./env/.env" });

export const emailapi = async (req, res) => {
  const {email } = req.body;

  try {
    const em = await pool.query("SELECT * FROM users WHERE email = $1", [
      email,
    ]);

    if(!(em.rows.length > 0)){
      return res.status(404).json({ message: `El email no existe Bobo2 ${email}` });
    }

    const token = crypto.randomBytes(20).toString('hex');
    const expires = Date.now() + 3600000; // 1 hour

    await pool.query('UPDATE users SET resetPasswordToken = $1, resetPasswordExpires = $2 WHERE email = $3', [token, expires, email]);

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
      text: `Bobo,entra al link para cambiar tu contraseña:\n\n
             http://${req.headers.host}/reset/${token}\n\n
             Si tú no solicitaste esto, por favor ignora este correo y tu contraseña permanecerá sin cambios.\n`,
    };
    
    transporter.sendMail(mailOptions, function(error, info){
      if (error) {
        return console.log(error);
      } 
      
      res.status(201).json({ message: `El email si existe Bobo2 ${email}` });
      
    });



  } catch (error) {
    console.log(error);
    res.status(500).json({ error: error.message });
  }
};
