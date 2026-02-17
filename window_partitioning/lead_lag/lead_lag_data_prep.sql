--User Events (Next Event + Time Gap) Data Prep
CREATE TABLE user_events (
    user_id INT,
    event_time TIMESTAMP,
    event_type VARCHAR(50)
);

INSERT ALL
 INTO user_events VALUES (101, TIMESTAMP '2024-01-01 10:00:00', 'LOGIN')
 INTO user_events VALUES (101, TIMESTAMP '2024-01-01 10:05:00', 'VIEW_PRODUCT')
 INTO user_events VALUES (101, TIMESTAMP '2024-01-01 10:15:00', 'ADD_TO_CART')
 INTO user_events VALUES (101, TIMESTAMP '2024-01-01 10:30:00', 'LOGOUT')

 INTO user_events VALUES (102, TIMESTAMP '2024-01-01 11:00:00', 'LOGIN')
 INTO user_events VALUES (102, TIMESTAMP '2024-01-01 11:10:00', 'VIEW_PRODUCT')
 INTO user_events VALUES (102, TIMESTAMP '2024-01-01 11:40:00', 'LOGOUT')
SELECT 1 FROM dual; 

--Orders (Last Record Detection)
CREATE TABLE orders_1702 (
    order_id INT,
    customer_id INT,
    order_date DATE
);

INSERT ALL
 INTO orders_1702 VALUES (1, 201, DATE '2024-01-01')
 INTO orders_1702 VALUES (2, 201, DATE '2024-01-10')
 INTO orders_1702 VALUES (3, 201, DATE '2024-01-20')

 INTO orders_1702 VALUES (4, 202, DATE '2024-01-05')
 INTO orders_1702 VALUES (5, 202, DATE '2024-01-15')
SELECT 1 FROM dual;

--Task Status (Duration Calculation)
CREATE TABLE task_status (
    task_id INT,
    status_time TIMESTAMP,
    status VARCHAR(20)
);

INSERT ALL
 INTO task_status VALUES (1, TIMESTAMP '2024-01-01 09:00:00', 'OPEN')
 INTO task_status VALUES (1, TIMESTAMP '2024-01-01 11:00:00', 'IN_PROGRESS')
 INTO task_status VALUES (1, TIMESTAMP '2024-01-01 15:00:00', 'COMPLETED')

 INTO task_status VALUES (2, TIMESTAMP '2024-01-02 10:00:00', 'OPEN')
 INTO task_status VALUES (2, TIMESTAMP '2024-01-02 12:00:00', 'IN_PROGRESS')
SELECT 1 FROM dual;

--Product Prices (Price Trend)
CREATE TABLE product_prices (
    product_id INT,
    price_date DATE,
    price NUMBER(10,2)
);

INSERT ALL
 INTO product_prices VALUES (301, DATE '2024-01-01', 100)
 INTO product_prices VALUES (301, DATE '2024-01-05', 110)
 INTO product_prices VALUES (301, DATE '2024-01-10', 105)

 INTO product_prices VALUES (302, DATE '2024-01-01', 200)
 INTO product_prices VALUES (302, DATE '2024-01-05', 210)
SELECT 1 FROM dual;

--Purchases (Next Purchase Date)
CREATE TABLE purchases (
    purchase_id INT,
    customer_id INT,
    purchase_date DATE
);

INSERT ALL
 INTO purchases VALUES (1, 401, DATE '2024-01-01')
 INTO purchases VALUES (2, 401, DATE '2024-01-15')
 INTO purchases VALUES (3, 401, DATE '2024-02-01')

 INTO purchases VALUES (4, 402, DATE '2024-01-10')
SELECT 1 FROM dual;

--Meetings (Overlap Detection)
CREATE TABLE meetings (
    meeting_id INT,
    start_time TIMESTAMP,
    end_time TIMESTAMP
);

INSERT ALL
 INTO meetings VALUES (1, TIMESTAMP '2024-01-01 09:00:00', TIMESTAMP '2024-01-01 10:00:00')
 INTO meetings VALUES (2, TIMESTAMP '2024-01-01 09:30:00', TIMESTAMP '2024-01-01 11:00:00')
 INTO meetings VALUES (3, TIMESTAMP '2024-01-01 11:30:00', TIMESTAMP '2024-01-01 12:30:00')
SELECT 1 FROM dual;

--Employee Status (Change Detection)
CREATE TABLE employee_status (
    employee_id INT,
    status VARCHAR(20),
    status_date DATE
);

INSERT ALL
 INTO employee_status VALUES (501, 'ACTIVE', DATE '2024-01-01')
 INTO employee_status VALUES (501, 'ACTIVE', DATE '2024-01-10')
 INTO employee_status VALUES (501, 'INACTIVE', DATE '2024-01-20')

 INTO employee_status VALUES (502, 'ACTIVE', DATE '2024-01-05')
SELECT 1 FROM dual;
