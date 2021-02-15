
/* this is a union */
Select p.BusinessEntityID, p.FirstName, p.LastName
from Person.Person as p
where p.FirstName like 'D%'

Union 

Select p.BusinessEntityID, p.FirstName, p.LastName
from Person.Person as p
where p.FirstName like 'E%'