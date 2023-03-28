const onJokeClick = () => {
  axios
    .get("http://localhost:3000/singleJoke")
    .then((result) => {
      const data = result.data;
      const tellJoke = document.getElementById("div2");
      tellJoke.innerHTML = data["joke"];
  });
};

let jokeButton = document.getElementById("joke_button");
jokeButton.onclick = onJokeClick;
