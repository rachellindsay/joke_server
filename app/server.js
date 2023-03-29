
const randomJoke = require ('./randomJoke');
const express = require("express");



const app = express();
// 
const port = 5000;


app.get("/app", (req, res) => {
  const joke = randomJoke();
  res.json(joke);
});

app.listen(port, () => {
  console.log(`app listening on port ${port}`);
});


