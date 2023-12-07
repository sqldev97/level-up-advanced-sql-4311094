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