-- Next Event Prediction

-- 👉 Compare current record with the next event

--Use case: user behavior tracking

select * from USER_EVENTS;

select uv.* , lead(event_type) over (partition BY user_id order by event_time) as next_event
from USER_EVENTS uv;

--time gap between events
--Used for sessionization
select uv.*, lead(event_time) over (PARTITION BY user_id order by event_time) - event_time as time_to_next_event
from USER_EVENTS uv;

--stock market signal detection
--what will be tomorrows price
select * from STOCK_PRICES;

select sp.*,
lead(close_price) over (partition by stock_symbol order by trade_date) as next_price
from stock_prices sp;

--detect last record in a grp
--if lead is null -> last row
select * from ORDERS_1702;

select o.*, 
    case 
        when LEAD(order_id) over (PARTITION BY customer_id order by order_date) is null then 'LAST ORDER'
        else 'not_last'
        end as order_flag
from ORDERS_1702 o;

--Duration calculation (start - end)
select * from TASK_STATUS;

select ts.* ,
lead(status_time) over (partition by TASK_ID order by STATUS_TIME) as next_task_time,
lead(status_time) over (partition by task_id order by status_time) - STATUS_TIME  as duration
from task_status ts;

--Price Trend Classification
select * from PRODUCT_PRICES;

select pp.* ,
    case 
        when lead(price) over (partition by PRODUCT_ID order by price_date) > PRICE then 'Price Increase'
        when lead(price) over (partition by PRODUCT_ID order by price_date) < PRICE then 'Price Drop'
        else 'no change'
        end as price_change
from PRODUCT_PRICES pp;

--identify next purchase date
select * from PURCHASES;

select pur.* ,
lead (purchase_date) over (PARTITION BY CUSTOMER_ID ORDER BY PURCHASE_DATE) next_purchase_date
from PURCHASES pur;

--Overlapping Interval Detection
select * from meetings;
SELECT
    meeting_id,
    start_time,
    end_time,
    LEAD(start_time) OVER (ORDER BY start_time) AS next_start,
    CASE
      WHEN LEAD(start_time) OVER (ORDER BY start_time) < end_time
      THEN 'OVERLAP'
    END
FROM meetings;


ALTER SESSION SET NLS_TIMESTAMP_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

--Identify when state changes
SELECT * FROM EMPLOYEE_STATUS;

select status.*,
case 
    when 
        status <> lead(status) over (PARTITION BY EMPLOYEE_ID ORDER BY STATUS_DATE) 
    then 'STATUS CHANGE'
end
from EMPLOYEE_STATUS status;