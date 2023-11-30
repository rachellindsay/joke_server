import axios from "axios";

async function canUserApprove(email) {
  const response = await axios.get("/backend/canUserApprove", {
    params: {
      email: email,
    },
  });
  console.log(response.data);
  return response.data; // should return boolean
}

export default canUserApprove;
