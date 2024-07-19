import Database from "../subsystem/Database.js";
import  DbQueries  from "../subsystem/DbQueries.js";
import Security from "../subsystem/security.js";
const db = new Database();
db.connect();
export const dbQueries = new DbQueries(db.pool);
export const security = new Security();
