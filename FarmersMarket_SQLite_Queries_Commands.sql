
/*ACTUAL CODE -- BEGIN*/

/*step1: create db and table*/

/*Sumas-MacBook-Pro:Final Project sumavenugopal$ sqlite3 farmersmarket.db

 on the terminal type (below query generated from openrefine)*/

CREATE TABLE US_Farmers_Market_Complete (
FMID VARCHAR(255) NULL,
MarketName VARCHAR(255) NULL,
Website VARCHAR(255) NULL,
Facebook VARCHAR(255) NULL,
Twitter VARCHAR(255) NULL,
Youtube VARCHAR(255) NULL,
OtherMedia VARCHAR(255) NULL,
street VARCHAR(255) NULL,
city VARCHAR(255) NULL,
CityName VARCHAR(255) NULL,
County VARCHAR(255) NULL,
State VARCHAR(255) NULL,
zip VARCHAR(255) NULL,
Season1Date VARCHAR(255) NULL,
Season1Time VARCHAR(255) NULL,
Season2Date VARCHAR(255) NULL,
Season2Time VARCHAR(255) NULL,
x VARCHAR(255) NULL,
y VARCHAR(255) NULL,
Location VARCHAR(255) NULL,
Credit VARCHAR(255) NULL,
WIC VARCHAR(255) NULL,
WICcash VARCHAR(255) NULL,
SFMNP VARCHAR(255) NULL,
SNAP VARCHAR(255) NULL,
Organic VARCHAR(255) NULL,
Bakedgoods VARCHAR(255) NULL,
Cheese VARCHAR(255) NULL,
Crafts VARCHAR(255) NULL,
Flowers VARCHAR(255) NULL,
Eggs VARCHAR(255) NULL,
Seafood VARCHAR(255) NULL,
Herbs VARCHAR(255) NULL,
Vegetables VARCHAR(255) NULL,
Honey VARCHAR(255) NULL,
Jams VARCHAR(255) NULL,
Maple VARCHAR(255) NULL,
Meat VARCHAR(255) NULL,
Nursery VARCHAR(255) NULL,
Nuts VARCHAR(255) NULL,
Plants VARCHAR(255) NULL,
Poultry VARCHAR(255) NULL,
Prepared VARCHAR(255) NULL,
Soap VARCHAR(255) NULL,
Trees VARCHAR(255) NULL,
Wine VARCHAR(255) NULL,
Coffee VARCHAR(255) NULL,
Beans VARCHAR(255) NULL,
Fruits VARCHAR(255) NULL,
Grains VARCHAR(255) NULL,
Juices VARCHAR(255) NULL,
Mushrooms VARCHAR(255) NULL,
PetFood VARCHAR(255) NULL,
Tofu VARCHAR(255) NULL,
WildHarvested VARCHAR(255) NULL,
updateTime VARCHAR(255) NULL,
YearLastUpdated VARCHAR(255) NULL,
TotalProductTypesSold VARCHAR(255) NULL,
TotalPymtTypesAccptd VARCHAR(255) NULL,
IsCandidate VARCHAR(255) NULL
);

/*step2: Remove header from Openrefine o/p csv file of the same layout as above query
 and name it FarmersMarket_OpenRefine.csv*/

/*step3: Bulk upload csv to created table*/

sqlite> .mode csv  note: -->>>>(no ; needed)
sqlite> .import FarmersMarket_OpenRefine.csv US_Farmers_Market_Complete   note: -->>>>(no ; needed)

select count(*) from US_Farmers_Market_Complete; -- 8771

/*Creating and Loading Individual tables per designed ER schema*/
CREATE TABLE FarmersMarketMain
(FMID INT PRIMARY KEY NOT NULL,
MarketName VARCHAR NOT NULL,
Website VARCHAR ,
YearLastUpdated VARCHAR,
TotalProductTypesSold INT NOT NULL,
TotalPymtTypesAccptd INT NOT NULL
);

INSERT INTO FarmersMarketMain (FMID, MarketName,Website,YearLastUpdated,TotalProductTypesSold,TotalPymtTypesAccptd)
select FMID, MarketName,Website,YearLastUpdated,TotalProductTypesSold,TotalPymtTypesAccptd
FROM  US_Farmers_Market_Complete;


CREATE TABLE ProductCategory (
ProductCategoryID INT PRIMARY KEY NOT NULL,
ProductCategory VARCHAR(20) NOT NULL);

INSERT INTO ProductCategory VALUES
(1,'Organic'),
(2,'Bakedgoods'),
(3,'Cheese'),
(4,'Crafts'),
(5,'Flowers'),
(6,'Eggs'),
(7,'Seafood'),
(8,'Herbs'),
(9,'Vegetables'),
(10,'Honey'),
(11,'Jams'),
(12,'Maple'),
(13,'Meat'),
(14,'Nursery'),
(15,'Nuts'),
(16,'Plants'),
(17,'Poultry'),
(18,'Prepared'),
(19,'Soap'),
(20,'Trees'),
(21,'Wine'),
(22,'Coffee'),
(23,'Beans'),
(24,'Fruits'),
(25,'Grains'),
(26,'Juices'),
(27,'Mushrooms'),
(28,'PetFood'),
(29,'Tofu'),
(30,'WildHarvested');


CREATE TABLE ProductOfferings
(FMID INT NOT NULL,
ProductCategoryID INT NOT NULL,
ProductOfferedOrNot INT NOT NULL,
PRIMARY KEY (FMID, ProductCategoryID )
);

INSERT INTO ProductOfferings (FMID, ProductCategoryID,ProductOfferedOrNot)
select FMID, (select ProductCategoryID from ProductCategory where ProductCategory = 'Organic'), Organic
FROM  US_Farmers_Market_Complete;


INSERT INTO ProductOfferings (FMID, ProductCategoryID,ProductOfferedOrNot)
select FMID, (select ProductCategoryID from ProductCategory where ProductCategory = 'Bakedgoods'), Bakedgoods
FROM  US_Farmers_Market_Complete;

INSERT INTO ProductOfferings (FMID, ProductCategoryID,ProductOfferedOrNot)
select FMID, (select ProductCategoryID from ProductCategory where ProductCategory = 'Cheese'), Cheese
FROM  US_Farmers_Market_Complete;

INSERT INTO ProductOfferings (FMID, ProductCategoryID,ProductOfferedOrNot)
select FMID, (select ProductCategoryID from ProductCategory where ProductCategory = 'Crafts'), Crafts
FROM  US_Farmers_Market_Complete;

INSERT INTO ProductOfferings (FMID, ProductCategoryID,ProductOfferedOrNot)
select FMID, (select ProductCategoryID from ProductCategory where ProductCategory = 'Flowers'), Flowers
FROM  US_Farmers_Market_Complete;

INSERT INTO ProductOfferings (FMID, ProductCategoryID,ProductOfferedOrNot)
select FMID, (select ProductCategoryID from ProductCategory where ProductCategory = 'Eggs'), Eggs
FROM  US_Farmers_Market_Complete;

INSERT INTO ProductOfferings (FMID, ProductCategoryID,ProductOfferedOrNot)
select FMID, (select ProductCategoryID from ProductCategory where ProductCategory = 'Seafood'), Seafood
FROM  US_Farmers_Market_Complete;


INSERT INTO ProductOfferings (FMID, ProductCategoryID,ProductOfferedOrNot)
select FMID, (select ProductCategoryID from ProductCategory where ProductCategory = 'Herbs'), Herbs
FROM  US_Farmers_Market_Complete;

INSERT INTO ProductOfferings (FMID, ProductCategoryID,ProductOfferedOrNot)
select FMID, (select ProductCategoryID from ProductCategory where ProductCategory = 'Vegetables'), Vegetables
FROM  US_Farmers_Market_Complete;

INSERT INTO ProductOfferings (FMID, ProductCategoryID,ProductOfferedOrNot)
select FMID, (select ProductCategoryID from ProductCategory where ProductCategory = 'Honey'), Honey
FROM  US_Farmers_Market_Complete;

INSERT INTO ProductOfferings (FMID, ProductCategoryID,ProductOfferedOrNot)
select FMID, (select ProductCategoryID from ProductCategory where ProductCategory = 'Jams'), Jams
FROM  US_Farmers_Market_Complete;

INSERT INTO ProductOfferings (FMID, ProductCategoryID,ProductOfferedOrNot)
select FMID, (select ProductCategoryID from ProductCategory where ProductCategory = 'Maple'), Maple
FROM  US_Farmers_Market_Complete;

INSERT INTO ProductOfferings (FMID, ProductCategoryID,ProductOfferedOrNot)
select FMID, (select ProductCategoryID from ProductCategory where ProductCategory = 'Meat'), Meat
FROM  US_Farmers_Market_Complete;

INSERT INTO ProductOfferings (FMID, ProductCategoryID,ProductOfferedOrNot)
select FMID, (select ProductCategoryID from ProductCategory where ProductCategory = 'Nursery'), Nursery
FROM  US_Farmers_Market_Complete;

INSERT INTO ProductOfferings (FMID, ProductCategoryID,ProductOfferedOrNot)
select FMID, (select ProductCategoryID from ProductCategory where ProductCategory = 'Nuts'), Nuts
FROM  US_Farmers_Market_Complete;

INSERT INTO ProductOfferings (FMID, ProductCategoryID,ProductOfferedOrNot)
select FMID, (select ProductCategoryID from ProductCategory where ProductCategory = 'Plants'), Plants
FROM  US_Farmers_Market_Complete;

INSERT INTO ProductOfferings (FMID, ProductCategoryID,ProductOfferedOrNot)
select FMID, (select ProductCategoryID from ProductCategory where ProductCategory = 'Poultry'), Poultry
FROM  US_Farmers_Market_Complete;

INSERT INTO ProductOfferings (FMID, ProductCategoryID,ProductOfferedOrNot)
select FMID, (select ProductCategoryID from ProductCategory where ProductCategory = 'Prepared'), Prepared
FROM  US_Farmers_Market_Complete;

INSERT INTO ProductOfferings (FMID, ProductCategoryID,ProductOfferedOrNot)
select FMID, (select ProductCategoryID from ProductCategory where ProductCategory = 'Soap'), Soap
FROM  US_Farmers_Market_Complete;

INSERT INTO ProductOfferings (FMID, ProductCategoryID,ProductOfferedOrNot)
select FMID, (select ProductCategoryID from ProductCategory where ProductCategory = 'Trees'), Trees
FROM  US_Farmers_Market_Complete;

INSERT INTO ProductOfferings (FMID, ProductCategoryID,ProductOfferedOrNot)
select FMID, (select ProductCategoryID from ProductCategory where ProductCategory = 'Wine'), Wine
FROM  US_Farmers_Market_Complete;

INSERT INTO ProductOfferings (FMID, ProductCategoryID,ProductOfferedOrNot)
select FMID, (select ProductCategoryID from ProductCategory where ProductCategory = 'Coffee'), Coffee
FROM  US_Farmers_Market_Complete;

INSERT INTO ProductOfferings (FMID, ProductCategoryID,ProductOfferedOrNot)
select FMID, (select ProductCategoryID from ProductCategory where ProductCategory = 'Beans'), Beans
FROM  US_Farmers_Market_Complete;

INSERT INTO ProductOfferings (FMID, ProductCategoryID,ProductOfferedOrNot)
select FMID, (select ProductCategoryID from ProductCategory where ProductCategory = 'Fruits'), Fruits
FROM  US_Farmers_Market_Complete;

INSERT INTO ProductOfferings (FMID, ProductCategoryID,ProductOfferedOrNot)
select FMID, (select ProductCategoryID from ProductCategory where ProductCategory = 'Grains'), Grains
FROM  US_Farmers_Market_Complete;

INSERT INTO ProductOfferings (FMID, ProductCategoryID,ProductOfferedOrNot)
select FMID, (select ProductCategoryID from ProductCategory where ProductCategory = 'Juices'), Juices
FROM  US_Farmers_Market_Complete;

INSERT INTO ProductOfferings (FMID, ProductCategoryID,ProductOfferedOrNot)
select FMID, (select ProductCategoryID from ProductCategory where ProductCategory = 'Mushrooms'), Mushrooms
FROM  US_Farmers_Market_Complete;


INSERT INTO ProductOfferings (FMID, ProductCategoryID,ProductOfferedOrNot)
select FMID, (select ProductCategoryID from ProductCategory where ProductCategory = 'PetFood'), PetFood
FROM  US_Farmers_Market_Complete;

INSERT INTO ProductOfferings (FMID, ProductCategoryID,ProductOfferedOrNot)
select FMID, (select ProductCategoryID from ProductCategory where ProductCategory = 'Tofu'), Tofu
FROM  US_Farmers_Market_Complete;

INSERT INTO ProductOfferings (FMID, ProductCategoryID,ProductOfferedOrNot)
select FMID, (select ProductCategoryID from ProductCategory where ProductCategory = 'WildHarvested'), WildHarvested
FROM  US_Farmers_Market_Complete;



CREATE TABLE FarmersMarketSupp
(FMID INT PRIMARY KEY NOT NULL,
MarketName VARCHAR NOT NULL,
UpdateTime VARCHAR,
IsCandidate INT NOT NULL
);



INSERT INTO  FarmersMarketSupp (FMID, MarketName,UpdateTime,IsCandidate)
select FMID, MarketName,updateTime,IsCandidate
FROM  US_Farmers_Market_Complete;


CREATE TABLE LocationType
(LocationTypeID INTEGER PRIMARY KEY AUTOINCREMENT,
LocationType VARCHAR NOT NULL
);

INSERT INTO LocationType (LocationType)
SELECT DISTINCT Location from US_Farmers_Market_Complete WHERE Location <> '';


CREATE TABLE State
(StateID INTEGER PRIMARY KEY AUTOINCREMENT,
State VARCHAR NOT NULL
);

INSERT INTO State (State)
SELECT DISTINCT State from US_Farmers_Market_Complete WHERE State <> '';



CREATE TABLE FarmersMarketLoc
(FMID INT PRIMARY KEY NOT NULL,
LocationTypeID INTEGER NOT NULL,
Latitude REAL,
Longitude REAL,
Street VARCHAR,
City VARCHAR,
County VARCHAR,
State CHAR (2) NOT NULL,
Zip CHAR(10) NOT NULL
);

INSERT INTO  FarmersMarketLoc
SELECT FMID, Location,y,x,Street,CityName,County,State,zip
FROM  US_Farmers_Market_Complete;

CREATE TABLE PaymentTypes (
FMID INTEGER PRIMARY KEY ,
Credit INT NOT NULL,
WIC INT NOT NULL,
WICCash INT NOT NULL,
SFMNP INT NOT NULL,
SNAP INT NOT NULL
);

INSERT INTO PaymentTypes
SELECT FMID, Credit, WIC, WICcash, SFMNP, SNAP
FROM  US_Farmers_Market_Complete;

CREATE TABLE OperatingTimes (
FMID INTEGER PRIMARY KEY ,
Season1Date VARCHAR,
Season1Time VARCHAR,
Season2Date VARCHAR,
Season2Time VARCHAR
);

INSERT INTO OperatingTimes
SELECT FMID, Season1Date, Season1Time, Season2Date, Season2Time
FROM  US_Farmers_Market_Complete;

DELETE from OperatingTimes where
 Season1Date='' and Season1Time='' and  Season2Date='' and  Season2Time='';


CREATE TABLE SocialMedia (
FMID INTEGER PRIMARY KEY ,
Facebook VARCHAR,
Twitter VARCHAR,
Youtube VARCHAR,
OtherMedia VARCHAR
);

INSERT INTO SocialMedia
SELECT FMID, Facebook, Twitter, Youtube, OtherMedia
FROM  US_Farmers_Market_Complete;

select supp.* from FarmersMarketSupp supp, FarmersMarketMain main
WHERE supp.FMID = main.FMID and
main.YearLastUpdated = 2019 and
main.TotalProductTypesSold >= 12 and
main.TotalPymtTypesAccptd >= 3 and
main.Website = '';


select FMID,MarketName from FarmersMarketSupp where IsCandidate = '1';

---------

/*Data profiling and IC checks*/

select count(*) from FarmersMarketMain;

select count(distinct FMID) from FarmersMarketMain;

select count (*) from ProductOfferings;

select count(*) from FarmersMarketLoc;

select count(*) from OperatingTimes;

select count(*) from PaymentTypes;

select count(ProductCategoryID) from ProductOfferings WHERE
ProductCategoryID not in
(select distinct ProductCategoryID from ProductCategory);
