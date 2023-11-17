To do:

fine tuning:

- url routing problems - if a user types url/approve they should be redirected to home page rather than getting 404.

- database:

  - joke categories coming from db - separate table with it's own ids (foreign key)
    -- add categories: computer, food,
  - add timestamp

- make pretty

to login to EC2:
ssh -i "~/.ssh/JokeServer.pem" ubuntu@ec2-34-212-28-186.us-west-2.compute.amazonaws.com
(you can find this by connecting to instance in EC2 dashboard on AWS, then selecting SSH client)

to install
npm install in both frontend and backend
npm run build in frontend to get the dist directory
navigate to root, docker compose up

Let's Encrypt Tutorial: https://mindsers.blog/post/https-using-nginx-certbot-docker/

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

#### Hosted on AWS EC2

#### backend

node.js app which uses Express.js and returns a random joke from the database.

#### frontend

nginx serving Vue.js app that forwards requests to node app for jokes
uses auth0 for user authentication
uses Let's Encrypt and Certbot for https

#### db

mariadb database holding the jokes

#### adminer

https://www.adminer.org
