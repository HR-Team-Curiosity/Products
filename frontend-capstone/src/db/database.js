const mysql = require('mysql');
const mysqlConfig = require('./config.js');

const connection = mysql.createConnection(mysqlConfig);

const getProducts = cb => {
  // TODO - your code here
  connection.query('SELECT * FROM product limit 100', (err, res) => {
    if (err) {
      return cb(err);
    }
    return cb(null, res);
  });
};

const getProductById = (id, cb) => {
  connection.query(`SELECT * FROM product WHERE id = ${id}`, (err, res) => {
    if (err) {
      return cb(err);
    } else {
      return cb(null, res);
    }
  });
};


module.exports = {
  getProducts,
  getProductById
};
