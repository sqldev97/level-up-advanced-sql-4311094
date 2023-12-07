select e.firstName, e.lastName , m.firstName, m.lastName
from employee e 
  left join employee m on e.employeeId = m.managerId

  select * from employee where firstName = 'Wilie'