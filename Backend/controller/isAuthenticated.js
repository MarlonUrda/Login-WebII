export const isAuthenticated = async (req, res) => {
    try {
      if(!req.session.loggedin){
            console.log('isAuthenticated: no logeado');
            return res.status(401).send({ message: false });
        }
    console.log('isAuthenticated: logeado');
    return res.status(200).send({ message: true });
    
    } catch (error) {
      console.log(error.message);
      return res.status(500).send({ message: error.message });
    }
  };
  

  
  