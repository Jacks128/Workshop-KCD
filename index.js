const express = require('express');
const path = require('path');
const app = express();
const port = 8080;

// Servir el HTML como ruta raíz
app.get('/', (_req, res) => {
  res.sendFile(path.join(__dirname, 'frontend.html'));
});

app.get('/healthz', (req, res) => {
  res.send(`This is a healthy application running in ${process.env.VERSION}!!!`);
});

app.get('/version', (req, res) => {
  res.send('1.0.0');
});

app.get('/greet/:name', (req, res) => {   
  console.log(`Let's greet ${req.params.name}!`); 
  res.send(`Hello ${req.params.name}!`);
});

app.get('/sayGoodbye/:name', (req, res) => {   
  console.log(`Let's greet ${req.params.name}!`); 
  res.send(`Bye ${req.params.name}!`);
});

app.listen(port, () => {
  console.log(`Hello App is listening on port ${port}`);
});
