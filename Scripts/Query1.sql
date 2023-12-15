select e.firstName, e.lastName , e.title, m.firstName AS ManagerFirstName, m.lastName AS ManagerLastName
from employee e 
  inner join employee m on e.managerId = m.employeeId

select e.firstName, lastName
 from employee e 
  left join sales s on e.employeeId = s.employeeId
where s.salesId is null
and e.title = 'Sales Person'

SELECT name FROM sqlite_master WHERE type='table';

select salesAmount , soldDate, firstName, lastName, address, city, zipcode, email 
from sales s 
inner join customer c on s.customerId = c.customerId
UNION
select salesAmount , soldDate, firstName, lastName, address, city, zipcode, email 
from sales s 
left join customer c on s.customerId = c.customerId
where c.customerId is null
UNION
select salesAmount , soldDate, firstName, lastName, address, city, zipcode, email 
from customer c 
left join sales s on s.customerId = c.customerId
where s.customerId is null

select e.employeeId, e.firstName, e.lastName, count(s.salesId) as SalesCount
from employee e
  inner join sales s on e.employeeId = s.employeeId
group by e.employeeId, e.firstName, e.lastName
order by salescount desc

select e.employeeId, e.firstName, e.lastName, min(s.salesAmount) as Least, MAX(s.salesAmount) AS Most
from employee e
  inner join sales s on e.employeeId = s.employeeId
--where s.soldDate BETWEEN '2022-01-01' and '2022-12-31'
where s.soldDate >= date('now', 'start of year')
group by e.employeeId, e.firstName, e.lastName

select e.employeeId, e.firstName, e.lastName
from employee e
  inner join sales s on e.employeeId = s.employeeId
--where s.soldDate BETWEEN '2022-01-01' and '2022-12-31'
where s.soldDate >= date('now', 'start of year')
group by e.employeeId, e.firstName, e.lastName
having count(*) > 5


with salesperyear 
AS
(select strftime('%Y', soldDate) as salesYear, salesAmount from sales)

select salesYear, sum(salesAmount) AS salesAmount from salesperyear group by salesYear order by salesYear

SELECT employeeId, firstName, lastName, [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12]
from (
  select e.employeeId, e.firstName, e.lastName, strftime('%m', salesmonth) as salesmonth
  from employee e
    inner join sales s on e.employeeId = s.employeeId
  where s.soldDate BETWEEN '2021-01-01' and '2021-12-31'
) as src
PIVOT (count(*) for salesmonth in ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12])) as pvt


group by e.employeeId, e.firstName, e.lastName