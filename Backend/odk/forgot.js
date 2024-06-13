import { pool } from "../database/pool.js";
import nodemailer from "nodemailer";

export const regApi = async (req, res) => {
  const {email } = req.body;



  const values = [email];
  try {
    const em = await pool.query("SELECT * FROM users WHERE email = $1", [
      email,
    ]);

    if (em.rows.length > 0) {
      //El email ya existe
      let transporter = nodemailer.createTransport({
        service: 'gmail',
        auth: {
          user: 'nose',
          pass: 'ni idea'
        }
      });
      
      let mailOptions = {
        from: 'nose ',
        to: email,
        subject: 'Se te olvido tu contraseña?', 
        text: 'Bobo'
      };
      
      transporter.sendMail(mailOptions, function(error, info){
        if (error) {
          console.log(error);
        } else {
          console.log('Email sent: ' + info.response);
        }
      });

    }else{
      return res.status(400).json({ message: "El email no existe" });
    }



  } catch (error) {
    console.log(error);
    res.status(500).json({ error: error.message });
  }
};
