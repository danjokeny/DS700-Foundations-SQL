

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

select pv.encounter_id pv_enc, pv.patient_nbr pv_patient_nbr,
vs.admission_type_id vs_admission_type, vs.discharge_disposition_id vs_discharge_disp, vs.admission_source_id vs_admission_source,
vs.time_in_hospital vs_time_in_hosp, vs.payer_code vs_payer, vs.medical_specialty vs_med_sepcialty, vs.readmitted vs_readmitted,
vvs.age vvs_age, vvs.weight vvs_weight, vvs.race vvs_race, vvs.gender vvs_gender,
vd.diag_1 vd_diag1, vd.diag_2 vd_diag2, vd.diag_3 vd_diag3, vd.number_diagnoses vd_num_diag,
vm.max_glu_serum vm_max_glu_serum, vm.A1Cresult vm_A1C, vm.metformin vm_metaformin, 
vm.repaglinide vm_repaglinide, vm.chlorpropamide vm_chlorpropamide, vm.acetohexamide vm_acetohexamide,
vm.glipizide vm_glipizide, vm.glyburide vm_glyburide, vm.tolbutamide vm_tolbutamide,
vm.pioglitazone vm_pioglitazone, vm.rosiglitazone vm_rosiglitazone, vm.acarbose vm_acarbose,
vm.miglitol vm_miglitol, vm.troglitazone vm_troglitazone, vm.tolazamide vm_tolazamide, 
vm.examide vm_examide, vm.citoglipton vm_citoglipton, vm.insulin vm_insulin, 
vm.glyburide_metformin vm_glyburide_metformin, vm.glipizide_metformin vm_glipizide_metformin,
vm.glimepiride_pioglitazone vm_glimepiride_pioglitazone, vm.metformin_rosiglitazone vm_metformin_rosiglitazone, 
vm.metformin_pioglitazone vm_metformin_pioglitazone, vm.change vm_change, vm.diabetesMed vm_diabetesMed,
vsc.num_lab_procedures vsc_num_lab_proc, vsc.num_procedures vsc_num_proc, 
vsc.num_medications vsc_num_meds, vsc.number_outpatient vsc_num_outpatient, 
vsc.number_emergency vsc_num_emergency, vsc.number_inpatient vsc_num_inpatient
from PatientVisit as pv, VisitSummary as vs, VisitVitalStat as vvs, VisitDiagnostic as vd,
	 VisitMedication as vm, VisitSummaryCount as vsc
where pv.encounter_id = vs.encounter_id
and pv.encounter_id = vvs.encounter_id
and pv.encounter_id = vd.encounter_id
and pv.encounter_id = vm.encounter_id
and pv.encounter_id = vsc.encounter_id
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

