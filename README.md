# Joke_server

Joke_server is a simple program that displays a random joke to the user when the joke button is clicked. It runs locally in Docker containers.

## Installation
[Docker Desktop](https://www.docker.com/products/docker-desktop/) needs to be installed and running 

1. Clone the repo

>`https://github.com/rachellindsay/joke_server.git`	

2. Navigate to the root directory and run:

>`docker-compose up --build`

3. Once the server is up and running you should be able to see the app at both http://localhost:8080 and http://localhost:5000

## Features

### Backend
Node.js app using Express to handle requests/responses and Nginx to forward requests to the Node.js app and serve the static html.

### Frontend
HTML, CSS, and Javascript to display a button and the returned joke on the screen. The very bad jokes are currently a JavaScript array of strings.



