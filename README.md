# Joke_server

Joke_server is a simple program that displays a random joke to the user when the user clicks the joke button. It runs locally in two Docker containers.

### Frontend
HTML, CSS, and Javascript to display a button and the returned joke on the screen. The very bad jokes are currently a JavaScript array of strings.

### Backend
Node.js app using Express to handle requests/responses and Nginx to forward requests to the Node.js app and serve the static html
