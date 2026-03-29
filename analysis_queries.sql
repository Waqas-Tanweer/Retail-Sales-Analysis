CREATE TABLE orders (
    ship_mode VARCHAR(50),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code INT,
    region VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    sales FLOAT,
    quantity INT,
    discount FLOAT,
    profit FLOAT
);

-- SELECT row_number() OVER () AS RN , orders.* FROM orders LIMIT 50;


SELECT ROUND(SUM(sales), 2) FROM orders;


Select region, round(SUM(sales),2) from orders group by region;


select row_number() over() AS RN, region , sum(sales) T_sales, sum(profit) as T_profit
from orders
group by Region
order by sum(sales) desc;


select category,  round(sum(sales),0) as T_Sales
from orders group by category order by 2;


select sub_category as sc , sum(profit) sp
from orders
group by sc
having sp < 1 order by sp desc;


SELECT discount,
       AVG(profit) AS avg_profit
FROM orders
GROUP BY discount
ORDER BY discount;
