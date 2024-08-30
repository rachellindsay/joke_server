import axios from "axios";

async function submitJoke(joke, category, email) {
  const response = await axios.post("/backend/submitJoke", {
    joke: joke,
    category: category,
    email: email,
  });
  console.log(response);
  return response;
}

export default submitJoke;
