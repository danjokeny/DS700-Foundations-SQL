

  /*DS700 Foundations of Data Science
  Final project SQL file
Daniel Forero */

use Diabetes;

/*
1.	Write and execute a SQL query to list 
all patient numbers and encounter ids which do not have any data (missing rows) in VisitSummary table. Order the result by patient number, encounter id. [10PTS]
*/

select p.patient_nbr
from Patient as p
where p.patient_nbr NOT IN
	(select pv.patient_nbr
	from VisitSummary as vs, PatientVisit as pv
	where vs.encounter_id = pv.encounter_id )


/*2.	Write and execute a SQL query to list all patients whose information about race or gender has changed during their future visits. 
A future visit is defined as T1.encounter_id < T2.encounter_id.  
Your output should have patient number, old and new race values, old and new gender values, and the encounter ids. [10PTS]*/

select pv.patient_nbr, pv.encounter_id, pv2.encounter_id, 
vvs.encounter_id, vvs2.encounter_id,
vvs.race, vvs2.race, 
vvs.gender, vvs2.gender
from  PatientVisit as pv, PatientVisit as pv2, VisitVitalStat as vvs, VisitVitalStat as vvs2
where pv.patient_nbr = pv2.patient_nbr
and pv.encounter_id < pv2.encounter_id
and pv.encounter_id = vvs.encounter_id
and pv2.encounter_id = vvs2.encounter_id
and ((vvs.race != vvs2.race) or (vvs.gender != vvs2.gender))
and pv.patient_nbr = 453267


/*3.	Write and execute a SQL query to list all the patient data for all encounters. 
Even if patient data is missing in other tables, you still need to list the patient_nbr and encounter_id 
in your output. Your output should list all the columns (without repeating them) starting with 
encounter_id, patient_nbr… and it should be ordered by patient_nbr and then encounter_id. [10PTS]*/

select pv.encounter_id pv_enc, pv.patient_nbr pv_patient_nbr
from PatientVisit as pv
order by pv_patient_nbr, pv_enc


select top 10 * from patient as p 
select top 10 * from PatientVisit as pv
select top 10 * from VisitSummary as vs
select top 10 * from VisitVitalStat as vvs

select top 10 * from VisitDiagnostic as vd
select top 10 * from VisitMedication as vm
select top 10 * from VisitSummaryCount as vsc




select count(*) from patient as p 
select count(*) from PatientVisit as pv
select count(*) from VisitSummary as vs
select count(*) from VisitVitalStat as vvs

