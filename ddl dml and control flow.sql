/*DML*/
select top 20 * from HumanResources.Department

/* insert into */
insert into HumanResources.Department(Name, GroupName, ModifiedDate)
Values('Payroll', 'Executive General and administration', '02/15/2021');

/* insert into */
insert into HumanResources.Department(Name, GroupName, ModifiedDate)
Values('Managed Investments', 'Corporate Solutions', '02/15/2021');

/*update statement */
update HumanResources.Department
set Name = Name + ' Asia'
where DepartmentID = 20;

/* Delete */
delete from HumanResources.Department
where DepartmentID=20;

/*CAST and convert*/
SELECT CAST(25.65 AS int);
SELECT CAST(25.65 AS varchar);
SELECT CAST('2017-08-25' AS datetime);
SELECT CONVERT(int, 25.65);
SELECT CONVERT(varchar, 25.65);
SELECT CONVERT(datetime, '2017-08-25');
SELECT CONVERT(varchar, '2017-08-25', 101);

select top(10) SalesOrderNumber, TotalDue,
CAST(TotalDue as decimal(10,2)) as TotalDueCast
from Sales.SalesOrderHeader ;


/*DDL*/
