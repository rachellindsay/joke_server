import axios from "axios";

async function rejectJoke(id) {
  const response = await axios.post("/backend/rejectJoke", {
    id: id,
  });
  console.log(response);
  return response;
}

export default rejectJoke;
