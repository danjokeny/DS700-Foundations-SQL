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

/* this is an left outer join */
  select  p.Title, p.FirstName, p.MiddleName, p.LastName , 
  e.HireDate, e.JobTitle, e.BirthDate, e.MaritalStatus, e.Gender, p.PersonType, p.BusinessEntityID
  from Person.Person as p
	left join HumanResources.Employee as e
	on p.BusinessEntityID = e.BusinessEntityID
order by p.LastName;
  
  select top 10 * from HumanResources.Employee;
  select top 10 * from Person.Person