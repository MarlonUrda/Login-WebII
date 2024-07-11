import { dbQueries } from "../instances/dbinstances.js";

class Security {
  constructor() {
    this.permissions = new Map();
    this.permissionsLoaded = false;
    this.loadPermissions();
  }

  async loadPermissions() {
    if (this.permissionsLoaded) return;
    try {
      const result = await dbQueries.getPermissions();
      const value = true;

      console.log(result.rows.length);

      if (!(result.rows.length > 0)) {
        return "No se encontraron permisos.";
      }

      const replica = new Map();
      const unica = result.rows.filter((row) => {
        const key = `${row.modulo.toLowerCase()}_${row.clase.toLowerCase()}_${row.metodo.toLowerCase()}_${row.perfil.toLowerCase()}`;

        if (!replica.has(key)) {
          replica.set(key, true);
          return true;
        }

        return false;
      });

      unica.forEach((row) => {
        this.permissions.set(
          row.modulo.toLowerCase() +
            "_" +
            row.clase.toLowerCase() +
            "_" +
            row.metodo.toLowerCase() +
            "_" +
            row.perfil.toLowerCase(),
          value
        );
      });
      console.log("Permisos cargados");
      this.permissions.forEach((value, key) => {
        console.log(`${key}: ${value}`);
      });
      this.permissionsLoaded = true;
    } catch (error) {
      console.log(error);
    }
  }

  // {modulo: "Proyecto", objectName: "B", "metodo": "addObjetive", perfil: "recurso"}
  async validPermissions(req, res) {
    let { modulo, clase, metodo, perfil } = req.body;
    const k = modulo + "_" + clase + "_" + metodo + "_" + perfil; // Proyecto_administracion_addTask_developer
    console.log(k);
    if (this.permissions.get(k.toLowerCase())) {
      res.status(200).send({ message: "Permisos validos" });
    }
    res.status(401).send({ message: "Permisos no validos" });
    return false;
  }
}

export default Security;
