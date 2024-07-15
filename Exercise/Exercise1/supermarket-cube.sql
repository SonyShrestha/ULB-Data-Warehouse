SET DATEFORMAT dmy;

CREATE TABLE Date (
	Date Date NOT NULL PRIMARY KEY,
	Weekday char(10) NULL,
	Month char(10) NULL,
	Semester int NULL,
	Year int NULL
);

CREATE TABLE Product (
	ProductID bigint NOT NULL PRIMARY KEY,
	Brand char(10) NULL,
	Type char(10) NULL,
);

CREATE TABLE Sales (
	ProductID bigint NOT NULL,
	StoreID bigint NOT NULL,
	Date date NOT NULL,
	Amount bigint NULL,
    PRIMARY KEY (ProductID, StoreID, Date)
);

CREATE TABLE Store (
	StoreID bigint NOT NULL PRIMARY KEY,
	Province char(20) NULL,
	Country char(20) NULL
);

GO

CREATE VIEW Cube AS 
SELECT P.ProductID, Brand, S.StoreID, Province, Country, D.Date, 
      Weekday, Month, Semester, Year, SUM(Amount) AS Total, AVG(amount) AS Average
FROM Product P, Store S, Date D, Sales Sa
WHERE P.ProductID = SA.ProductID and S.StoreID = Sa.StoreID and D.Date = Sa.Date
GROUP BY ROLLUP(Brand, P.ProductID), ROLLUP(Country, Province, S.StoreID), 
         ROLLUP(Year, Semester, Month, D.Date), ROLLUP(Weekday, D.Date);

GO

INSERT Date (Date, Weekday, Month, Semester, Year) VALUES 
('01/01/2015', 'Thursday', 'January', 1, 2015), 
('01/02/2015', 'Sunday', 'February', 1, 2015),
('01/03/2016', 'Tuesday', 'March', 2, 2016),
('02/01/2015', 'Friday', 'January', 1, 2015),
('20/07/2015', 'Monday', 'July', 2, 2015),
('29/09/2015', 'Tuesday', 'September', 1, 2015);

INSERT Product (ProductID, Brand, Type) VALUES
(1, 'A', '1'), 
(2, 'B', '1'), 
(3, 'A', '2'), 
(4, 'A', '3'), 
(5, 'C', '3');

INSERT Sales (ProductID, StoreID, Date, Amount) VALUES
(1, 1, '01/01/2015', 5),
(1, 2, '01/01/2015', 15),
(1, 2, '01/03/2016', 2),
(1, 3, '01/02/2015', 10),
(2, 1, '01/01/2015', 3),
(2, 2, '01/01/2015', 20),
(2, 3, '29/09/2015', 15),
(3, 1, '01/01/2015', 7),
(3, 2, '01/02/2015', 5);

INSERT Store (StoreID, Province, Country) VALUES
(1, 'Antwerp', 'Belgium'),
(2, 'Brussels', 'Belgium'),
(3, 'North Brabant', 'Netherlands');
