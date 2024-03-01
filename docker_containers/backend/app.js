const express = require("express");
const dbCalls = require("./dbCalls.js");
const rabbitCalls = require("./rabbitCalls.js");

const app = express();
const port = 5000;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// calls function to get a random joke row (including id, category), uses rabbitmq to send a message with random joke info
app.get("/backend/randomJoke", async (req, res) => {
  const jokeRow = await dbCalls.randomJoke();
  console.log("email: ", req.query.email);
  const isLoggedIn = req.query.email !== undefined;
  const rabbitMsg = jokeRow;
  rabbitMsg.isLoggedIn = isLoggedIn; // adds new key:value pair (isLoggedIn:isLoggedIn) to rabbitMsg
  rabbitCalls.rabbit(rabbitMsg, "told"); // fire off rabbitmq message (joke that was told) to the "told" exchange:  rabbitCalls.rabbit(msgObj, exchange)
  res.json(jokeRow);
});

// calls function to get all of the pending jokes from the database
app.get("/backend/allPendingJokes", async (req, res) => {
  const pendingJokes = await dbCalls.allPendingJokes();
  res.json(pendingJokes);
});

// calls function to approve joke passing along joke id
app.post("/backend/approveJoke", async (req, res) => {
  console.log(req.body, "approveJoke");
  const approve = await dbCalls.approveJoke(req.body.id);
  res.json(200);
});

// calls function to reject joke passing along joke id
app.post("/backend/rejectJoke", async (req, res) => {
  const reject = await dbCalls.rejectJoke(req.body.id);
  res.json(200);
});

/* calls function to submit joke to the database passing joke, category, email and then using rabbitmq to send a message to the 'submitted' exchange that a joke has been submitted */
app.post("/backend/submitJoke", async (req, res) => {
  console.log(req.body, "submitJoke");
  const submit = await dbCalls.submitJoke(
    req.body.joke,
    req.body.category,
    req.body.email
  );
  // fire off rabbit mq message (joke entered) to 'submitted' exchange:  rabbitCalls.rabbit(msgObj, exchange)
  rabbitCalls.rabbit(
    { joke: req.body.joke, category: req.body.category, who: req.body.email },
    "submitted"
  );
  //rabbitCalls.rabbit("Send joke submitted email", "submittedEmail");
  res.json(200);
});

// calls function to check if user email matches emails in the canApprove table (boolean)
app.get("/backend/canUserApprove", async (req, res) => {
  const canApprove = await dbCalls.canUserApprove(req.query.email);
  res.json(canApprove); // returns boolean
});

app.listen(port, () => console.log(`Listening on port ${port}`));
