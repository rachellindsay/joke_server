import axios from "axios";

async function canUserApprove(email) {
  const response = await axios.get("/backend/canUserApprove", {
    params: {
      email: email,
    },
  });
  console.log(response);
  return response.value;
}

export default canUserApprove;
