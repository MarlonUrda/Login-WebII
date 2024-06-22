

export const userData = async (req, res) => {
    try {
      if (req.session.user){
        console.log(req.body.email, req.body.password);
        const user = req.session.user;
        console.log(user);
        res.json({
            user: user
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
