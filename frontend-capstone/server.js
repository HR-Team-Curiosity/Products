const express = require('express');
const app = express();
const port = 3000;
const path = require('path');
const db = require('./src/db/database.js');


app.use(express.static('dist'));

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'dist', 'index.html'));
});

app.get(`/products`, (req, res) => {
  db.getProducts((err, data) => {
    if (err) {
      res.status(500).send(err);
    } else {
      res.send(data);
    }
  })
});

app.get(`/products/:productID`, (req, res) => {
  db.getProductById(req.params.productID, (err, data) => {
    if (err) {
      res.status(500).send(err);
    } else {
      res.send(data);
    }
  })
})

app.listen(port, () =>
  console.log(`Example app listening at http://localhost:${port}`)
);
