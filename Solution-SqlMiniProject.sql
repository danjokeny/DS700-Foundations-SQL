/*
DS700 SQL Mini Project - Solution
Author: Praneet Tiwari
Email: tiwarip@uwgb.edu

P.S. Sharing of this SQL Mini project solution file is prohibited.
*/

/*1.	List the details of all nurses. In your output, generate an additional column called “Comment” and populate it with the text “Send registration reminder” 
			if the nurse is not registered. [5pt]*/
	SELECT EmployeeID, Name, Position, Registered, SSN,    
		(
			CASE Registered
  				WHEN 0 THEN 'Send Registration Email'
  				ELSE ''
			END
		) AS Comment
	FROM  Nurse;


/*2.	List all the departments and their head’s names along with the position of the head. [5pt]*/
	SELECT P.Name, P.Position, D.Name AS 'Department Head' 
	FROM Physician P
		INNER JOIN Department D ON P.EmployeeID = D.Head;

/*3.	List the names of all patients and the number of appointments they have made where the examination room was “A”. [5pt]*/
	SELECT P.Name AS Patient, COUNT(A.AppointmentID) AS 'Number of Appointments in room A'
	FROM Patient P
		INNER JOIN  Appointment A ON P.SSN = A.Patient
	WHERE A.ExaminationRoom LIKE 'A'
	GROUP BY P.Name;

/*4.	List all the unique patient names who got an appointment in room “B”. [5pt]*/
	SELECT DISTINCT P.Name AS Patient
	FROM Patient P
		INNER JOIN  Appointment A ON P.SSN = A.Patient
	WHERE A.ExaminationRoom LIKE 'B';

/*5.	List the names of all physicians who are trained in a particular medical procedure along with the name of the procedure. 
			Also list their certification expiration date. You should have the following columns in your output- Physician name, Med Procedure Name, Certificate expiration. [10pt]*/
	SELECT P.Name AS 'Physician Name', M.Name AS 'Med Procedure Name', T.CertificationExpires AS 'Certificate expiration'
	FROM Physician	P
		INNER JOIN Trained_In T ON P.EmployeeID = T.Physician
		INNER JOIN MedProcedures M ON T.Treatment = M.Code;

/*6.	List all the physicians with department who are not affiliated. Your output should contain columns with the names – Physician name, Department Name, 
			Physician Position. [10pt]*/
	SELECT P.Name 'Physician name', D.Name 'Department Name', P.Position 'Physician Position'
	FROM Affiliated_With A 
		INNER JOIN Physician P ON A.Physician = P.EmployeeID
		INNER JOIN Department D ON A.Department = D.DepartmentID
	WHERE PrimaryAffiliation = 0;

/*7.	List the names of patients and their PCP only if their PCP is trained in a medical procedure. [10pt]*/
	SELECT DISTINCT P.Name, Ph.Name
	FROM Patient P
		INNER JOIN Physician Ph ON P.PCP = Ph.EmployeeID
		INNER JOIN Trained_In T ON Ph.EmployeeID = T.Physician;
	
	-- Alternative using subquery
	
	SELECT P.Name, Ph.Name
	FROM Patient P
		INNER JOIN Physician Ph ON P.PCP = Ph.EmployeeID
	WHERE P.PCP in (SELECT Physician from Trained_In);
	

/*8.	List the names of patients and the number of physicians they have taken appointments with only if the number of physicians is greater than 1. [10pt]*/
	--Ideal answer would not double count the physicians
	SELECT P.Name, COUNT(DISTINCT A.Physician) 'Number of Physicians'
	FROM Patient P
		INNER JOIN Appointment A ON P.SSN = A.Patient
	GROUP BY P.Name
	HAVING COUNT(DISTINCT A.Physician) > 1;

	--Note: This is also acceptable as the requirement was not explicit
	
	SELECT P.Name, COUNT(A.Physician) 'Number of Physicians'
	FROM Patient P
		INNER JOIN Appointment A ON P.SSN = A.Patient
	GROUP BY P.Name
	HAVING COUNT(A.Physician) > 1;  --Note: DISTINCT was not used here
	

/*9.	List all the patients along with their physician names, nurse names and room numbers when the patient has an appointment anytime 
			between 4/21/2019 and 4/24/2019. [10pt]*/
	SELECT P.Name 'Patient', Ph.Name 'Physician', N.Name 'Nurse', A.ExaminationRoom
	FROM Patient P
		INNER JOIN Appointment A ON P.SSN = A.Patient
		INNER JOIN Physician Ph ON A.Physician = Ph.EmployeeID
		LEFT JOIN Nurse N ON A.PrepNurse = N.EmployeeID
	WHERE A.[Start] BETWEEN '2019-04-21' AND '2019-04-25'
		AND A.[End] BETWEEN '2019-04-21' AND '2019-04-25';

	--if the data did not have inconsistencies or if there was an exsting DB condition where start < end, we would ideally use-
	
	SELECT P.Name 'Patient', Ph.Name 'Physician', N.Name 'Nurse', A.ExaminationRoom
	FROM Patient P
		INNER JOIN Appointment A ON P.SSN = A.Patient
		INNER JOIN Physician Ph ON A.Physician = Ph.EmployeeID
		LEFT JOIN Nurse N ON A.PrepNurse = N.EmployeeID
	WHERE A.[Start] >= '2019-04-21' 
		AND A.[End] < '2019-04-25';
	

/*10.	List all the patient names and their medications for patients who did not make an appointment. [10pt]*/
	SELECT P.Name 'Patient Name', M.Name 'Medication Name'
	FROM Patient P
		INNER JOIN Prescribes Pr ON P.SSN = Pr.Patient
		INNER JOIN Medication M ON Pr.Medication = M.Code
	WHERE Pr.Appointment IS NULL;

/*11.	List the count of number of rooms that are unavailable on each block on each floor. Make sure to order the list by floor and block number. 
			Your output should have the columns – “Floor”, “Block” and “# of unavailable rooms” [10pt]*/
	SELECT R.BlockFloor 'Floor', R.BlockCode, COUNT(*) '# of unavailable rooms'
	FROM Room R
	WHERE R.Unavailable = 1
	GROUP BY BlockFloor, BlockCode
	ORDER BY BlockFloor, BlockCode;

/*12.	List the floor where there are minimum number of rooms unavailable. Your output should have the floor number, 
			max number of rooms possible on the floor and the number of rooms unavailable. [10pt]*/

	SELECT top 1 R.BlockFloor	AS 'Floor'		
		, (SELECT count(*) from Room R1 WHERE R1.BlockFloor = R.BlockFloor) AS 'Max number of rooms possible on the floor'
		, Count(*) AS 'Number of rooms unavailable'
	FROM Room R
	WHERE Unavailable = 1
	GROUP BY R.BlockFloor
	ORDER BY Count(*) ASC;

	-- Alternative

	SELECT TOP 1 B.BlockFloor AS 'Floor'
		, COUNT(R.BlockFloor) AS 'Max number of rooms possible on the floor'
		, SUM(CONVERT(int,R.Unavailable)) AS 'Number of rooms unavailable'
	FROM Block B 
		INNER JOIN Room R ON B.BlockCode = R.BlockCode AND B.BlockFloor = R.BlockFloor
	GROUP BY B.BlockFloor
	ORDER BY SUM(CONVERT(int,R.Unavailable));


