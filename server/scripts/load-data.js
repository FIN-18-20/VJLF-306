'use strict';
const path = require('path');
const envPath = path.join(__dirname, '../.env');
const dotenv = require('dotenv').config({path: envPath});

let csvPath = __dirname;

csvPath = path.join(csvPath, '../../docs/db');

let sqlQuery = "LOAD DATA\n" +
  "INFILE '" + csvPath + "/constructors.csv'\n" +
  "INTO TABLE t_constructors\n" +
  "CHARACTER SET \"utf8\"\n" +
  "COLUMNS TERMINATED BY ';'\n" +
  "OPTIONALLY ENCLOSED BY ''\n" +
  "LINES TERMINATED BY '\\r\\n'\n" +
  "IGNORE 1 LINES\n" +
  "(idConstructor, conName);\n" +
  "\n" +
  "LOAD DATA\n" +
  "INFILE '" + csvPath + "/suppliers.csv'\n" +
  "INTO TABLE t_supplier\n" +
  "CHARACTER SET \"utf8\"\n" +
  "COLUMNS TERMINATED BY ';'\n" +
  "OPTIONALLY ENCLOSED BY ''\n" +
  "LINES TERMINATED BY '\\r\\n'\n" +
  "IGNORE 1 LINES\n" +
  "(idSupplier, supName);\n" +
  "\n" +
  "LOAD DATA\n" +
  "INFILE '" + csvPath + "/consumables.csv'\n" +
  "INTO TABLE t_consumables\n" +
  "CHARACTER SET \"utf8\"\n" +
  "COLUMNS TERMINATED BY ';'\n" +
  "OPTIONALLY ENCLOSED BY ''\n" +
  "LINES TERMINATED BY '\\r\\n'\n" +
  "IGNORE 1 LINES\n" +
  "(idConsumable, csbName, csbDescription, csbPrice);\n" +
  "\n" +
  "LOAD DATA\n" +
  "INFILE '" + csvPath + "/brands.csv'\n" +
  "INTO TABLE t_brands\n" +
  "CHARACTER SET \"utf8\"\n" +
  "COLUMNS TERMINATED BY ';'\n" +
  "OPTIONALLY ENCLOSED BY ''\n" +
  "LINES TERMINATED BY '\\r\\n'\n" +
  "IGNORE 1 LINES\n" +
  "(idBrands, braName, idConstructor);\n" +
  "LOAD DATA\n" +
  "INFILE '" + csvPath + "/printers.csv'\n" +
  "INTO TABLE t_printers\n" +
  "CHARACTER SET \"utf8\"\n" +
  "COLUMNS TERMINATED BY ';'\n" +
  "OPTIONALLY ENCLOSED BY ''\n" +
  "LINES TERMINATED BY '\\r\\n'\n" +
  "IGNORE 1 LINES\n" +
  "(idPrinter, priName, priWidth, priHeight, priLength, priWeight, priPrintSpeed, priScanRes, priSales, idBrands, idSupplier, idConsumable);\n" +
  "\n" +
  "LOAD DATA\n" +
  "INFILE '" + csvPath + "/prices.csv'\n" +
  "INTO TABLE t_prices\n" +
  "CHARACTER SET \"utf8\"\n" +
  "COLUMNS TERMINATED BY ';'\n" +
  "OPTIONALLY ENCLOSED BY ''\n" +
  "LINES TERMINATED BY '\\r\\n'\n" +
  "IGNORE 1 LINES\n" +
  "(idPrice, idPrinter, priDate, priValue);";

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

connection.query(sqlQuery, function(err, rows, fields) {
  if(err){
    console.log("An error occurred performing the query.");
    console.log(err);
    return;
  }

  console.log("Query successfully executed: ", rows);
});

// Close the connection
connection.end(function(){
  // The connection has been closed
});

