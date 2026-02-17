--Data Prep
CREATE TABLE stock_prices (
    stock_symbol VARCHAR(10),
    trade_date DATE,
    close_price DECIMAL(10,2)
);

INSERT ALL
  INTO stock_prices (stock_symbol, trade_date, close_price) VALUES ('AAPL', DATE '2024-01-01', 150.00)
  INTO stock_prices (stock_symbol, trade_date, close_price) VALUES ('AAPL', DATE '2024-01-02', 152.50)
  INTO stock_prices (stock_symbol, trade_date, close_price) VALUES ('AAPL', DATE '2024-01-03', 151.00)
  INTO stock_prices (stock_symbol, trade_date, close_price) VALUES ('AAPL', DATE '2024-01-04', 155.00)
  INTO stock_prices (stock_symbol, trade_date, close_price) VALUES ('AAPL', DATE '2024-01-05', 158.00)

  INTO stock_prices (stock_symbol, trade_date, close_price) VALUES ('GOOG', DATE '2024-01-01', 2700.00)
  INTO stock_prices (stock_symbol, trade_date, close_price) VALUES ('GOOG', DATE '2024-01-02', 2725.00)
  INTO stock_prices (stock_symbol, trade_date, close_price) VALUES ('GOOG', DATE '2024-01-03', 2710.00)
  INTO stock_prices (stock_symbol, trade_date, close_price) VALUES ('GOOG', DATE '2024-01-04', 2735.00)
  INTO stock_prices (stock_symbol, trade_date, close_price) VALUES ('GOOG', DATE '2024-01-05', 2750.00)
SELECT 1 FROM dual;

select * from stock_prices;

--previous day price
select TRADE_DATE, close_price,lag(close_price) over (partition by stock_symbol order by trade_date) as prev_day_price,stock_symbol
from stock_prices;

--next day price
select stock_symbol,TRADE_DATE,close_price,
lead(close_price) over (partition by stock_symbol order by trade_date) as next_day_price
from stock_prices;

--daily price change
select
    stock_symbol,
    trade_date,
    close_price,
    close_price - lag(close_price) over (partition by stock_symbol order by trade_date) as daily_price_change
    from stock_prices;
    
--Identify price increase or decrease
select
    stock_symbol,
    trade_date,
    close_price,
    case
        when close_price > LAG(close_price) over (partition by stock_symbol order by trade_date) then 'UP'
        when close_price < LAG(close_price) over (partition by stock_symbol order by trade_date) then 'DOWN'
        else 'NO CHANGE'
    end as trend
from stock_prices;
