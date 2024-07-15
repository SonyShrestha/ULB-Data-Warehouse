select  c.companyname,extract('YEAR' FROM s.orderdate),cat.categoryname,SUM(od.unitprice*od.quantity)
from orders s
inner join customers c
on s.customerid=c.customerid
inner join orderdetails od 
on s.orderid=od.orderid 
inner join products p 
on p.productid=od.productid
inner join categories cat 
on p.categoryid=cat.categoryid
group by c.companyname,extract('YEAR' FROM s.orderdate),cat.categoryname




select  c.country as customer_country,sup.country as supplier_country, extract('YEAR' FROM s.orderdate) as year,
SUM(od.unitprice*od.quantity)
from orders s
inner join customers c
on s.customerid=c.customerid
inner join orderdetails od 
on s.orderid=od.orderid 
inner join products p 
on p.productid=od.productid
inner join suppliers sup 
on p.supplierid=sup.supplierid
group by c.country,sup.country,extract('YEAR' FROM s.orderdate)





select *,lag(sales) over(partition by postalcode,month_ order by year_) as prev_month_sales from (
select  c.postalcode,extract('YEAR' FROM s.orderdate) as year_,extract('MONTH' FROM s.orderdate) as month_, 
SUM(od.unitprice*od.quantity) as sales 
from orders s
inner join customers c
on s.customerid=c.customerid
inner join orderdetails od 
on s.orderid=od.orderid 
group by c.postalcode,extract('YEAR' FROM s.orderdate),extract('MONTH' FROM s.orderdate)
);
