import nodemailer from "nodemailer";

import dotenv from "dotenv";

dotenv.config({ path: "./env/.env" });

// Send email to user
/** 
* @param {string} destinationEmail Email to which the email is sent
* @param {string} subject Subject of the email
* @param {string} text Text of the email
*/
export function sendMail( destinationEmail, subject, text) {

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
        to: destinationEmail,
        subject: subject, 
        text: text
    };
  
    transporter.sendMail(mailOptions, function(error, info){
        if (error) {
        return console.error("Error al enviar el E-mail.");
        }  
        res.status(201).json({ message: `E-mail  enviado.` });
    });
}