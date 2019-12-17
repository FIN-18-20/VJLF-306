'use strict';
const path = require('path');
const envPath = path.join(__dirname, '../.env');
const dotenv = require('dotenv').config({path: envPath});

let csvPath = __dirname;

csvPath = path.join(csvPath, '../../docs/db').replace(/\\/g, '/');

let sqlQueries = [];

let sqlQueryConstructors = `LOAD DATA
  INFILE '` + csvPath + `/constructors.csv'
  INTO TABLE t_constructors 
  CHARACTER SET "utf8" 
  COLUMNS TERMINATED BY ';' 
  OPTIONALLY ENCLOSED BY '' 
  LINES TERMINATED BY '\\r\\n' 
  IGNORE 1 LINES 
  (idConstructor, conName);`;
   
  let sqlQuerySuppliers = `LOAD DATA 
  INFILE '` + csvPath + `/suppliers.csv' 
  INTO TABLE t_supplier 
  CHARACTER SET "utf8" 
  COLUMNS TERMINATED BY ';' 
  OPTIONALLY ENCLOSED BY '' 
  LINES TERMINATED BY '\\r\\n' 
  IGNORE 1 LINES 
  (idSupplier, supName);`;
   
  let sqlQueryConsumables = `LOAD DATA 
  INFILE '` + csvPath + `/consumables.csv' 
  INTO TABLE t_consumables 
  CHARACTER SET "utf8" 
  COLUMNS TERMINATED BY ';' 
  OPTIONALLY ENCLOSED BY '' 
  LINES TERMINATED BY '\\r\\n' 
  IGNORE 1 LINES 
  (idConsumable, csbName, csbDescription, csbPrice);`;
   
  let sqlQueryBrands = `LOAD DATA 
  INFILE '` + csvPath + `/brands.csv' 
  INTO TABLE t_brands 
  CHARACTER SET "utf8" 
  COLUMNS TERMINATED BY ';' 
  OPTIONALLY ENCLOSED BY '' 
  LINES TERMINATED BY '\\r\\n' 
  IGNORE 1 LINES 
  (idBrands, braName, idConstructor);`;

  let sqlQueryPrinters = `LOAD DATA 
  INFILE '` + csvPath + `/printers.csv' 
  INTO TABLE t_printers 
  CHARACTER SET "utf8" 
  COLUMNS TERMINATED BY ';' 
  OPTIONALLY ENCLOSED BY '' 
  LINES TERMINATED BY '\\r\\n' 
  IGNORE 1 LINES 
  (idPrinter, priName, priWidth, priHeight, priLength, priWeight, priPrintSpeed, priScanRes, priSales, idBrands, idSupplier, idConsumable);`;
   
  let sqlQueryPrices = `LOAD DATA 
  INFILE '` + csvPath + `/prices.csv' 
  INTO TABLE t_prices 
  CHARACTER SET "utf8" 
  COLUMNS TERMINATED BY ';' 
  OPTIONALLY ENCLOSED BY '' 
  LINES TERMINATED BY '\\r\\n' 
  IGNORE 1 LINES 
  (idPrice, idPrinter, priDate, priValue);`;

  
  sqlQueries.push(sqlQueryConstructors);
  sqlQueries.push(sqlQuerySuppliers);
  sqlQueries.push(sqlQueryConsumables);
  sqlQueries.push(sqlQueryBrands);
  sqlQueries.push(sqlQueryPrinters);
  sqlQueries.push(sqlQueryPrices);

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
      return;
    }
  
    console.log('Query successfully executed: ', rows);
  });
}

// Close the connection
connection.end(function(){
  // The connection has been closed
});

