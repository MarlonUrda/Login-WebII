export const updateRole = async (req, res) => {
  try {
    // console.log(req.body.newRole);
    // console.log(req.session.perfil);
    if (req.session.role === req.body.newRole)
      return res.send({ message: "Mismo perfil" });

    const p = req.body.newRole;
    req.session.role = p;
    //console.log(req.session.perfil);
    res.send({
      newRole: req.body.newRole,
    });
  } catch (error) {
    console.log(error.message);
  }
};
