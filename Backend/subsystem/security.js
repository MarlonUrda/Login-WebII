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

      //console.log(result.rows.length);

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

  async validPermissions(req) {
    let { modulo, clase, metodo } = req.body;
    let { session } = req;
    const permissionKey = modulo + "_" + clase + "_" + metodo + "_" + session.perfil; // agregar luego session.perfil
    console.log(permissionKey);
    if (this.permissions.get(permissionKey.toLowerCase())) {
      return true;
    } else {
      return false;
    }
  }
}

export default Security;

// const test = new Security();

// test.validPermissions({
//   body: {
//     modulo: "Proyecto",
//     clase: "Project",
//     metodo: "getProjectsByPersone",
//     perfil: "Documentista",
//   },
// });
