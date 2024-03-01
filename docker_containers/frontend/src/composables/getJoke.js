import axios from "axios";

async function getJoke(email) {
  const response = await axios.get("/backend/randomJoke", {
    params: {
      email,
    },
  });

  return response.data.joke;
}

export default getJoke;
