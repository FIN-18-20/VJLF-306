### To load data in the MySQL database
***
### t_constructors

```
LOAD DATA
INFILE '<YOUR PATH>//VJLF-306//docs//db//constructors.csv'
INTO TABLE t_constructors
CHARACTER SET "utf8"
COLUMNS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY ''
ESCAPED BY '\r\n'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(idConstructor, conName)
```