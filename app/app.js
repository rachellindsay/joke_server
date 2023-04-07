const express = require("express");
const randomJoke = require("./randomJoke");

const app = express();
const port = 5000;

app.get("/app", async (req, res) => {
  const joke = await randomJoke();
  res.json(joke);
});

app.listen(port, () => console.log(`Listening on port ${port}`));
