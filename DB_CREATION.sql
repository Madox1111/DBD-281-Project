CREATE DATABASE NutShop2
ON	--DataBase creation
(NAME = NutShopDataFile1,
FILENAME ='C:\DataBase\NutShopDataFile12.mdf',
SIZE = 5MB,
MAXSIZE = UNLIMITED,
FILEGROWTH = 10%)


LOG ON
(NAME = NutShopLogFile1,
FILENAME = 'C:\DataBase\NutShopLogFile12.ldf',
SIZE = 5MB,
MAXSIZE = UNLIMITED,
FILEGROWTH = 10MB)

GO
CREATE TABLE Shop  --Table creation
(Nr					INT			IDENTITY(1,1)			PRIMARY KEY,
Address				VARCHAR(20)	NOT NULL,
DateOpened			DATETIME	DEFAULT(getdate())
)

CREATE TABLE Employee
(ID					INT			IDENTITY(1,1)			PRIMARY KEY,
Name				VARCHAR(20)	NOT NULL,
LastName			VARCHAR(20) NOT NULL,
Age					INT			CHECK(age BETWEEN 18 and 65),
DateHired			DATETIME	DEFAULT(getdate()),
ShopNr				INT			REFERENCES Shop(Nr),
Address				VARCHAR(30)	NOT NULL,
PhoneNumber			VARCHAR(10)	NOT NULL				UNIQUE
)

CREATE TABLE Orders
(OrderID			INT			IDENTITY(1,1)			PRIMARY KEY,
OrderDate			DATETIME	DEFAULT(getdate()),
ShopNr				INT			REFERENCES Shop(Nr),
CustomerNr			INT			NOT NULL	UNIQUE 
)

CREATE TABLE OrderItem
(OrderItemID		INT			IDENTITY(1,1)			PRIMARY KEY,
ItemNumber			INT			NOT NULL  UNIQUE,
OrderID				INT			REFERENCES Orders(OrderID),
)

CREATE TABLE Item
(ItemNumber			INT			REFERENCES OrderItem(ItemNumber)	PRIMARY KEY,
Description			VARCHAR(50),	
Size				VARCHAR(2),
Type				VARCHAR(20),
StockLeft			INT,

)

CREATE TABLE CUSTOMER
(CustomerNr			INT			REFERENCES Orders(CustomerNr)	PRIMARY KEY,
Name				VARCHAR(20) NOT NULL,
Surname				VARCHAR(20) NOT NULL,
Street				VARCHAR(20)	NOT NULL,
City				VARCHAR(20) NOT NULL
)

GO																			--Sample Data
INSERT INTO Employee (Name, LastName, Age, ShopNr, Address, PhoneNumber)
VALUES ('Dave', 'Brown', 20, 6, 'Pretoria', '0894568523');

INSERT INTO Employee (Name, LastName, Age, ShopNr, Address, PhoneNumber)
VALUES ('Ethan', 'Smith', 21, 6, 'Pretoria', '0894568789');

INSERT INTO Employee (Name, LastName, Age, ShopNr, Address, PhoneNumber)
VALUES ('Brenda', 'Snyman', 35, 6, 'Pretoria', '0897564523');

INSERT INTO Employee (Name, LastName, Age, ShopNr, Address, PhoneNumber)
VALUES ('Shawn', 'Lee', 20, 6, 'Pretoria', '0894963223');

INSERT INTO Employee (Name, LastName, Age, ShopNr, Address, PhoneNumber)
VALUES ('Fredrik', 'Vettel', 19, 6, 'Pretoria', '0824741523');


INSERT INTO Orders(ShopNr, CustomerNr)
VALUES (6, 1);

INSERT INTO Orders(ShopNr, CustomerNr)
VALUES (6, 2);

INSERT INTO Orders(ShopNr, CustomerNr)
VALUES (6, 3);

INSERT INTO Orders(ShopNr, CustomerNr)
VALUES (6, 4);

INSERT INTO Orders(ShopNr, CustomerNr)
VALUES (6, 5);

INSERT INTO Orders(ShopNr, CustomerNr)
VALUES (6, 6);

INSERT INTO Orders(ShopNr, CustomerNr)
VALUES (6, 7);

INSERT INTO Orders(ShopNr, CustomerNr)
VALUES (6, 8);

INSERT INTO Orders(ShopNr, CustomerNr)
VALUES (6, 9);

INSERT INTO Orders(ShopNr, CustomerNr)
VALUES (6, 10);


INSERT INTO OrderItem (ItemNumber, OrderID)
VALUES (10,9);

INSERT INTO OrderItem (ItemNumber, OrderID)
VALUES (20,1);

INSERT INTO OrderItem (ItemNumber, OrderID)
VALUES (30,5);

INSERT INTO OrderItem (ItemNumber, OrderID)
VALUES (40,7);

INSERT INTO OrderItem (ItemNumber, OrderID)
VALUES (50,8);

INSERT INTO OrderItem (ItemNumber, OrderID)
VALUES (60,2);

INSERT INTO OrderItem (ItemNumber, OrderID)
VALUES (70,4);

INSERT INTO OrderItem (ItemNumber, OrderID)
VALUES (80,6);

INSERT INTO OrderItem (ItemNumber, OrderID)
VALUES (90,3);

INSERT INTO OrderItem (ItemNumber, OrderID)
VALUES (100,10);



INSERT INTO Item(ItemNumber, Description, Size, Type, StockLeft)
VALUES (10,'Almond', 'S', 'Roasted', 20);

INSERT INTO Item(ItemNumber, Description, Size, Type, StockLeft)
VALUES (20,'Almond', 'M', 'Roasted', 10);

INSERT INTO Item(ItemNumber, Description, Size, Type, StockLeft)
VALUES (30,'Almond', 'L', 'Roasted', 5);

INSERT INTO Item(ItemNumber, Description, Size, Type, StockLeft)
VALUES (40,'Almond', 'M', 'Raw', 12);

INSERT INTO Item(ItemNumber, Description, Size, Type, StockLeft)
VALUES (50,'Almond', 'L', 'Raw', 50);

INSERT INTO Item(ItemNumber, Description, Size, Type, StockLeft)
VALUES (60,'Cashews', 'S', 'Roasted', 25);

INSERT INTO Item(ItemNumber,Description, Size, Type, StockLeft)
VALUES (70,'Cashews', 'M', 'Roasted', 10);

INSERT INTO Item(ItemNumber, Description, Size, Type, StockLeft)
VALUES (80,'Cashews', 'L', 'Roasted', 15);

INSERT INTO Item(ItemNumber, Description, Size, Type, StockLeft)
VALUES (90,'Cashews', 'M', 'Raw', 30);

INSERT INTO Item(ItemNumber, Description, Size, Type, StockLeft)
VALUES (100,'Cashews', 'L', 'Raw', 40);



INSERT INTO CUSTOMER(CustomerNr, Name, Surname, Street, City)
VALUES (1, 'Fred', 'Hall', 'Malan Street', 'Hartbeespoort')

INSERT INTO CUSTOMER(CustomerNr, Name, Surname, Street, City)
VALUES (2, 'Jack', 'Fishback', 'Sarel Street', 'Skeerpoort')

INSERT INTO CUSTOMER(CustomerNr, Name, Surname, Street, City)
VALUES (3, 'Ingrid', 'Dick', 'Dolphin Street', 'Pretoria')

INSERT INTO CUSTOMER(CustomerNr, Name, Surname, Street, City)
VALUES (4, 'Twane', 'Meiring', 'Scott Street', 'Hartbeespoort')

INSERT INTO CUSTOMER(CustomerNr, Name, Surname, Street, City)
VALUES (5, 'Xander', 'Stroll', '18th Street', 'Kimberly')

INSERT INTO CUSTOMER(CustomerNr, Name, Surname, Street, City)
VALUES (6, 'Sara', 'Butt', 'Bull Street', 'Hartenbos')

INSERT INTO CUSTOMER(CustomerNr, Name, Surname, Street, City)
VALUES (7, 'Cathrin', 'White', 'James Street', 'Hartbeespoort')

INSERT INTO CUSTOMER(CustomerNr, Name, Surname, Street, City)
VALUES (8, 'Riaan', 'Potgieter', 'Kaarl Street', 'George')

INSERT INTO CUSTOMER(CustomerNr, Name, Surname, Street, City)
VALUES (9, 'Daniel', 'Kruger', 'Man Street', 'Melkbos')

INSERT INTO CUSTOMER(CustomerNr, Name, Surname, Street, City)
VALUES (10, 'Jan', 'Smit', 'Whale Street', 'Reebok')

GO													--Index creation
/*
CREATE NONCLUSTERED INDEX IN_Employee
ON	Employee(LastName, Age, DateHired, PhoneNumber)

CREATE NONCLUSTERED INDEX IN_Orders
ON Orders(OrderDate, CustomerNr)

CREATE NONCLUSTERED INDEX IN_OrderItem
ON OrderItem(ItemNumber)

CREATE NONCLUSTERED INDEX IN_Customer
ON CUSTOMER(Name, Surname)
*/
GO	--Login creation
/*
CREATE LOGIN BrendaS 
WITH PASSWORD = 'Pass1234'
CREATE USER BrendaS FOR LOGIN BrendaS

ALTER ROLE db_datareader
ADD MEMBER BrendaS

GRANT INSERT, UPDATE ON dbo.Employee TO BrendaS		--Grantion permission
*/
GO												-- Viewing the loction of the orders
/*
USE NutShop
SELECT  City
FROM CUSTOMER
WHERE City = 'Hartbeespoort'
*/
GO											-- Viewing employees over 20 for bigger tasks
/*
SELECT *
FROM Employee
WHERE Age > 20
*/
GO											--Creating view to check the amount of stock left
/*
CREATE VIEW vStockLeft
AS
SELECT ItemNumber, Description, Size, Type, StockLeft
FROM Item
WHERE StockLeft > 0
*/
GO											--Creating trigger to stop selling non existing stock
/*
CREATE TRIGGER trStock
ON Item
FOR UPDATE
AS
	BEGIN
		DECLARE @Stock INT
		SET @Stock = (SELECT StockLeft FROM inserted)
		IF @Stock  < 0
			BEGIN
				Print 'Sorry out of stock';
				ROLLBACK Transaction
			END
	END
	*/

GO														--backup
BACKUP DATABASE NutShop
TO DISK = 'C:\Backup\NutShop2.bak'
