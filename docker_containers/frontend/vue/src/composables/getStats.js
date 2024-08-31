// This will be the function that calls stats - will be interesting because getStats will be python

import axios from "axios";

async function getStats() {
  const response = await axios.get("/stats/getStats");
  console.log(response.data);
  // return response.data;
  const stats = response.data;
  return stats;
}

export default getStats;
