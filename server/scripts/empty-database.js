'use strict'
const path = require('path');
const envPath = path.join(__dirname, '../.env');
const dotenv = require('dotenv').config({path: envPath});

let sqlQueries = ['USE ' + process.env.DB_DATABASE];

let tables = ['t_prices', 't_printers', , 't_supplier', 't_consumables', 't_brands', 't_constructors'];

for (const table of tables) {
    sqlQueries.push('DELETE FROM ' + table + ';');
}

// Get the mysql service
let mysql = require('mysql');

// Add the credentials to access your database
let connection = mysql.createConnection({
  host     : process.env.DB_HOST,
  user     : process.env.DB_USER,
  password : process.env.DB_PASSWORD,
  database : process.env.DB_DATABASE
});

// connect to mysql
connection.connect(function(err) {
  // in case of error
  if(err){
    console.log(err.code);
    console.log(err.fatal);
  }
});

for (const query of sqlQueries) {
  connection.query(query, function(err, rows, fields) {
    if(err){
      console.log('An error occurred performing the query.');
      console.log(err);
      return;
    }
  
    console.log('Query successfully executed: ', rows);
  });
}

// Close the connection
connection.end(function(){
  // The connection has been closed
});