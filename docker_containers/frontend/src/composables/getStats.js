// This will be the function that calls stats - will be interesting because getStats will be python

import axios from "axios";

async function getStats() {
  const response = await axios.get("/flask/hello");
  console.log(response.data);
  return response;
}

export default getStats;
