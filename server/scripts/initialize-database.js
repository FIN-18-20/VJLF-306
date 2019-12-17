'use strict'
const path = require('path');
const envPath = path.join(__dirname, '../.env');
const dotenv = require('dotenv').config({path: envPath});
const mysql_import = require('mysql-import');

// Get the mysql service
let mysql = require('mysql');

const importer = mysql_import.config({
	host     : process.env.DB_HOST,
    user     : process.env.DB_USER,
    password : process.env.DB_PASSWORD,
    database : process.env.DB_DATABASE,
	onerror: err=>console.log(err.message)
});

let sqlPath = __dirname;
sqlPath = path.join(sqlPath, '../../docs/db').replace(/\\/g, '/');

importer.import(sqlPath + '/topprinters_empty.sql');
