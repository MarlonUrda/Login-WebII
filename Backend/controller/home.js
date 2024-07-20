export const userData = async (req, res) => {
  try {
    if(!req.session.user){
      return res.status(401).send({ message: "You are not logged in!" });
    }
    console.log('userData ejecutado');

    const { user, email, loggedin, idPerson, name: personName, lastname } = req.session;
    return res.json({
      idPerson: idPerson,
      name: personName,
      lastname: lastname,
      user: user,
      email: email,
      loggedin: loggedin,
    });


  } catch (error) {
    console.log(error.message);
  }
};

export const logout = (req, res) => {
  req.session.destroy();
  res.status(200).send({ message: "You logged out succesfully!" });
};
