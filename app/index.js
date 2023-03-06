const express = require('express');
const app = express();

app.use(express.static('public'));

app.get('/', (req, res) => {
  res.send('Jokes')
});

app.listen(5000, () => console.log('Server is up and running'));