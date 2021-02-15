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
create table person.Superhero
(heroID int, 
heroName varchar(50), 
secretIdentity varchar(50),
Universe varchar(25), 
city  varchar(50)
);

Select * from Person.Superhero

insert into Person.Superhero(heroID, heroName, secretIdentity, Universe, city)
Values(1, 'Superman', 'clark kent', 'DC', 'Metropolis');
insert into Person.Superhero(heroID, heroName, secretIdentity, Universe, city)
Values(2, 'Batman', 'bruce wayne', 'DC', 'Gotham');
insert into Person.Superhero(heroID, heroName, secretIdentity, Universe, city)
Values(3, 'Hulk', 'bruce banner', 'Marvel', 'NYC');
insert into Person.Superhero(heroID, heroName, secretIdentity, Universe, city)
Values(4, 'Captain America', 'Steve Rogers', 'Marvel', 'Brooklyn');
insert into Person.Superhero(heroID, heroName, secretIdentity, Universe, city)
Values(5, 'Godzilla', 'go jira', 'MonsterVerse', 'Tokyo');

/*update statement */
update Person.Superhero
set heroName = 'Superman'
where heroID = 1;

alter table Person.Superhero
alter column cityLoc varchar(100);

if (DATENAME(M, getdate()) = 'February')
begin
	select 'Happy birthday Dawn' as results
end
else
begin
	select 'not your birthday Dawn' as results
end

Select s.heroName, s.secretIdentity, s.Universe, s.city,
	case
		when universe = 'DC' then 'DC TV Rocks!'
		when universe = 'Marvel' then 'Marvel movies are better'
		else 'what universe are you from?'
	end as UniverseInterpreted
from Person.Superhero as s;
