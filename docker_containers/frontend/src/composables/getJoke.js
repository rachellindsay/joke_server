import axios from "axios";

async function getJoke() {
  const response = await axios.get("/backend");

  return response.data.joke;
}

export default getJoke;
