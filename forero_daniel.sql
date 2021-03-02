

  /*DS700 Foundations of Data Science
Daniel Forero */

/* Question 1 
1.	List the details of all nurses. In your output, generate an additional column called “Comment” and populate it with the text “Send registration reminder” if the nurse is not registered. [5pt] */
SELECT N.EmployeeID, N.Name, N.Position,  N.Registered, N.SSN,
  	case
		when N.Registered = 0 then 'Send registration reminder'
	end as Comment
  FROM [ScrubsHospital].[dbo].[Nurse] as N;

/*Question 2
2.	List all the departments and their head’s names along with the position of the head. [5pt]  */
Select D.Name, P.Name, P.Position
from [ScrubsHospital].[dbo].[Department] as D, [ScrubsHospital].[dbo].Physician as P
where D.head = P.EmployeeID;


/*Question 3
3.	List the names of all patients and the number of appointments they have made where the examination room was “A”. [5pt] */
select P.Name, A.ExaminationRoom
from [ScrubsHospital].[dbo].Patient as P, [ScrubsHospital].[dbo].Appointment as A
where P.SSN = A.Patient and
	  A.ExaminationRoom like 'A';


/*Question 4
4.	List all the unique patient names who got an appointment in room “B”. [5pt] */


