with order_cte as (
select customer_id, to_char(order_date::date, 'yyyy-mm') as odate, count(*) as number_of_orders,
lead(count(*)) over(partition by customer_id order by to_char(order_date::date, 'yyyy-mm')) as next_month_orders,
lead(count(*),2) over(partition by customer_id order by to_char(order_date::date, 'yyyy-mm')) as following_month_orders
from orders2
group by customer_id, odate
),

consecutive_months as  (
select customer_id, date_trunc('month', order_date)::date as odate,
lead(date_trunc('month', order_date)::date) over(partition by customer_id order by date_trunc('month', order_date)::date asc) as next_month,
lead(date_trunc('month', order_date)::date,2) over(partition by customer_id order by date_trunc('month', order_date)::date asc) as following_month
from orders2
group by customer_id, odate
order by customer_id, odate
),

orders_months_cte as (select cm.customer_id, cm.odate, cm.next_month, cm.following_month, oc.number_of_orders, oc.next_month_orders, oc.following_month_orders,
DATE_PART('month', age(next_month, cm.odate)) as datediff1,
date_part('month', age(following_month, cm.next_month)) as datediff2
from consecutive_months cm
join order_cte oc
on cm.customer_id = oc.customer_id
where DATE_PART('month', age(next_month, cm.odate)) = 1 and date_part('month', age(following_month, next_month)) = 1 and next_month_orders is not null and following_month_orders is not null
and oc.number_of_orders * 2 = oc.next_month_orders and oc.number_of_orders * 3 = oc.following_month_orders
order by cm.customer_id
),

---select * from orders_months_cte

final_cte as(
SELECT o.*, 
row_number() over(partition by o.customer_id order by o.order_date desc ) as rn
FROM orders2 o 
order by o.customer_id
)

select fc.customer_id, om.odate as first_order_date, om.next_month, om.following_month, fc.order_date as last_order_date, fc.coupon_code,
om.number_of_orders as "1st_month_orders", om.next_month_orders as "2nd_month_orders", om.following_month_orders as "3rd_month_orders"
from final_cte fc 
join orders_months_cte om on fc.customer_id = om.customer_id 
where fc.rn =1 and fc.coupon_code is not null