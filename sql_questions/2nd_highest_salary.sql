--2nd highest salary 
--Use dense_rank()

select empno,ename,sal 
	from (
		select empno,ename,sal, dense_rank() over (order by sal desc) rnk
	) where rnk=2;

--Logic 
--Rank salaries in descending order and pick 2

