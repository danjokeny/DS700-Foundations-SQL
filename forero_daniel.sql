

  /*DS700 Foundations of Data Science
Daniel Forero */

use ScrubsHospital;

/* Question 1 
1.	List the details of all nurses. In your output, generate an additional column called “Comment” and populate it with the text “Send registration reminder” if the nurse is not registered. [5pt] */
SELECT N.EmployeeID, N.Name Nurse, N.Position,  N.Registered, N.SSN,
  	case
		when N.Registered = 0 then 'Send registration reminder'
	end as Comment
  FROM [ScrubsHospital].[dbo].[Nurse] as N;

/*Question 2
2.	List all the departments and their head’s names along with the position of the head. [5pt]  */
Select D.Name Department, P.Name DeptHead, P.Position
from [ScrubsHospital].[dbo].[Department] as D, [ScrubsHospital].[dbo].Physician as P
where D.head = P.EmployeeID;


/*Question 3
3.	List the names of all patients and the number of appointments they have made where the examination room was “A”. [5pt] */
select P.Name,count( case
						when convert(varchar,A.ExaminationRoom) = 'A' then 1
					end ) 'count appts in room A'
from [ScrubsHospital].[dbo].Patient as P, [ScrubsHospital].[dbo].Appointment as A
where P.SSN = A.Patient 
group by P.Name;


/*Question 4
4.	List all the unique patient names who got an appointment in room “B”. [5pt] */
select distinct P.Name, convert(varchar(max),A.ExaminationRoom) ExamRoom
from [ScrubsHospital].[dbo].Patient as P, [ScrubsHospital].[dbo].Appointment as A
where P.SSN = A.Patient 
and convert(varchar(max),A.ExaminationRoom) = 'B';

/*Question 5
5.	List the names of all physicians who are trained in a particular medical procedure along with the name of the procedure. 
Also list their certification expiration date. You should have the following columns in your output- Physician name, Med Procedure Name, Certificate expiration. [10pt] */
Select P.Name Physician, MP.Name MedicalProcedure, T.CertificationExpires
from [ScrubsHospital].[dbo].Physician as P, [ScrubsHospital].[dbo].Trained_In as T, [ScrubsHospital].[dbo].MedProcedures as MP
where p.EmployeeID = T.Physician
and	T.Treatment = MP.Code;

/* Question 6
6.	List all the physicians with department who are not affiliated. Your output should contain columns with the names – Physician name, Department Name, Physician Position. [10pt]*/
Select P.Name Physicians, D.Name Department, P.Position
from [ScrubsHospital].[dbo].Physician as P, [ScrubsHospital].[dbo].Department as D, [ScrubsHospital].[dbo].Affiliated_With as A
where A.PrimaryAffiliation = 0 
and A.Physician = p.EmployeeID
and A.Department = D.DepartmentID;

/*Question 7
7.	List the names of patients and their PCP only if their PCP is trained in a medical procedure. [10pt]*/
select distinct P.Name Patient, DR.Name PCP
from [ScrubsHospital].[dbo].Patient as P, [ScrubsHospital].[dbo].Trained_In as T, [ScrubsHospital].[dbo].Physician as DR
where P.PCP = T.Physician
and  DR.EmployeeID = P.PCP;


/*Question 8
8.	List the names of patients and the number of physicians they have taken appointments with only if the number of physicians is greater than 1. [10pt]*/
select  P.Name Patient, COUNT( distinct A.Physician) PhysicianCount
from [ScrubsHospital].[dbo].Patient as P, [ScrubsHospital].[dbo].Appointment as A, [ScrubsHospital].[dbo].Physician as DR
where P.SSN = A.Patient
and A.Physician = DR.EmployeeID
group by P.Name
having COUNT( distinct A.Physician) > 1
order by  P.Name;


/*Qestion 9
9.	List all the patients along with their physician names, nurse names and room numbers when the patient has an appointment anytime between 4/21/2019 and 4/24/2019. [10pt]*/
select P.Name Patient, DR.Name Physician, N.Name Nurse, A.ExaminationRoom 'Room Number'
from [ScrubsHospital].[dbo].Appointment as A, [ScrubsHospital].[dbo].Patient as P, [ScrubsHospital].[dbo].Physician as DR, [ScrubsHospital].[dbo].Nurse as N
where A.Start > convert(date,'2019-04-20',102)
and A.[End] < convert(date,'2019-04-25',102)
and A.Patient = P.SSN
and A.Physician = DR.EmployeeID
and A.PrepNurse = N.EmployeeID;

/*Question 10 
10.	List all the patient names and their medications for patients who did not make an appointment. [10pt] */
Select P.Name Patient, MED.Name Medication
from [ScrubsHospital].[dbo].Patient as P, [ScrubsHospital].[dbo].Prescribes as RX, [ScrubsHospital].[dbo].Medication as MED
where P.SSN = RX.Patient
and RX.Medication = MED.Code
and RX.Appointment is null;


/*Question 11
11.	List the count of number of rooms that are unavailable on each block on each floor. 
Make sure to order the list by floor and block number. 
Your output should have the columns – “Floor”, “Block” and “# of unavailable rooms” [10pt]*/

select R.BlockFloor as Floor, R.BlockCode as Block, sum( ( case
											when R.Unavailable = 1 then 1
											else 0		
											end )  ) as '# of unavailable rooms'
from [ScrubsHospital].[dbo].Room as R
group by R.BlockFloor, R.BlockCode
order by R.BlockFloor, R.BlockCode;



/*Question 12
12.	List the floor where there are minimum number of rooms unavailable. 
Your output should have the floor number, max number of rooms 
possible on the floor and the number of rooms unavailable. [10pt]*/
select top 1 * from (
	select R.BlockFloor AS Floor, count(  R.Unavailable  ) as 'Max # of rooms on the floor', 
			sum( ( case
					when R.Unavailable = 1 then 1
					else 0		
					end )  ) as NumRoomsUnavail
	from [ScrubsHospital].[dbo].Room as R
	group by R.BlockFloor) as MinUnavail 
order by NumRoomsUnavail;




 