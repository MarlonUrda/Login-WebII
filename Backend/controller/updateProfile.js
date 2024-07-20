export const updateProfile = async (req, res) => {
  try {
    // console.log(req.body.newProfile);
    // console.log(req.session.perfil);
    if (req.session.perfil === req.body.newProfile)
      return res.send({ message: "Mismo perfil" });
    
    const p = req.body.newProfile;
    req.session.perfil = p;
    //console.log(req.session.perfil);
    res.send({
      newPerfil: req.body.newProfile,
    });
  } catch (error) {
    console.log(error.message);
  }
};
