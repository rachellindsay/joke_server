# Joke_server

Joke_server is a simple program that displays a random joke to the user when the joke button is clicked. It runs locally in Docker containers.

## Installation
[Docker Desktop](https://www.docker.com/products/docker-desktop/) needs to be installed and running 

1. Clone the repo 

>`https://github.com/rachellindsay/joke_server.git`	

2. Run `npm install` in the app directory
   
3. In the db directory, create a new directory called db_storage (this is where the database data lives after docker creates the new database.)
   
4. Navigate to the root directory and run:

>`docker compose up`

5. Once the server is up and running you should be able to see the app at http://localhost:8000

## Features

### Backend

#### app

node.js app which uses Express.js and returns a random joke from the database.

#### nginx

nginx serving static html (frontend) and forwards requests to node app for jokes

#### db

mariadb database holding the jokes

#### adminer

https://www.adminer.org   


### Frontend
HTML, CSS, and Javascript to display a button and the returned joke on the screen.

## Next Steps:

- more Git practice
- ~~SQL database to store the jokes~~
- snazzier html/css frontend
- learn Vue 3 and use for the front end
- More options for retrieving jokes (e.g. filters)
- use a .env file where appropriate
