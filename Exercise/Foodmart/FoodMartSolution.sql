-- a
select 
	st.storename,
	sum(s.storesales) as storesales,
	sum(s.storecost) as storecost,
	sum(s.unitsales) as unitsales
from sales s
inner join store st 
on s.storeid=st.storeid
group by st.storeid



-- b
select st.storename,st.storestate,
sum(storesales) as storesales,sum(storecost) as storecost,sum(unitsales) as unitsales
from sales s
inner join store st 
on s.storeid=st.storeid
where st.storestate IN ('CA','WA')
group by st.storename,st.storestate




-- c
select st.storename,st.storecity,sum(storesales) as storesales,sum(storecost) as storecost,sum(unitsales) as unitsales
from sales s
inner join store st 
on s.storeid=st.storeid
where st.storestate IN ('CA','WA')
group by st.storename,st.storecity



-- d
select st.storename,st.storestate,st.storecity,
sum(storesales) as storesales,sum(storecost) as storecost,sum(unitsales) as unitsales,
sum(storesales)/sum(unitsales) as avg_sales, 
sum(storesales)-sum(storecost) as profit
from sales s
inner join store st 
on s.storeid=st.storeid
where st.storestate= 'CA'
group by st.storename,st.storestate,st.storecity


-- e
select st.storestate,st.storetype,sum(storesales) as total_sales,sum(unitsales) as quantity,
sum(storesales)/sum(unitsales) as avg_sales
from sales s
inner join store st 
on s.storeid=st.storeid
inner join date d 
on s.dateid=d.dateid 
where d.date between '2017-01-01' and '2017-12-31'
group by st.storestate,st.storetype

-- f
with cte as (
select *, case when month in(1,2,3,4,5,6) then 1 else 2 end as semester from date d
)
select st.storename,d.semester,sum(storesales)-sum(storecost) as sales_profit
from sales s
inner join store st 
on s.storeid=st.storeid
inner join cte d 
on s.dateid=d.dateid 
where d.date between '2017-01-01' and '2017-12-31'
group by st.storename,d.semester;



-- g
with cte as (
	select *, case when month in(1,2,3,4,5,6) then 1 else 2 end as semester from date d
)
select 
	st.storename,d.quarter,d.semester,((sum(storesales)-sum(storecost))/sum(storecost))*100 as sales_profit
from sales s
inner join store st 
on s.storeid=st.storeid
inner join cte d 
on s.dateid=d.dateid 
where d.date between '2017-01-01' and '2017-12-01'
group by st.storename,d.quarter,d.semester




--h 
select st.storename,d.year,sum(storesales)-sum(storecost) as sales_profit
from sales s
inner join store st 
on s.storeid=st.storeid
inner join date d 
on s.dateid=d.dateid 
where quarter='Q1'
group by st.storename,d.year;




-- i 
with city_price as (
select city,sum(unitsales) as city_price,min(stateprovince) as state
from sales s
inner join customer st 
on s.customerid=st.customerid
group by city
	),
	state_price as (
	select stateprovince,sum(unitsales) as state_price
from sales s
inner join customer st 
on s.customerid=st.customerid
group by stateprovince
	)
	select city,stateprovince,city_price, state_price, (city_price/state_price)*100 as percentage from city_price c
	left join state_price s 
	on c.state=s.stateprovince


-- j
with city_price as (
select city,sum(unitsales) as city_price,min(country) as country
from sales s
inner join customer st 
on s.customerid=st.customerid
group by city
	),
	country_price as (
	select country,sum(unitsales) as country_price
from sales s
inner join customer st 
on s.customerid=st.customerid
group by country
	)
	select city,c.country,city_price, country_price, (city_price/country_price)*100 as percentage from city_price c
	left join country_price s 
	on c.country=s.country
	order by c.country;
	
	
	select *,(total_qty/country_qty)*100 as percentage from (
	select *,sum(total_qty) over (partition by country) country_qty from (
	select city,sum(unitsales) as total_qty,min(country) as country
from sales s
inner join customer st 
on s.customerid=st.customerid
group by city
		) order by country
)


-- k
select *,(unit_sales/overall_sum)*100 as percentage from (
select *,sum(unit_sales) over(partition by const) as overall_sum from (
select 1 as const, promotionname,sum(unitsales) as unit_sales from sales s
inner join promotion p on 
s.promotionid=p.promotionid 
where upper(promotionname)!='NO PROMOTION'
group by promotionname
	)
)



-- l 
select p.promotionname, d.year,d.quarter,sum(unitsales) as unitsales from sales s
inner join promotion p 
on s.promotionid=p.promotionid 
inner join date d 
on s.dateid=d.dateid
group by p.promotionname, d.year,d.quarter



-- m
select p.promotionname, st.storename,sum(unitsales) as unitsales from sales s
inner join promotion p 
on s.promotionid=p.promotionid 
inner join store st
on s.storeid=st.storeid
where st.storestate IN ('CA','WA')
group by p.promotionname, st.storename



-- n 
select *,store_sales-store_sales_prev as percen from (
select year,month,monthname,store_sales,lag(store_sales) over(order by year,month) as store_sales_prev from (
select d.year,d.month,d.monthname,(sum(storesales)-sum(storecost)) as store_sales from sales s
inner join date d 
on s.dateid=d.dateid
group by d.year,d.month,d.monthname
	)
	);
	
	

-- o
select *,store_sales-store_sales_prev as percen from (
select year,month,monthname,store_sales,lag(store_sales) over(partition by month order by year) as store_sales_prev from (
select d.year,d.month,d.monthname,(sum(storesales)-sum(storecost)) as store_sales from sales s
inner join date d 
on s.dateid=d.dateid
group by d.year,d.month,d.monthname
)
);


-- p
select *,((store_sales-store_sales_prev)/store_sales_prev)*100 as percen from (
select year,month,monthname,store_sales,lag(store_sales) over(order by year,month) as store_sales_prev from (
select d.year,d.month,d.monthname,(sum(storesales)-sum(storecost)) as store_sales from sales s
inner join date d 
on s.dateid=d.dateid
group by d.year,d.month,d.monthname
	)
	);


-- q
with cte as (
select d.month,d.monthname,sum(unitsales),
min(quarter) as quarter,row_number() over(partition by min(quarter) order by month) from sales s
inner join date d 
on s.dateid=d.dateid
where d.date between '2017-01-01' and '2017-12-31'
group by d.month,d.monthname
	)
	select c.month,c.monthname,c.quarter,c.sum as unitsales,c2.sum as sales_first_month,
	c.sum-c2.sum as diff from cte c
	left join (select * from cte where row_number=1) c2 
	on c.quarter=c2.quarter


-- r
-- year-to-date beginning of the year to present
select *,
sum(total_sales) over(partition by productcategory,year order by month rows between unbounded preceding and current row )
from (
select pc.productcategory,year,month,sum(storesales) as total_sales from sales s
inner join date d 
on s.dateid=d.dateid
inner join product p 
on s.productid=p.productid 
inner join productclass pc 
on p.productclassid=pc.productclassid
group by pc.productcategory,year,month
)



-- s
-- 3 months moving average
select *,
avg(total_sales) over(partition by productcategory order by year,month rows  2 preceding)
from (
select pc.productcategory,year,month,cast(sum(storesales) as decimal) as total_sales from sales s
inner join date d 
on s.dateid=d.dateid
inner join product p 
on s.productid=p.productid 
inner join productclass pc 
on p.productclassid=pc.productclassid
group by pc.productcategory,year,month
);



-- t
select pc.productsubcategory,stateprovince,quarter,sum(unitsales) as total_unitsales from sales s
inner join date d 
on s.dateid=d.dateid
inner join product p 
on s.productid=p.productid 
inner join productclass pc 
on p.productclassid=pc.productclassid
inner join customer c 
on s.customerid=c.customerid
group by pc.productsubcategory,stateprovince,quarter;



-- u
with cities as (
	select storecity,sum(unitsales) from sales s
	inner join store st 
	on s.storeid=st.storeid
	inner join date d 
	on s.dateid=d.dateid
	where d.date between '2017-01-01' and '2017-12-31'
	group by storecity
	having sum(unitsales)>25000
)
select st.storetype,st.storecity,sum(storesales) as sp,sum(storecost) as cp,
sum(storesales)-sum(storecost) as profit from sales s
inner join store st 
on s.storeid=st.storeid
inner join date d 
on s.dateid=d.dateid
where d.date between '2017-01-01' and '2017-12-31'
and storecity in (select storecity from cities)
group by st.storetype,st.storecity;



-- w 
select st.storecity,sum(storesales) as store_sales,
sum(storecost) as store_cost,
sum(unitsales) as unit_sales 
from sales s
inner join store st  
on s.storeid=st.storeid
where st.storecity between 'Beverly Hills' and 'Spokane'
group by st.storecity


--x
select * from (
select st.storecity,sum(storesales) as store_sales,
sum(storecost) as store_cost,
sum(unitsales) as unit_sales 
from sales s
inner join store st  
on s.storeid=st.storeid
group by st.storecity
	) order by unit_sales desc
	
	
	
	--y
select * from (
select st.storecity,sum(storesales) as store_sales,
sum(storecost) as store_cost,
sum(unitsales) as unit_sales 
from sales s
inner join store st  
on s.storeid=st.storeid
group by st.storecity
	) order by unit_sales desc
	limit 5;
	
	
	
		-- z (different)
		with cte as (
select *,row_number() over(order by unit_sales desc) as row_number from (
select st.storecity,sum(storesales) as store_sales,
sum(storecost) as store_cost,
sum(unitsales) as unit_sales 
from sales s
inner join store st  
on s.storeid=st.storeid
group by st.storecity
	)
			)
select storecity,store_sales,store_cost,unit_sales from cte where row_number<=5
union all 
select 'All city',sum(store_sales),sum(store_cost),sum(unit_sales) from cte where row_number>5;



-- aa
with overall_sales_count as(
select sum(unitsales) as overall_sales_count from sales
)
select st.storecity,sum(unitsales),min(overall_sales_count) from 
sales s
inner join store st  
on s.storeid=st.storeid
inner join overall_sales_count
on 1=1
group by st.storecity
having (sum(unitsales)/min(overall_sales_count))*100>50



-- bb 
-- aa
with overall_sales_count as(
select sum(unitsales) as overall_sales_count from sales
),
cities as (
select st.storecity from 
sales s
inner join store st  
on s.storeid=st.storeid
inner join overall_sales_count
on 1=1
group by st.storecity
having (sum(unitsales)/min(overall_sales_count))*100>50
)
select st.storetype,sum(unitsales) from 
sales s
inner join store st  
on s.storeid=st.storeid
where st.storecity in (select storecity from cities)
group by st.storetype


-- cc 
select pc.productsubcategory,sum(unitsales),count(s.customerid) from sales s
inner join product p 
on s.productid=p.productid 
inner join productclass pc 
on p.productclassid=pc.productclassid
group by pc.productsubcategory


-- dd (different)
select st.storename,count(c.customerid),count(case when c.gender='F' then 1 else null end ) from sales s
inner join store st
on s.storeid=st.storeid 
inner join customer c 
on s.customerid=c.customerid
group by st.storename



-- ee (different)
select * from (
select pc.productsubcategory,year,month,row_number() over (partition by pc.productsubcategory order by sum(unitsales) desc )
from sales s
inner join product p 
on s.productid=p.productid 
inner join productclass pc 
on p.productclassid=pc.productclassid
inner join date d
on s.dateid=d.dateid
where d.date between '2017-01-01' and '2017-12-31'
group by pc.productsubcategory,year,month
	) where row_number=1



-- ff (different)
select brandname,sum(sum_monthly_sales),sum(sum_monthly_sales)/count(month) as average,
count(month) as cnt from (
select p.brandname,d.month,sum(unitsales) as sum_monthly_sales 
from sales s
inner join product p 
on s.productid=p.productid 
inner join date d
on s.dateid=d.dateid
where d.date between '2017-01-01' and '2017-12-31'
group by p.brandname,d.month
)
group by brandname