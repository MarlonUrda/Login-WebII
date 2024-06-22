import { dbQueries } from "../instances/dbinstances.js";
import { encrypt } from "../subsystem/encrypt.js";

class ResetControler {
    static async resetPasswordGet(req, res){
        const { token } = req.params;
        console.log(token);
  
        try {
            const result = await dbQueries.getUserwithValidToken(token);

            if (!(result.rows.length > 0)) {
                return res.status(400).json({
                    message:
                    "El token de restablecimiento de contraseña es inválido o ha expirado.",
                });
            }
            // Obtén primera fila de la consulta
            const user = result.rows[0];

            // Obtén el token de restablecimiento de contraseña de la base de datos
            const tokenFromDatabase = user.resetpasswordtoken;
        
            console.log(tokenFromDatabase);
            res.json({ message: "Token válido." });
        } catch (error) {
            console.error(error);
            res.status(500).json({ message: "Error al procesar la solicitud." });
        }
    }

    static async resetPasswordPost(req, res){
        const { token } = req.params;
        const { password } = req.body;
        console.log(token);
        console.log(password);
  
        try {

            const result = await dbQueries.getUserwithValidToken(token);

            if (!(result.rows.length > 0)) {
            return res.status(400).json({
                message:
                "El token de restablecimiento de contraseña es inválido o ha expirado.",
            });
            }
    
            const user = result.rows[0];
        
            const hashedPassword = await encrypt(password, 10);
        

            await dbQueries.UpdatePassword(user.email, hashedPassword);
        
            res.json({ message: "Contraseña restablecida con éxito." });
        } catch (error) {
            console.error(error);
            res.status(500).json({ message: "Error al restablecer la contraseña." });
        }
    }
  
}

export default  ResetControler;