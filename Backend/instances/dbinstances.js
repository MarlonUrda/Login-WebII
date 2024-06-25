import Database from "../subsystem/Database.js";
import  DbQueries  from "../subsystem/DbQueries.js";

const db = new Database();
db.connect();
export const dbQueries = new DbQueries(db.pool);

