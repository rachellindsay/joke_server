const express = require("express");
const dbCalls = require("./dbCalls.js");

const app = express();
const port = 5000;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

/* 
randomJoke
canUserApprove
submitJoke
approveJoke
rejectJoke
allPendingJokes

*/
app.get("/backend/randomJoke", async (req, res) => {
  const joke = await dbCalls.randomJoke();
  res.json(joke);
});

app.get("/backend/allPendingJokes", async (req, res) => {
  const pendingJokes = await dbCalls.allPendingJokes();
  res.json(pendingJokes);
});

app.post("/backend/approveJoke", async (req, res) => {
  console.log(req.body, "approveJoke");
  const approve = await dbCalls.approveJoke(req.body.id);
  res.json(200);
});

app.post("/backend/rejectJoke", async (req, res) => {
  const reject = await dbCalls.rejectJoke(req.body.id);
  res.json(200);
});

app.post("/backend/submitJoke", async (req, res) => {
  console.log(req.body, "submitJoke");
  const submit = await dbCalls.submitJoke(
    req.body.joke,
    req.body.category,
    req.body.email
  );
  res.json(200);
});

app.get("/backend/canUserApprove", async (req, res) => {
  const canApprove = await dbCalls.canUserApprove(req.query.email);
  res.json(canApprove); // returns boolean
});

app.listen(port, () => console.log(`Listening on port ${port}`));
