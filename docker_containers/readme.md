to do:

Update readme to add back the instructions (need to be edited) from v1s

git repo
login button - just login and indicate whether someone is logged in - display email address if logged in
random joke - add backend and run through nginx and make call to db
deploy to rachellindsay.net

extra:
makefile
make pretty
submitting and approving jokes
forms
changes to the database
approved
email address/user

to login to EC2:
navigate to .ssh directory
ssh -i "JokeServer.pem" ubuntu@ec2-35-86-104-116.us-west-2.compute.amazonaws.com
(you can find this by connecting to instance in EC2 dashboard on AWS, then selecting SSH client)

to install
npm install in both frontend and backend
npm run build in frontend to get the dist directory
navigate to root, docker compose up

# Joke_server

Joke_server is a simple program that displays a random joke to the user when the joke button is clicked. It runs locally in Docker containers.

## Installation

[Docker Desktop](https://www.docker.com/products/docker-desktop/) needs to be installed and running

1. Clone the repo

> `https://github.com/rachellindsay/joke_server.git`

2. Navigate to the backend directory, run `npm install`

3. Navigate to the frontend directory, run `npm install`

4. Still in the frontend directory, run `npm run build`
5. In the db directory, create a new directory called db_storage (this is where the database data lives after docker creates the new database.)
6. Navigate to the root directory and run:

> `docker compose up`

7. Once the server is up and running you should be able to see the app at http://localhost:80

## Features

#### backend

node.js app which uses Express.js and returns a random joke from the database.

#### frontend

nginx serving Vue.js app that forwards requests to node app for jokes

#### db

mariadb database holding the jokes

#### adminer

https://www.adminer.org
