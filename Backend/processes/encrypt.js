import bc from "bcryptjs";

export const encrypt = async (password) => {
  const salt = await bc.genSalt(10);
  const hash = await bc.hash(password, salt);
  return hash;
};

export const compare = async (password, encrypted) => {
  return await bc.compare(password, encrypted);
};
