--Find duplicate salaries
select sal, count(*) from emp
group by sal
having count(*) > 1;

--Logic
--Group by column
--If count > 1 → duplicate exists