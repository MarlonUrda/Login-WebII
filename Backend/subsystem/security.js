import { dbQueries } from "../instances/dbinstances";

class Security {
  constructor() {
    this.permissions = new Map();
    this.loadPermissions();
    this.value = true;
  }

  async loadPermissions() {
    try {
      const result = await dbQueries.getPermissions();

      if (!(result.length > 0)) {
        return res.status(404).json({ message: "No se encontraron permisos" });
      }

      result.rows.forEach((row) => {
        this.permissions.set(
          row.modulo +
            "_" +
            row.objectName +
            "_" +
            row.metodo +
            "_" +
            row.perfil,
          value
        );
      });
    } catch (error) {
      console.log(error);
      return res.status(500).json({ message: "Error al cargar permisos" });
    }
  }

  // {modulo: "Proyecto", objectName: "B", "metodo": "addObjetive", perfil: "recurso"}
  async validPermissions(req, res) {
    let { modulo, objectName, metodo, perfil } = req.body;
    const k = modulo + "_" + objectName + "_" + metodo + "_" + perfil; // Proyecto_administracion_addTask_developer
    if (this.permissions.get(k.toLowerCase())) {
      return res.status(200).json({ message: "Permisos validos" });
    }
    return res.status(401).json({ message: "Permisos no validos" });
  }
}

export default Security;
