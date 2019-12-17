## Utilisation du Load Data et des fichiers csv

Pour charger les données des fichiers csv fournis dans le repository, copiez et exécutez la query ci-dessous. 

:warning: Attention ! N'oubliez pas de remplacer **\<YOUR PATH>** par le chemin de votre dossier.

```
LOAD DATA
INFILE '<YOUR PATH>//VJLF-306//docs//db//constructors.csv'
INTO TABLE t_constructors
CHARACTER SET "utf8"
COLUMNS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY ''
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(idConstructor, conName);

LOAD DATA
INFILE '<YOUR PATH>//VJLF-306//docs//db//suppliers.csv'
INTO TABLE t_supplier
CHARACTER SET "utf8"
COLUMNS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY ''
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(idSupplier, supName);

LOAD DATA
INFILE '<YOUR PATH>//VJLF-306//docs//db//consumables.csv'
INTO TABLE t_consumables
CHARACTER SET "utf8"
COLUMNS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY ''
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(idConsumable, csbName, csbDescription, csbPrice);

LOAD DATA
INFILE '<YOUR PATH>//VJLF-306//docs//db//brands.csv'
INTO TABLE t_brands
CHARACTER SET "utf8"
COLUMNS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY ''
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(idBrands, braName, idConstructor);
LOAD DATA
INFILE '<YOUR PATH>//VJLF-306//docs//db//printers.csv'
INTO TABLE t_printers
CHARACTER SET "utf8"
COLUMNS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY ''
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(idPrinter, priName, priWidth, priHeight, priLength, priWeight, priPrintSpeed, priScanRes, priSales, idBrands, idSupplier, idConsumable);

LOAD DATA
INFILE '<YOUR PATH>//VJLF-306//docs//db//prices.csv'
INTO TABLE t_prices
CHARACTER SET "utf8"
COLUMNS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY ''
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(idPrice, idPrinter, priDate, priValue);
```
