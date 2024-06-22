import bc from "bcryptjs";

/**
* Encripta una contraseña utilizando bcryptjs.
* @param {string} password La contraseña en texto plano que se desea encriptar.
* @returns {Promise<string>} Una promesa que resuelve con el hash encriptado de la contraseña.
*/
export const encrypt = async (password) => {
  const salt = await bc.genSalt(10);
  const hash = await bc.hash(password, salt);
  return hash;
};

/**
 * Compara una contraseña en texto plano con un hash encriptado.
 * @param {string} password La contraseña en texto plano que se desea comparar.
 * @param {string} encrypted El hash encriptado de la contraseña.
 * @returns {Promise<boolean>} Una promesa que resuelve con un booleano que indica si la contraseña en texto plano coincide con el hash encriptado.
 */
export const compare = async (password, encrypted) => {
  return await bc.compare(password, encrypted);
};
