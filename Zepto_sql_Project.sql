-- =========================================================
-- ZEPTO E-COMMERCE DATA ANALYSIS PROJECT
-- =========================================================

-- =========================================================
-- SECTION 1: DATABASE SETUP
-- =========================================================

drop table if exists zepto;

-- 1.1 Creating Category Table 
create table categories
(
category_id serial primary key,
category_name varchar(100)
);

-- 1.2 Inserting Category Data 
insert into categories (category_name) values
('Fruits & Vegetables'),
('Cooking Essentials'),
('Munchies'),
('Dairy, Bread & Batter'),
('Beverages'),
('Packaged Food'),
('Icecream & Desserts'),
('Chocolates & Candies'),
('Meats, Fishes & Eggs'),
('Biscuits'),
('Personal Care'),
('Paan Corner'),
('Home & Cleaning'),
('Health & Hygience'),
('Curated For You');


select * from categories;

-- 1.3 Creating individual raw category tables (repeat this structure
-- for each of the 15 category tables: Fruits_and_Vegetables,
-- Cooking_Essentials, Munchies, dairy, beverage, Packaged_food,
-- icecream_desserts, chocolate_candies, nonveg, biscuit,
-- personal_care, paan_core, home_cleaning, health_and_hygience,
-- curated_for_u)

create table Food_and_Vegetables
(
Product_Name varchar(100),
MRP real,
Discount_Percent integer,
Available_Quantity integer,
Discount_Selling_Price integer,
Weighted_In_GMS integer,
Out_Of_Stock boolean,
Quantity integer
);

-- Rename to match naming convention

Alter table Food_and_Vegetables
rename to Fruits_and_Vegetables;


create table Cooking_Essentials
(
Product_Name varchar(100),
MRP real,
Discount_Percent integer,
Available_Quantity integer,
Discount_Selling_Price integer,
Weighted_In_GMS integer,
Out_Of_Stock boolean,
Quantity integer
);

-- ... create the remaining 13 category tables using the same structure ...

-- 1.4 Data import steps (pgAdmin):
-- a. Left panel -> Servers -> select your database
-- b. Expand Schemas -> Tables
-- c. Right-click table -> Refresh (if not visible)
-- d. Right-click target table -> Import/Export Data
-- e. Choose Import, select CSV file (UTF-8, delimiter comma)
-- f. Ensure "Header" is ON and "Freeze" is OFF
-- g. Run the import


-- =========================================================
-- SECTION 2: MASTER PRODUCT TABLE
-- =========================================================

-- 2.1 Creating master product table combining all 15 category tables
create table product
(
Product_id serial primary key,
Product_Name varchar(100),
MRP real,
Discount_Percent integer,
Available_Quantity integer,
Discount_Selling_Price integer,
Weighted_In_GMS integer,
Out_Of_Stock boolean,
Quantity integer,
category_id integer,
foreign key (category_id)
references categories(category_id)
);

-- 2.2 Inserting data from each category table with matching category_id
insert into product (Product_Name,MRP,Discount_Percent,Available_Quantity,Discount_Selling_Price,Weighted_in_GMS,Out_Of_Stock,Quantity,category_id)
select Product_Name,MRP,Discount_Percent,Available_Quantity,Discount_Selling_Price,Weighted_in_GMS,Out_Of_Stock,Quantity,1 from Fruits_and_Vegetables;

insert into product (Product_Name,MRP,Discount_Percent,Available_Quantity,Discount_Selling_Price,Weighted_in_GMS,Out_Of_Stock,Quantity,category_id)
select Product_Name,MRP,Discount_Percent,Available_Quantity,Discount_Selling_Price,Weighted_in_GMS,Out_Of_Stock,Quantity,2 from Cooking_Essentials;

insert into product (Product_Name,MRP,Discount_Percent,Available_Quantity,Discount_Selling_Price,Weighted_in_GMS,Out_Of_Stock,Quantity,category_id)
select Product_Name,MRP,Discount_Percent,Available_Quantity,Discount_Selling_Price,Weighted_in_GMS,Out_Of_Stock,Quantity,3 from Munchies;

insert into product (Product_Name,MRP,Discount_Percent,Available_Quantity,Discount_Selling_Price,Weighted_in_GMS,Out_Of_Stock,Quantity,category_id)
select Product_Name,MRP,Discount_Percent,Available_Quantity,Discount_Selling_Price,Weighted_in_GMS,Out_Of_Stock,Quantity,4 from dairy;

insert into product (Product_Name,MRP,Discount_Percent,Available_Quantity,Discount_Selling_Price,Weighted_in_GMS,Out_Of_Stock,Quantity,category_id)
select Product_Name,MRP,Discount_Percent,Available_Quantity,Discount_Selling_Price,Weighted_in_GMS,Out_Of_Stock,Quantity,5 from beverage;

insert into product (Product_Name,MRP,Discount_Percent,Available_Quantity,Discount_Selling_Price,Weighted_in_GMS,Out_Of_Stock,Quantity,category_id)
select Product_Name,MRP,Discount_Percent,Available_Quantity,Discount_Selling_Price,Weighted_in_GMS,Out_Of_Stock,Quantity,6 from Packaged_food

insert into product (Product_Name,MRP,Discount_Percent,Available_Quantity,Discount_Selling_Price,Weighted_in_GMS,Out_Of_Stock,Quantity,category_id)
select Product_Name,MRP,Discount_Percent,Available_Quantity,Discount_Selling_Price,Weighted_in_GMS,Out_Of_Stock,Quantity,7 from icecream_desserts;

insert into product (Product_Name,MRP,Discount_Percent,Available_Quantity,Discount_Selling_Price,Weighted_in_GMS,Out_Of_Stock,Quantity,category_id)
select Product_Name,MRP,Discount_Percent,Available_Quantity,Discount_Selling_Price,Weighted_in_GMS,Out_Of_Stock,Quantity,8 from chocolate_candies;

insert into product (Product_Name,MRP,Discount_Percent,Available_Quantity,Discount_Selling_Price,Weighted_in_GMS,Out_Of_Stock,Quantity,category_id)
select Product_Name,MRP,Discount_Percent,Available_Quantity,Discount_Selling_Price,Weighted_in_GMS,Out_Of_Stock,Quantity,9 from nonveg

insert into product (Product_Name,MRP,Discount_Percent,Available_Quantity,Discount_Selling_Price,Weighted_in_GMS,Out_Of_Stock,Quantity,category_id)
select Product_Name,MRP,Discount_Percent,Available_Quantity,Discount_Selling_Price,Weighted_in_GMS,Out_Of_Stock,Quantity,10 from biscuit

insert into product (Product_Name,MRP,Discount_Percent,Available_Quantity,Discount_Selling_Price,Weighted_in_GMS,Out_Of_Stock,Quantity,category_id)
select Product_Name,MRP,Discount_Percent,Available_Quantity,Discount_Selling_Price,Weighted_in_GMS,Out_Of_Stock,Quantity,11 from personal_care

insert into product (Product_Name,MRP,Discount_Percent,Available_Quantity,Discount_Selling_Price,Weighted_in_GMS,Out_Of_Stock,Quantity,category_id)
select Product_Name,MRP,Discount_Percent,Available_Quantity,Discount_Selling_Price,Weighted_in_GMS,Out_Of_Stock,Quantity,12 from paan_core

insert into product (Product_Name,MRP,Discount_Percent,Available_Quantity,Discount_Selling_Price,Weighted_in_GMS,Out_Of_Stock,Quantity,category_id)
select Product_Name,MRP,Discount_Percent,Available_Quantity,Discount_Selling_Price,Weighted_in_GMS,Out_Of_Stock,Quantity,13 from home_cleaning

insert into product (Product_Name,MRP,Discount_Percent,Available_Quantity,Discount_Selling_Price,Weighted_in_GMS,Out_Of_Stock,Quantity,category_id)
select Product_Name,MRP,Discount_Percent,Available_Quantity,Discount_Selling_Price,Weighted_in_GMS,Out_Of_Stock,Quantity,14 from health_and_hygience

insert into product (Product_Name,MRP,Discount_Percent,Available_Quantity,Discount_Selling_Price,Weighted_in_GMS,Out_Of_Stock,Quantity,category_id)
select Product_Name,MRP,Discount_Percent,Available_Quantity,Discount_Selling_Price,Weighted_in_GMS,Out_Of_Stock,Quantity,15 from curated_for_u


-- =========================================================
-- SECTION 3: DATA VALIDATION & CLEANING
-- =========================================================

-- 3.1 Quick look at data
select * from categories;
select * from product;

-- 3.2 Total product available
select count(*) as total_product from product;   

-- 3.3 Total categories available  
select count(*) as total_categories from categories;

-- 3.4 Find products with MRP = 0 (invalid data)
select p.* , c.category_name from product p
join categories c
on p.category_id=c.category_id
where p.mrp=0;

-- 3.5 Take a backup before cleaning
create table product_backup as
select * from product;

-- 3.6 Remove invalid rows (MRP can never be 0)
delete from product
where mrp = 0;

-- 3.7 Convert paise to rupees (source data was stored in paise)
update product 
set mrp=mrp/100.0,
discount_selling_price = discount_selling_price/100.0;

select * from product;

-- 3.8 Check for NULLs in key columns
select * from product
where product_name is null
   or discount_percent is null
   or mrp is null;

-- 3.9 Check for duplicate category_id groupings (sanity check, not true duplicates)
select c.category_name,
p.category_id,
count(*) as Total_Products
from product p
join categories c
on p.category_id= c.category_id
group by c.category_name,p.category_id
having count(*) > 1;


-- =========================================================
-- SECTION 4: BUSINESS ANALYSIS (original queries, cleaned up)
-- =========================================================

-- 4.1 Top 10 most expensive products
select product_name,mrp,available_quantity from product 
order by mrp desc
limit 10;

-- 4.2 Top 10 cheapest products
select product_name,mrp from product 
order by mrp asc
limit 10;

-- 4.3 Average discount per category (highest discount category)
select c.category_name ,round(avg(p.discount_percent),2) as average_discount 
from product p
join categories c
on p.category_id = c.category_id
group by c.category_name
order by average_discount desc;

-- 4.4 Total MRP vs total discounted price per category (overall discount impact)
select c.category_name, 
sum(p.mrp) as total_product_price,
sum(p.discount_percent) as total_discount,
sum(p.discount_selling_price) as After_discount_price,
sum(p.mrp-p.discount_selling_price) as Total_saving
from product p
join categories c
on p.category_id=c.category_id
group by c.category_name
order by total_product_price desc;

-- 4.5 Estimated Revenue
select c.category_name,sum(p.discount_selling_price * p.available_quantity)
as estimated_revenue
from product p
join categories c
on p.category_id = c.category_id
group by c.category_name
order by estimated_revenue desc;

-- 4.6 High MRP products that are out of stock (lost sales opportunity)
select product_name,mrp from product
where out_of_stock='true'
order by mrp desc;

-- 4.7 Top 10 most discounted products
select product_name ,mrp ,discount_percent,discount_selling_price from product
order by discount_percent desc
limit 10;

-- 4.8 Products with no discount at all
select product_name,mrp,discount_percent from product
where discount_percent=0;

-- 4.9 Count of in-stock vs out-of-stock products (fixed - original had a syntax error)
select sum(out_of_stock from product
group by out_of_stock ;

-- 4.10 Category-wise product count
select c.category_name , count(*) from product p
join categories c
on p.category_id = c.category_id
group by c.category_name
order by count(*) desc;
-- this will show you how much items are in different different categories --


-- 4.11 Maximum discount offered in every category
select c.category_name, max(discount_percent) from product p
join categories c 
on p.category_id=c.category_id
group by c.category_name;

-- 4.12 Savings amount per product
select product_name,mrp,discount_selling_price,(mrp - discount_selling_price) as savings
from product;

-- 4.13 Highest available quantity per category (using CTE + window function)
with ranked_position as
(
select 
c.category_name,
p.product_name,
p.available_quantity,
row_number() over(partition by c.category_name order by p.available_quantity desc) as rn
from product p
join categories c
on p.category_id=c.category_id
)
select * from ranked_position;

-- 4.14 Full product + category join (master view)
select p.* ,c.category_name from product p
join categories c
on p.category_id = c.category_id;

-- 4.15 Category offering the highest average discount % (duplicate of 4.3, kept for reference)
select c.category_name,round(avg(p.discount_percent),2) as average_discount from product p
join categories c
on p.category_id=c.category_id
group by c.category_name
order by average_discount desc

-- 4.16 Top 5 products giving customers the highest savings
select product_name,(mrp-discount_selling_price) as Savings
from product
order by(mrp-discount_selling_price) desc
limit 5

-- ===============================================================
-- SECTION 5: ADDITIONAL BUSINESS INSIGHT QUERIES (RECOMMEDATIONS)
-- ===============================================================

-- 5.1 Revenue contribution % of each category to total business revenue
-- Insight: tells management which categories are the real revenue drivers

with category_revenue as (
    select c.category_name,
    sum(p.discount_selling_price * p.available_quantity) as revenue
    from product p
    join categories c 
	on p.category_id = c.category_id
    group by c.category_name
)
select category_name,
       revenue,
       round(100.0 * revenue / sum(revenue) over (), 2) as revenue_share_percent
from category_revenue
order by revenue_share_percent desc;

-- 5.2 Stock health per category (what portion of a category's catalog is out of stock)
-- Insight: flags categories with supply-chain / inventory problems
select c.category_name,
       count(*) as total_products,
       sum(case 
	   when
	   p.out_of_stock = true then 1 
	   else 0
	   end) as out_of_stock_count
from product p
join categories c
on p.category_id = c.category_id
group by c.category_name
order by out_of_stock_count desc;

-- 5.3 High-discount but still out-of-stock products (missed revenue despite aggressive pricing)
-- Insight: these are "wasted" promotions - discounted heavily but customer can't buy them

select product_name, discount_percent, mrp, discount_selling_price
from product
where out_of_stock = true and discount_percent >= 30
order by discount_percent desc;

-- 5.4 Price range / bucket distribution of products
-- Insight: shows whether the catalog skews toward budget, mid-range or premium items
select
    case
        when discount_selling_price < 100 then 'Under 100'
        when discount_selling_price between 100 and 300 then '100-300'
        when discount_selling_price between 301 and 600 then '301-600'
        when discount_selling_price between 601 and 1000 then '601-1000'
        else 'Above 1000'
    end as price_bucket,
    count(*) as product_count
from product
group by price_bucket
order by min(discount_selling_price);

-- 5.5 Low stock, high demand risk products (available_quantity is low but not zero)
-- Insight: these need urgent restocking before they go out of stock
select product_name, available_quantity, discount_selling_price
from product
where available_quantity > 0 and available_quantity <= 5
order by available_quantity asc;

-- 5.6 Correlation check - does higher discount mean higher out-of-stock rate?
-- Insight: tests whether aggressive discounting is draining stock faster
select
    case
        when discount_percent = 0 then 'No Discount'
        when discount_percent between 1 and 20 then '1-20%'
        when discount_percent between 21 and 40 then '21-40%'
        else 'Above 40%'
    end as discount_bucket,
    count(*) as total_products,
    sum(case when out_of_stock = true then 1 else 0 end) as out_of_stock_products,
    round(100.0 * sum(case when out_of_stock = true then 1 else 0 end) / count(*), 2) as out_of_stock_rate
from product
group by discount_bucket
order by out_of_stock_rate desc;


-- 5.7 Products with MRP and selling price almost equal (negligible discount, <5%)
-- Insight: candidates for future promotional campaigns
select product_name, mrp, discount_selling_price, discount_percent
from product
where discount_percent < 5 and discount_percent > 0
order by mrp desc;

-- 5.8 Overall business summary in one query (single-row dashboard snapshot)
select
    count(*) as total_products,
    round(avg(discount_percent), 2) as avg_discount_percent,
    sum(mrp - discount_selling_price) as total_customer_savings,
    sum(case when out_of_stock = true then 1 else 0 end) as total_out_of_stock,
    round(100.0 * sum(case when out_of_stock = true then 1 else 0 end) / count(*), 2) as out_of_stock_rate_percent
from product;

--=============================================================================
--=============================================================================
