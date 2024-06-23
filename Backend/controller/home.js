

export const userData = async (req, res) => {
    try {
      console.log('cookies:',req.cookies);
      console.log('session:',req.session);
      if (req.session.user){

        const user = req.session.user;
        const email = req.session.email;
        const loggedin = req.session.loggedin;
        res.json({
            user: user,
            email: email,
            loggedin: loggedin,
          });
      }
      else{
        res.status(401).send({ message: "You are not logged in!" });
      }
    } catch (error) {
        console.log(error.message);
    }
};

export const logout = (req, res) => {
  req.session.destroy();
  res.status(200).send({ message: "You logged out succesfully!" });
};
