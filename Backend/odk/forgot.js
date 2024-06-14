

import { pool } from "../database/pool.js";
import nodemailer from "nodemailer";

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
        host: 'smtp.gmail.com',
        port: 465,
        secure: true,
        auth: {
          user: 'bettrello@gmail.com',
          pass: 'rphx noed gtne zalh'
        }
      });
      
      let mailOptions = {
        from: 'bettrello@gmail.com',
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
