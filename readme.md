# Joke_server

Joke_server is a simple program that displays a random joke to the user when the joke button is clicked.

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
