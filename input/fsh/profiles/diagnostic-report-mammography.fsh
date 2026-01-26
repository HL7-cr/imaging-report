Profile: CRDiagnosticReportMammography
Parent: DiagnosticReport
Id: cr-diagnostic-report-mammography
Title: "CR Diagnostic Report - Mammography"
Description: "Perfil de Reporte Diagnóstico para estudios de Mamografía en Costa Rica. Incluye clasificación BI-RADS para evaluación de riesgo oncológico."

* category 1..*
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "coding.system"
* category ^slicing.rules = #open
* category contains radiology 1..1
* category[radiology].coding.system = $DiagnosticServiceSectionsCS
* category[radiology].coding.code = #RAD
* code from $ReportCodesSet (extensible)
* code ^binding.description = "Tipo de reporte de Mamografía"
* subject 1..1
* subject only Reference(Patient)
* effective[x] 1..1
* effective[x] only dateTime or Period
* issued 1..1
* performer 1..*
* performer only Reference(Practitioner or Organization)
* resultsInterpreter only Reference(Practitioner)
* specimen only Reference(Specimen)
* result only Reference(Observation)
* conclusion 0..1
* conclusionCode only CodeableConcept
* conclusionCode from $DiagnosticFindingsSet (extensible)
* presentedForm 0..*
* basedOn only Reference(ServiceRequest)
* encounter only Reference(Encounter)
