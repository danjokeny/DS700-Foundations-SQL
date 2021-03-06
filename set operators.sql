
/* this is a union */
Select p.BusinessEntityID, p.FirstName, p.LastName
from Person.Person as p
where p.FirstName like 'D%'

Union 

Select p.BusinessEntityID, p.FirstName, p.LastName
from Person.Person as p
where p.FirstName like 'E%';

/* this is a intersect */
Select p.BusinessEntityID, p.FirstName, p.LastName
from Person.Person as p
where p.FirstName like '%a%'

intersect 

Select p.BusinessEntityID, p.FirstName, p.LastName
from Person.Person as p
where p.FirstName like '%b%';


/* this is a except */
Select p.BusinessEntityID, p.FirstName, p.LastName
from Person.Person as p
where p.FirstName like '%a%'

except 

Select p.BusinessEntityID, p.FirstName, p.LastName
from Person.Person as p
where p.FirstName like '%b%';