import { dbQueries } from "../instances/dbinstances";

class Security {
  constructor(query) {
    this.permissions = new Map();
  }

  async loadPermissions(req, res) {
    const { modulo, objectName, metodo, perfil } = req.body;
    try {
      const result = await dbQueries.getPermissions(
        modulo,
        objectName,
        metodo,
        perfil
      );

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
}
