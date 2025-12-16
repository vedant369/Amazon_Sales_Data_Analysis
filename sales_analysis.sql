SELECT * FROM amazon_sale_report
LIMIT 10;


-- Q1. How many total rows (sales records) are in the dataset?--
select count(*) from amazon_sale_report

--Q2. What is the total revenue generated across all sales?--
select sum(amount) as Total_Revenue
from amazon_sale_report;

--Q3. Which product category had the highest total quantity sold?--
select category,sum(qty) as total_quantity from amazon_sale_report
group by category
order by total_quantity desc
limit 1;

--Q4. What is the average sales amount per transaction?--
select * from amazon_sale_report

select avg(amount) as Avg_sales from amazon_sale_report

-- Without null values
select avg(coalesce(amount,0)) as Avg_sales from amazon_sale_report

--Q5. How many unique SKUs were sold?--

select count(distinct sku) from amazon_sale_report;

--Q6. What are the top 5 most sold SKUs based on quantity?--
select sku,sum(qty) as total_quantity from amazon_sale_report
group by sku
order by total_quantity desc
limit 5;

--Which month had the highest total sales revenue?--
select * from amazon_sale_report

select date_trunc('month',order_date) as sales_month, sum(amount) as total_revenue
from amazon_sale_report
group by sales_month
order by total_revenue desc
limit 1;

--How many sales were B2B transactions vs non-B2B?--
select b2b,count(*) as total_sales from amazon_sale_report
group by b2b

--Which fulfilment method was used most frequently?--
select max(fulfilment) from amazon_sale_report

select fulfilment,count(*) as usage_count from amazon_sale_report
group by fulfilment
order by usage_count desc

--How many sales were made for each product size?--

select * from amazon_sale_report

select size, count(*) as total_sales
from amazon_sale_report
group by size
order by total_sales desc