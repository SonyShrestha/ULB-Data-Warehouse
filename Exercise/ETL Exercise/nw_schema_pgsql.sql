
/****** Table Customers ******/
CREATE TABLE Customers(
	CustomerID char(5) NOT NULL,
	CompanyName varchar(40) NOT NULL,
	ContactName varchar(30) NULL,
	ContactTitle varchar(30) NULL,
	Address varchar(60) NULL,
	City varchar(15) NULL,
	Region varchar(15) NULL,
	PostalCode varchar(10) NULL,
	Country varchar(15) NULL,
	Phone varchar(24) NULL,
	Fax varchar(24) NULL,
	CONSTRAINT PK_Customers PRIMARY KEY (CustomerID)
);

/****** Table Suppliers ******/
CREATE TABLE Suppliers(
	SupplierID SERIAL NOT NULL,
	CompanyName varchar(40) NOT NULL,
	ContactName varchar(30) NULL,
	ContactTitle varchar(30) NULL,
	Address varchar(60) NULL,
	City varchar(15) NULL,
	Region varchar(15) NULL,
	PostalCode varchar(10) NULL,
	Country varchar(15) NULL,
	Phone varchar(24) NULL,
	Fax varchar(24) NULL,
	HomePage text NULL,
	CONSTRAINT PK_Suppliers PRIMARY KEY (SupplierID)
);

/****** Table Products ******/
CREATE TABLE Products(
	ProductID SERIAL NOT NULL,
	ProductName varchar(40) NOT NULL,
	SupplierID int NULL,
	CategoryID int NULL,
	QuantityPerUnit varchar(20) NULL,
	UnitPrice money NULL DEFAULT (0)  CHECK (UnitPrice >= 0::money),
	UnitsInStock int NULL DEFAULT (0) CHECK (UnitsInStock >= 0),
	UnitsOnOrder int NULL DEFAULT (0) CHECK (UnitsOnOrder >= 0),
	ReorderLevel int NULL DEFAULT (0) CHECK (ReorderLevel >= 0),
	Discontinued smallint NOT NULL DEFAULT (0),
	CONSTRAINT PK_Products PRIMARY KEY (ProductID)
);

/****** Table Categories ******/
CREATE TABLE Categories(
	CategoryID SERIAL NOT NULL,
	CategoryName varchar(15) NOT NULL,
	Description text NULL,
	-- Picture image NULL,
	CONSTRAINT PK_Categories PRIMARY KEY (CategoryID)
);

/****** Table Orders ******/
CREATE TABLE Orders(
	OrderID SERIAL NOT NULL,
	CustomerID char(5) NULL,
	EmployeeID int NULL,
	OrderDate date NULL,
	RequiredDate date NULL,
	ShippedDate date NULL,
	ShipVia int NULL,
	Freight money NULL DEFAULT (0),
	ShipName varchar(40) NULL,
	ShipAddress varchar(60) NULL,
	ShipCity varchar(15) NULL,
	ShipRegion varchar(15) NULL,
	ShipPostalCode varchar(10) NULL,
	ShipCountry varchar(15) NULL,
	CONSTRAINT PK_Orders PRIMARY KEY (OrderID)
);

/****** Table Employees ******/
CREATE TABLE Employees(
	EmployeeID SERIAL NOT NULL,
	LastName varchar(20) NOT NULL,
	FirstName varchar(10) NOT NULL,
	Title varchar(30) NULL,
	TitleOfCourtesy varchar(25) NULL,
	BirthDate date NULL CHECK (BirthDate < now()),
	HireDate date NULL,
	Address varchar(60) NULL,
	City varchar(15) NULL,
	Region varchar(15) NULL,
	PostalCode varchar(10) NULL,
	Country varchar(15) NULL,
	HomePhone varchar(24) NULL,
	Extension varchar(4) NULL,
	-- Photo image NULL,
	Notes text NULL,
	ReportsTo int NULL,
	PhotoPath varchar(255) NULL,
	CONSTRAINT PK_Employees PRIMARY KEY (EmployeeID)
);

/****** Table Shippers ******/
CREATE TABLE Shippers(
	ShipperID SERIAL NOT NULL,
	CompanyName varchar(40) NOT NULL,
	Phone varchar(24) NULL,
	CONSTRAINT PK_Shippers PRIMARY KEY (ShipperID)
);

/****** Table CustomerCustomerDemo ******/
CREATE TABLE CustomerCustomerDemo(
	CustomerID char(5) NOT NULL,
	CustomerTypeID char(10) NOT NULL,
	CONSTRAINT PK_CustomerCustomerDemo PRIMARY KEY (CustomerID, CustomerTypeID)
);

/****** Table CustomerDemographics ******/
CREATE TABLE CustomerDemographics(
	CustomerTypeID char(10) NOT NULL,
	CustomerDesc text NULL,
	CONSTRAINT PK_CustomerDemographics PRIMARY KEY (CustomerTypeID)
);

/****** Table EmployeeTerritories ******/
CREATE TABLE EmployeeTerritories(
	EmployeeID int NOT NULL,
	TerritoryID varchar(20) NOT NULL,
	CONSTRAINT PK_EmployeeTerritories PRIMARY KEY (EmployeeID, TerritoryID)
);

/****** Table OrderDetails ******/
CREATE TABLE OrderDetails(
	OrderID int NOT NULL,
	ProductID int NOT NULL,
	UnitPrice money NOT NULL DEFAULT (0) CHECK (UnitPrice >= 0::money),
	Quantity int NOT NULL DEFAULT (1) CHECK (Quantity > 0),
	Discount real NOT NULL DEFAULT (0) CHECK (Discount >= 0 and Discount <= 1),
	CONSTRAINT PK_Order_Details PRIMARY KEY (OrderID, ProductID)
);

/****** Table Region ******/
CREATE TABLE Region(
	RegionID int NOT NULL,
	RegionDescription char(50) NOT NULL,
	CONSTRAINT PK_Region PRIMARY KEY (RegionID)
);

/****** Table Territories ******/
CREATE TABLE Territories(
	TerritoryID varchar(20) NOT NULL,
	TerritoryDescription char(50) NOT NULL,
	RegionID int NOT NULL,
	CONSTRAINT PK_Territories PRIMARY KEY (TerritoryID)
);

ALTER TABLE CustomerCustomerDemo ADD CONSTRAINT FK_CustomerCustomerDemo FOREIGN KEY(CustomerTypeID)
REFERENCES CustomerDemographics (CustomerTypeID);

ALTER TABLE CustomerCustomerDemo ADD CONSTRAINT FK_CustomerCustomerDemo_Customers FOREIGN KEY(CustomerID)
REFERENCES Customers (CustomerID);

ALTER TABLE Employees ADD CONSTRAINT FK_Employees_Employees FOREIGN KEY(ReportsTo)
REFERENCES Employees (EmployeeID);

ALTER TABLE EmployeeTerritories ADD CONSTRAINT FK_EmployeeTerritories_Employees FOREIGN KEY(EmployeeID)
REFERENCES Employees (EmployeeID);

ALTER TABLE EmployeeTerritories ADD CONSTRAINT FK_EmployeeTerritories_Territories FOREIGN KEY(TerritoryID)
REFERENCES Territories (TerritoryID);

ALTER TABLE OrderDetails ADD CONSTRAINT FK_Order_Details_Orders FOREIGN KEY(OrderID)
REFERENCES Orders (OrderID);

ALTER TABLE OrderDetails ADD CONSTRAINT FK_Order_Details_Products FOREIGN KEY(ProductID)
REFERENCES Products (ProductID);

ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Customers FOREIGN KEY(CustomerID)
REFERENCES Customers (CustomerID);

ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Employees FOREIGN KEY(EmployeeID)
REFERENCES Employees (EmployeeID);

ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Shippers FOREIGN KEY(ShipVia)
REFERENCES Shippers (ShipperID);

ALTER TABLE Products ADD CONSTRAINT FK_Products_Categories FOREIGN KEY(CategoryID)
REFERENCES Categories (CategoryID);

ALTER TABLE Products ADD CONSTRAINT FK_Products_Suppliers FOREIGN KEY(SupplierID)
REFERENCES Suppliers (SupplierID);

ALTER TABLE Territories ADD CONSTRAINT FK_Territories_Region FOREIGN KEY(RegionID)
REFERENCES Region (RegionID);


