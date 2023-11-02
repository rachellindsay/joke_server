import axios from "axios";

async function getJoke() {
  const response = await axios.get("/backend/randomJoke");

  return response.data.joke;
}

export default getJoke;
