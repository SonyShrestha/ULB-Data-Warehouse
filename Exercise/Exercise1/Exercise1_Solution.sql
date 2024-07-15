SELECT c.CategoryName,s.Country,count(1) as num_of_sales
  FROM [Northwind].[dbo].[Order Details] od
  INNER JOIN [Northwind].[dbo].[Products] p 
  ON od.ProductId=p.ProductId 
  INNER JOIN [Northwind].[dbo].[Suppliers] s 
  ON p.SupplierId=s.SupplierId
  INNER JOIN [Northwind].[dbo].[Categories] c
  ON c.CategoryID=p.CategoryID
  group by c.CategoryName,s.Country;


  select top 3 c.CategoryName from [Northwind].[dbo].[Order Details] od
  INNER JOIN [Northwind].[dbo].[Products] p 
  ON od.ProductId=p.ProductId 
  INNER JOIN [Northwind].[dbo].[Categories] c 
  on p.CategoryID=c.CategoryID
  group by c.CategoryName
  order by count(1) desc
  

  with cte as 
  (
   select top 3 c.CategoryID,c.CategoryName from [Northwind].[dbo].[Order Details] od
  INNER JOIN [Northwind].[dbo].[Products] p 
  ON od.ProductId=p.ProductId 
  INNER JOIN [Northwind].[dbo].[Categories] c 
  on p.CategoryID=c.CategoryID
  group by c.CategoryID,c.CategoryName
  order by count(1) desc
  ) 
  SELECT cte.CategoryName, s.Country,year(o.OrderDate) as year1,MONTH(o.OrderDate) as month1,count(1) as sales 
  FROM [Northwind].[dbo].[Order Details] od 
  INNER JOIN [Northwind].[dbo].[Orders] o
  ON od.OrderID=o.OrderID
  INNER JOIN [Northwind].[dbo].[Products] p
  ON od.ProductID=p.ProductID
  INNER JOIN [Northwind].[dbo].[Suppliers] s 
  ON p.SupplierId=s.SupplierId
  INNER JOIN cte 
  ON p.CategoryID=cte.CategoryID
  group by cte.CategoryName, s.Country,year(o.OrderDate),MONTH(o.OrderDate);




  select e.FirstName,e.LastName, YEAR(o.OrderDate) as year1,
  FORMAT(sum((1-Discount)*UnitPrice*Quantity),'C', 'en-us') as amount_sales
  from [Northwind].[dbo].[Order Details] od 
  INNER JOIN [Northwind].[dbo].[Orders] o
  ON od.OrderID=o.OrderID
  INNER JOIN [Northwind].[dbo].[Employees] e 
  ON o.EmployeeID=e.EmployeeID
  group by e.FirstName,e.LastName, YEAR(o.OrderDate); -- 54135.9401473999




  select MONTH(o.OrderDate) as month1,  
  FORMAT(sum((1-Discount)*UnitPrice*Quantity),'C', 'en-us') as amount_sales
  from [Northwind].[dbo].[Order Details] od 
  INNER JOIN [Northwind].[dbo].[Orders] o
  ON od.OrderID=o.OrderID
  INNER JOIN [Northwind].[dbo].[Employees] e 
  ON o.EmployeeID=e.EmployeeID
 WHERE e.EmployeeID=9 AND YEAR(o.OrderDate)=1997
 GROUP BY MONTH(o.OrderDate)



SELECT s.Country, YEAR(o.OrderDate) as year1,MONTH(o.OrderDate) as month1, 
FORMAT(sum((1-Discount)*od.UnitPrice*Quantity),'C', 'en-us') as amount_sales
  FROM [Northwind].[dbo].[Order Details] od
  INNER JOIN [Northwind].[dbo].[Orders] o 
  ON od.OrderID=o.OrderID
  INNER JOIN [Northwind].[dbo].[Products] p 
  ON od.ProductId=p.ProductId 
  INNER JOIN [Northwind].[dbo].[Suppliers] s 
  ON p.SupplierId=s.SupplierId
  group by s.Country, YEAR(o.OrderDate),MONTH(o.OrderDate);




-- Question 2 
Three dimensional model is to be created with dimensions Product, Store and Date 
Measures - Total Sales, Average Sales 
Dimensional Attribute - Product, Store, Date 
Hierarchies 
    Product -> Brand -> Type
    Store -> Province -> Country
    Date -> Month -> Quarter -> Semester -> Year 
        -> Weekday


b.i. 
Slice on product=all and date=all
Measure - Total sales

b.ii. 
Slice on product=all
Roll up date to month 
Roll up store to province 

b.iii.
Slice: date must be in 1999 and 2005
Roll up date to  month 
Roll up store to province 



We assume that the base table is stored in following relational tables:
Product(ProductId, Brand, Type)
Store(StoreId, Province, Country)
Date(Date, Weekday, Month, Quarter, Semester, Year)





INSERT Date (Date, Weekday, Month, Semester, Year) VALUES 
('2015-01-01', 'Thursday', 'January', 1, 2015), 
('2015-02-01', 'Sunday', 'February', 1, 2015),
('2016-03-01', 'Tuesday', 'March', 2, 2016),
('2015-01-02', 'Friday', 'January', 1, 2015),
('2015-07-20', 'Monday', 'July', 2, 2015),
('2015-09-29', 'Tuesday', 'September', 1, 2015);

INSERT Product (ProductID, Brand, Type) VALUES
(1, 'A', '1'), 
(2, 'B', '1'), 
(3, 'A', '2'), 
(4, 'A', '3'), 
(5, 'C', '3');

INSERT Sales (ProductID, StoreID, Date, Amount) VALUES
(1, 1, '2015-01-01', 5),
(1, 2, '2015-01-01', 15),
(1, 2, '2016-03-01', 2),
(1, 3, '2015-02-01', 10),
(2, 1, '2015-01-01', 3),
(2, 2, '2015-01-01', 20),
(2, 3, '2015-09-29', 15),
(3, 1, '2015-01-01', 7),
(3, 2, '2015-02-01', 5);

INSERT Store (StoreID, Province, Country) VALUES
(1, 'Antwerp', 'Belgium'),
(2, 'Brussels', 'Belgium'),
(3, 'North Brabant', 'Netherlands');


CREATE VIEW sales_cube as
select p.ProductID,p.Brand, st.StoreId, st.Province, st.Country,d.Date,d.Month,d.Semester,d.Year,d.WeekDay, sum(amount) as total_sales,avg(amount) as avg_sales
from [Northwind].[dbo].[Product] p, 
[Northwind].[dbo].[Store] st,[Northwind].[dbo].[Sales] s,[Northwind].[dbo].[Date] d
where s.ProductId=p.ProductID
AND s.StoreId=st.StoreId 
AND s.Date=d.date
group by rollup(p.Brand,p.ProductID),
rollup(st.Country, st.Province, st.StoreId),
rollup(d.Year,d.Semester,d.Month,d.Date),
rollup(d.WeekDay,d.Date)





select * from sales_cube where Brand is null and
Weekday is null and 
year is null 
and StoreId is not null 


select month,year, province, total_sales,avg_sales from sales_cube where Brand is null 
and date is null and month is not null and 
storeid is null and Province is not null
and weekday is null 




select * from sales_cube
where year between 2015 and 2016
and storeid is null and province is not null
and date is null and month is not null
and brand is null and weekday is null
