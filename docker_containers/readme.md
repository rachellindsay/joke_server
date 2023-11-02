to do:
make compose-remote.yml that will look almost identical to the compose-local, but will have a different .env (.env does not get checked into git). Update to use conf-remote/default.conf .
Should be able to update EC2 (add remote-up and remote-down targets to make file - to be run after connecting to EC2)

submit joke page

- empty field for joke body
- submit button to call the backend and submit the joke

authorize joke page

- navigating to authorize joke page should run function of pulling pending jokes from backend. Refreshing page should also run same function
- how to display pending jokes
- approve/reject buttons that change the joke status

backend

- is this user authorized function
- change the status of this joke function (approve/reject), refer to by id
- get pending jokes function
- submit joke function - assigns id, default pending status, submitter email

extra:
make pretty

to login to EC2:
navigate to .ssh directory
ssh -i "JokeServer.pem" ubuntu@ec2-35-86-104-116.us-west-2.compute.amazonaws.com
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
