select * from pizza_sales ;

-- select total no pizza sales 

select sum(total_price) as total_revenue 
from pizza_sales ;

-- select avg order per value 

select	sum(total_price) / count(distinct order_id)  as avg_order_value 
from Pizza_sales ;

-- Total Quantity of pizzas sold 

select sum(quantity) as total_pizza_sold 
from pizza_sales ; 


-- 

select * from pizza_sales ;

-- total order placed 

select count(distinct order_id ) as total_order_placed_till_now 
from pizza_sales


--- avg pizza  per order 

select sum(quantity) / count(distinct order_id) as avg_pizza_sold_per_order 
from pizza_sales
	


--- Daily Trend for total order per day 

select DATENAME(DW , order_date) as order_day , count(distinct order_id) as total_orders_per_day 
from pizza_sales
group by DATENAME(DW , order_date) ; 

--- hourly sales trend of pizza 


select datepart(hour,order_time) as orders_hours , count(distinct order_id) as total_order_per_hours 
from pizza_sales 
group by datepart(hour,order_time) 
order by datepart(hour,order_time) asc ; 


--- monthly trend for sales order

SELECT
    DATEPART(YEAR, order_date) AS order_year,
    DATEPART(MONTH, order_date) AS order_month,
    COUNT(DISTINCT order_id) AS total_orders_per_month
FROM
    pizza_sales
GROUP BY  
    DATEPART(YEAR, order_date),
    DATEPART(MONTH, order_date)
ORDER BY
    order_year,
    order_month;

use [Pizza_sales_db ];
	select * from pizza_sales ; 

select pizza_category , round(sum(total_price),2)as total_sales , round(sum(total_price)* 100 / (select sum(total_price) from pizza_sales),2)  as total_sales_percentage 
from pizza_sales
group by pizza_category



--- wrt particular month(octomber)  

select pizza_category , round(sum(total_price),2)as total_sales_octomber  , round(sum(total_price)* 100 / (select sum(total_price) from pizza_sales),2)  as total_sales_percentage_for_octomber  
from pizza_sales
where month(order_date)= 10 
group by pizza_category 


-- daily week dayas of sales trend in month of february 

select DATENAME(DW , order_date) as order_day , count(distinct order_id) as total_orders_per_day 
from pizza_sales
where month(order_date)= 2
group by DATENAME(DW , order_date) ; 


--- hourly sales trends of pizza where in month of january 

select datepart(hour,order_time) as orders_hours , count(distinct order_id) as total_order_per_hours 
from pizza_sales 
where month(order_date)= 1
group by datepart(hour,order_time) 
order by datepart(hour,order_time) asc ; 



--- here it is total oreder in the 4th quarter 

select DATENAME(DW , order_date) as order_day , count(distinct order_id) as total_orders_per_day 
from pizza_sales
where datepart(QUARTER,order_date)= 4
group by DATENAME(DW , order_date) ; 



--- percentage of sales by pizza size 

select * from pizza_sales 


-- sales percentage of pizz by pizza size 

select  pizza_size, round(sum(total_price),2)as total_sales , round(sum(total_price)* 100 / (select sum(total_price) from pizza_sales),2)  as total_sales_percentage 
from pizza_sales
group by  pizza_size 
order by total_sales desc 


-- sales percentage of pizza by category 

select pizza_category , round(sum(total_price),2) as total_sales , round(sum(total_price)*100 /(select sum(total_price) from pizza_sales),2 ) as sales_pizza_category 
from pizza_sales 
group by pizza_category
order by total_sales desc  



select pizza_category , round(sum(total_price),2) as total_sales , round(sum(total_price)*100 /(select sum(total_price) from pizza_sales),2 ) as sales_pizza_category 
from pizza_sales 
where datepart(QUARTER,order_date)= 4
group by pizza_category
order by total_sales desc ;




use [Pizza_sales_db ];
	select * from pizza_sales ; 


--- top 5 best selller total pizzas sold 


select top 5  pizza_name ,sum(quantity) as total_quantity 
from pizza_sales 
group by pizza_name 
order by sum(quantity) desc ;




--- bottom  5 best selller total pizzas sold 


select top 5  pizza_name ,sum(quantity) as total_quantity 
from pizza_sales 
group by pizza_name 
order by sum(quantity)  ;


-- how much sales is there in in hour time for a year with respect to category of pizza 

select datepart(hour,order_time) as time_sale  ,pizza_category, round(sum(total_price),2) as total_sale , round(sum(total_price)*100/(select sum(total_price) from pizza_sales),2) as total_percent_of_sale_by_size 
from pizza_sales 
group by datepart(hour,order_time) , pizza_category 
order by time_sale                                                                                             