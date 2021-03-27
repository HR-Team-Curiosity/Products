const mysql = require('mysql');
const mysqlConfig = require('./config.js');

const connection = mysql.createConnection(mysqlConfig);

const getProducts = cb => {
  // connection.query('SELECT * FROM product', (err, res) => {
  //   if (err) return cb(err);
  //   return cb(null, res);
  // });
  connection.query('select * from product order by id desc limit 100001', (err, res) => {
    if (err) return cb(err);
    return cb(null, res);
  })
};

const getProductById = (id, cb) => {
  connection.query(`SELECT * FROM product WHERE id = ${id}`, (err, res) => {
    if (err) return cb(err);
    return cb(null, res);
  });
};

const getProductStyle = (id, cb) => {
  connection.query(`SELECT * FROM styles WHERE product_id = ${id}`, (err, res) => {
    if (err) return cb(err);
    return cb(null, res);
  });
};

module.exports = {
  getProducts,
  getProductById,
  getProductStyle
};
