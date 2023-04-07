// all the code that connects to and queries the database

const mariadb = require("mariadb");

const pool = mariadb.createPool({
  host: "db", // this points to db
  user: "root",
  password: "example",
  database: "joke_db",
});

const randomJoke = async function randomJoke() {
  let conn;
  try {
    conn = await pool.getConnection();
    const result = await conn.query(
      "SELECT joke FROM jokes ORDER BY RAND() LIMIT 1"
    );
    return result[0];
  } catch (error) {
    throw error;
  } finally {
    if (conn) {
      conn.release();
    }
  }
};

module.exports = randomJoke;