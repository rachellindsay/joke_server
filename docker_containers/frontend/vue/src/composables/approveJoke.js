import axios from "axios";

async function approveJoke(id) {
  const response = await axios.post("/backend/approveJoke", {
    id: id,
  });
  console.log(response);
  return response;
}

export default approveJoke;
