// all the code that connects to and queries the database

const mariadb = require("mariadb");

const pool = mariadb.createPool({
  host: "db", // this points to db
  user: "root",
  password: "example",
  database: "joke_db",
});

/* import { createPool } from "mariadb";

const pool = createPool({
  host: "db", // this points to db
  user: "root",
  password: "example",
  database: "joke_db",
});
*/

const randomJoke = async function randomJoke() {
  let conn;
  try {
    conn = await pool.getConnection();
    const result = await conn.query(
      `SELECT jokes.joke 
      FROM jokes 
      WHERE jokes.status = "approved"
      ORDER BY RAND() 
      LIMIT 1`
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

const allPendingJokes = async function allPendingJokes() {
  let conn;
  try {
    conn = await pool.getConnection();
    const result = await conn.query(
      `SELECT jokes.joke, jokes.id
      FROM jokes 
      WHERE jokes.status = "pending"`
    );
    return result;
  } catch (error) {
    throw error;
  } finally {
    if (conn) {
      conn.release();
    }
  }
};

const approveJoke = async function approveJoke(id) {
  console.log("approve joke", id);
  let conn;
  try {
    conn = await pool.getConnection();
    const result = await conn.query(
      `UPDATE jokes
      SET jokes.status="approved" 
      WHERE jokes.id=?`,
      [id]
    );
    return result;
  } catch (error) {
    throw error;
  } finally {
    if (conn) {
      conn.release();
    }
  }
};

const rejectJoke = async function rejectJoke(id) {
  let conn;
  try {
    conn = await pool.getConnection();
    const result = await conn.query(
      `UPDATE jokes
      SET jokes.status="rejected" 
      WHERE jokes.id=?`,
      [id]
    );
    return result;
  } catch (error) {
    throw error;
  } finally {
    if (conn) {
      conn.release();
    }
  }
};

const submitJoke = async function submitJoke(joke, category, email) {
  console.log("submit joke", joke, category, email);
  let conn;
  try {
    conn = await pool.getConnection();
    const result = await conn.query(
      `INSERT into jokes (
        joke,
        category,
        user_email)
      VALUES (?, ?, ?);`,
      [joke, category, email]
    );
    return result;
  } catch (error) {
    throw error;
  } finally {
    if (conn) {
      conn.release();
    }
  }
};

const canUserApprove = async function canUserApprove(email) {
  let conn;
  try {
    conn = await pool.getConnection();
    const result = await conn.query(
      `SELECT count(*) as c 
      FROM can_approve
      WHERE can_approve.user_email = ?`,
      [email]
    );
    return result[0].c > 0;
  } catch (error) {
    throw error;
  } finally {
    if (conn) {
      conn.release();
    }
  }
};

module.exports = {
  randomJoke,
  allPendingJokes,
  approveJoke,
  rejectJoke,
  submitJoke,
  canUserApprove,
};
