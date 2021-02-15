/****** Script for SelectTopNRows command from SSMS  ******/
SELECT DepartmentID,GroupName, name
  FROM HumanResources.Department
  order by GroupName, Name

/* this is an inner join */
  select  p.BusinessEntityID, p.FirstName + ' ' + p.LastName as 'Name', phone.PhoneNumber
  from Person.Person as P
	inner join Person.PersonPhone as phone
	on p.BusinessEntityID = phone.BusinessEntityID
  order by 'Name';

/* this is an left outer join 
all people, regardless if they are employees or not 19K rows*/
  select  p.Title, p.FirstName, p.MiddleName, p.LastName , 
  e.HireDate, e.JobTitle, e.BirthDate, e.MaritalStatus, e.Gender, p.PersonType, p.BusinessEntityID
  from Person.Person as p
	left join HumanResources.Employee as e
	on p.BusinessEntityID = e.BusinessEntityID
order by p.LastName;
  
  select top 10 * from HumanResources.Employee;
  select top 10 * from Person.Person

  /* this is an right outer join 
  only the 290 employees are returned */
  select  p.Title, p.FirstName, p.MiddleName, p.LastName , 
  e.HireDate, e.JobTitle, e.BirthDate, e.MaritalStatus, e.Gender, p.PersonType, p.BusinessEntityID
  from Person.Person as p
	right join HumanResources.Employee as e
	on p.BusinessEntityID = e.BusinessEntityID
order by p.LastName;

  /* this is an full outer join 
  over 19K returned all rows on both tables */
  select  p.Title, p.FirstName, p.MiddleName, p.LastName , 
  e.HireDate, e.JobTitle, e.BirthDate, e.MaritalStatus, e.Gender, p.PersonType, p.BusinessEntityID
  from Person.Person as p
	full join HumanResources.Employee as e
	on p.BusinessEntityID = e.BusinessEntityID
order by p.LastName;

  /* this is an full outer join 
 gets all people and employee rates */
  select  p.Title, p.FirstName, p.MiddleName, p.LastName , 
  eph.Rate, eph.RateChangeDate,  p.PersonType, p.BusinessEntityID
  from Person.Person as p
	full join HumanResources.EmployeePayHistory as eph
	on p.BusinessEntityID = eph.BusinessEntityID
order by p.LastName;

select top 10 * from HumanResources.EmployeePayHistory;

/* cross join -- this is a cartesian product*/
select  c1.Name, c2.Name from person.ContactType c1
cross join person.ContactType c2;


select  * from person.ContactType;