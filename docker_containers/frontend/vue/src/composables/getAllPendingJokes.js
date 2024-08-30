import axios from "axios";

async function getAllPendingJokes() {
  const response = await axios.get("/backend/allPendingJokes");
  let pending = [];
  pending = response.data;
  return pending;
}

export default getAllPendingJokes;
