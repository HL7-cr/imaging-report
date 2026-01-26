Profile: CRProcedureImagingAcquisition
Parent: Procedure
Id: cr-procedure-imaging-acquisition
Title: "CR Procedure - Imaging Acquisition"
Description: "Perfil para procedimientos de adquisición de imágenes médicas en Costa Rica."

* status 1..1 MS
* category 1..1 MS
* category.coding.system = "http://snomed.info/sct"
* code 1..1 MS
* code from $ReportCodesSet (extensible)
* subject only Reference(Patient)
* subject 1..1 MS
* performer 0..* MS
* performer.actor only Reference(Practitioner or Device)
* location only Reference(Location)
* note 0..*
* statusReason only CodeableConcept
* outcome only CodeableConcept
* report only Reference(DiagnosticReport)

* extension contains DICOMInstanceUID named dicomInstanceUid 0..* MS
* extension[dicomInstanceUid] ^short = "Información DICOM del procedimiento"
