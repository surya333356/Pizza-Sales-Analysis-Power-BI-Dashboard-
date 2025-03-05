select * from pizza_sales
-- Total Revenue
select sum(total_price) as Total_Revenue
from pizza_sales;

-- Average order value
select round(sum(total_price)/count(distinct order_id),2) as avg_order_value
from pizza_sales;

-- Total Pizza sold
select sum(quantity) as Total_Pizza_sold
from pizza_sales;

-- Total Orders
select count(distinct order_id) as Total_Orders
from pizza_sales;

-- Average Pizza per Order
select sum(quantity)/count(distinct order_id) as Avg_Pizza_per_Order
from pizza_sales;

-- Daily trend for Total Orders
select to_char(order_date,'day') as Order_day,
count(distinct order_id) as Total_orders
from pizza_sales
group by to_char(order_date,'day')
order by Total_orders desc;

-- Monthly trend for Total Orders
select to_char(order_date,'Month') as Order_day,
count(distinct order_id) as Total_orders
from pizza_sales
group by to_char(order_date,'Month')
order by Total_orders desc;

-- % sales by pizza category
select p.pizza_category,round(sum(p.total_price)*100/(select sum(total_price) from pizza_sales),2) as sales_percentage_by_category
from pizza_sales p
group by p.pizza_category
order by sales_percentage_by_category desc;

-- % sales by pizza size
select p.pizza_size,round(sum(p.total_price)*100/(select sum(total_price) from pizza_sales),2) as sales_percentage_by_pizza_size
from pizza_sales p
group by p.pizza_size
order by sales_percentage_by_pizza_size desc;

-- Total pizza sold by pizza category
select pizza_category,sum(quantity) as pizza_sold
from pizza_sales
group by pizza_category;

-- Top 5 pizza by revenue
select pizza_name,sum(total_price) as Revenue
from pizza_sales
group by pizza_name
order by Revenue desc
limit 5;

-- Bottom 5 pizza by revenue
select pizza_name,sum(total_price) as Revenue
from pizza_sales
group by pizza_name
order by Revenue asc
limit 5;

-- top 5 pizza by total order
select pizza_name,count(distinct order_id) as Total_orders
from pizza_sales
group by pizza_name
order by Total_orders desc
limit 5;

-- bottom 5 pizza by total order
select pizza_name,count(distinct order_id) as Total_orders
from pizza_sales
group by pizza_name
order by Total_orders asc
limit 5;

-- top 5 pizza by quantity
select pizza_name,sum(quantity) as Total_pizza_sold
from pizza_sales
group by pizza_name
order by Total_pizza_sold desc
limit 5;

-- bottom 5 pizza by quantity
select pizza_name,sum(quantity) as Total_pizza_sold
from pizza_sales
group by pizza_name
order by Total_pizza_sold asc
limit 5;

