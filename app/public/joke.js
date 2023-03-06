const jokes = [
  "What do bees do after they are married? They go on a honeymoon.",
  "Breaking news! Energizer Bunny arrested – charged with battery.",
  "Did you hear about the scientist who was lab partners with a pot of boiling water? He had a very esteemed colleague.",
  "what do you call a dog that can do magic tricks? a labracadabrador",
  "I’ve just been reading a book about anti-gravity, it's impossible to put down!",
  "Why do trees seem suspicious on sunny days? Dunno, they're just a bit shady.",
  "What kind of tree fits in your hand? A palm tree!",
  "What did the fish say when it swam into a wall? Damn!",
  "Why do cows wear bells? Because their horns don't work.",
  "Why does a chicken coop only have two doors? Because if it had four doors it would be a chicken sedan.",
];

const onJokeClick = function () {
  console.log("jokeButton.onclick actually called"); // Not necessary - was added while troubleshooting
  const rand = Math.floor(Math.random() * jokes.length); // originally, instead of jokes.length, had 10, but jokes.length is better in case more jokes are added and it's just neater.
  const tellJoke = document.getElementById("div2");
  tellJoke.innerHTML = jokes[rand];
  //window.alert(jokes[rand]); //added for troublshooting
};

let jokeButton = document.getElementById("joke_button");
jokeButton.onclick = onJokeClick;
