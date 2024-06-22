

import { sendMail } from "../subsystem/mailer.js";
import {dbQueries} from "../instances/dbinstances.js"
import crypto from 'crypto';




export const forgotPass = async (req, res) => {
  const { email } = req.body;

  try {

    const user = await dbQueries.getUsersByEmail(email);

    if(!(user.rows.length > 0)){
      return res.status(404).json({ message: `El email no existe: ${email}` });
    }

    const token = crypto.randomBytes(20).toString('hex');
    const expires = Date.now() + 3600000; // 1 hour


    const subject = 'Password Reset';
    const text = `entra al link para cambiar tu contraseña:\n\n 
            http://${req.headers.host}/reset/${token}\n\n
            Si tú no solicitaste esto, por favor ignora este correo y tu contraseña permanecerá sin cambios.\n`

    sendMail(email, subject, text);

    await dbQueries.updateResetPasswordToken(email, token, expires);
    res.status(200).json({ message: 'Se ha enviado un correo a la dirección indicada' });
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: error.message });
  }
};
