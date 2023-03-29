# Joke_server

Joke_server is a simple program that displays a random joke to the user when the joke button is clicked. It runs locally in Docker containers.

## Installation
[Docker Desktop](https://www.docker.com/products/docker-desktop/) needs to be installed and running 

1. Clone the repo 

>`https://github.com/rachellindsay/joke_server.git`	

2. Run `npm install` in the app directory

3. Navigate to the root directory and run:

>`docker compose up --build`

1. Once the server is up and running you should be able to see the app at http://localhost:8080

## Features

### Backend

#### app

node.js app which uses Express.js and returns a random joke from an array of jokes.

#### nginx

nginx serving static html (frontend) and forwards requests to node app for jokes

### Frontend
HTML, CSS, and Javascript to display a button and the returned joke on the screen.

## Next Steps:

- More Git practice
- SQL database to store the jokes
- Snazzier Vue frontend
- More options for retrieving jokes (e.g. filters)



