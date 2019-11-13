-- *********************************************
-- * SQL MySQL generation                      
-- *--------------------------------------------
-- * DB-MAIN version: 11.0.1              
-- * Generator date: Dec  4 2018              
-- * Generation date: Tue Nov 12 11:58:44 2019 
-- * Schema: MLD 
-- ********************************************* 


-- Database Section
-- ________________ 

create database TopPrinters;
use TopPrinters;


-- Tables Section
-- _____________ 

create table t_consumables (
     idConsumable int not null auto_increment,
     csbName varchar(50) not null,
     csbDescription text,
     csbPrice int not null,
     constraint ID_t_consumables_ID primary key (idConsumable));

create table t_supplier (
     idSupplier int not null auto_increment,
     supName varchar(50) not null,
     constraint ID_t_supplier_ID primary key (idSupplier));

create table t_consumes (
     idConsumable int not null,
     idPrinter int not null,
     constraint ID_consumes_ID primary key (idPrinter, idConsumable));

create table t_costs (
     idPrice int not null,
     idPrinter int not null,
     constraint ID_costs_ID primary key (idPrinter, idPrice));

create table t_supplies (
     idPrinter int not null,
     idSupplier int not null,
     constraint ID_supplies_ID primary key (idPrinter, idSupplier));

create table t_printers (
     idPrinter int not null auto_increment,
     priName varchar(50) not null,
     priWidth int not null,
     priHeight int not null,
     priLength int not null,
     priWeight int not null,
     priPrintSpeed int not null,
     priScanRes int not null,
     priSales int not null,
     idBrands int not null,
     constraint ID_t_printers_ID primary key (idPrinter));

create table t_constructors (
     idConstructor int not null auto_increment,
     conName varchar(50) not null,
     constraint ID_t_constructors_ID primary key (idConstructor));

create table t_brands (
     idBrands int not null auto_increment,
     braName varchar(50) not null,
     idConstructor int not null,
     constraint ID_t_brands_ID primary key (idBrands));

create table t_prices (
     idPrice int not null auto_increment,
     priDate date not null,
     priValue char(1) not null,
     constraint ID_t_prices_ID primary key (idPrice));


-- Constraints Section
-- ___________________ 

alter table t_consumes add constraint FKcon_t_p
     foreign key (idPrinter)
     references t_printers (idPrinter);

alter table t_consumes add constraint FKcon_t_c_FK
     foreign key (idConsumable)
     references t_consumables (idConsumable);

alter table t_costs add constraint FKcos_t_p_1
     foreign key (idPrinter)
     references t_printers (idPrinter);

alter table t_costs add constraint FKcos_t_p_FK
     foreign key (idPrice)
     references t_prices (idPrice);

alter table t_supplies add constraint FKsup_t_s_FK
     foreign key (idSupplier)
     references t_supplier (idSupplier);

alter table t_supplies add constraint FKsup_t_p
     foreign key (idPrinter)
     references t_printers (idPrinter);

-- Not implemented
-- alter table t_printers add constraint ID_t_printers_CHK
--     check(exists(select * from t_costs
--                  where t_costs.idPrinter = idPrinter)); 

-- Not implemented
-- alter table t_printers add constraint ID_t_printers_CHK
--     check(exists(select * from t_supplies
--                  where t_supplies.idPrinter = idPrinter)); 

alter table t_printers add constraint FKisBranded_FK
     foreign key (idBrands)
     references t_brands (idBrands);

alter table t_brands add constraint FKisConstructedBy_FK
     foreign key (idConstructor)
     references t_constructors (idConstructor);


-- Index Section
-- _____________ 

create unique index ID_t_consumables_IND
     on t_consumables (idConsumable);

create unique index ID_t_supplier_IND
     on t_supplier (idSupplier);

create unique index ID_consumes_IND
     on t_consumes (idPrinter, idConsumable);

create index FKcon_t_c_IND
     on t_consumes (idConsumable);

create unique index ID_costs_IND
     on t_costs (idPrinter, idPrice);

create index FKcos_t_p_IND
     on t_costs (idPrice);

create unique index ID_supplies_IND
     on t_supplies (idPrinter, idSupplier);

create index FKsup_t_s_IND
     on t_supplies (idSupplier);

create unique index ID_t_printers_IND
     on t_printers (idPrinter);

create index FKisBranded_IND
     on t_printers (idBrands);

create unique index ID_t_constructors_IND
     on t_constructors (idConstructor);

create unique index ID_t_brands_IND
     on t_brands (idBrands);

create index FKisConstructedBy_IND
     on t_brands (idConstructor);

create unique index ID_t_prices_IND
     on t_prices (idPrice);

