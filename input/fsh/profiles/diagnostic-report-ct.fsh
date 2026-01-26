Profile: CRDiagnosticReportCT
Parent: DiagnosticReport
Id: cr-diagnostic-report-ct
Title: "CR Diagnostic Report - CT (Computed Tomography)"
Description: "Perfil de Reporte Diagnóstico para estudios de Tomografía Computarizada (TC) en Costa Rica."

* category 1..*
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "coding.system"
* category ^slicing.rules = #open
* category contains radiology 1..1
* category[radiology].coding.system = "http://terminology.hl7.org/CodeSystem/diagnostic-service-sections"
* category[radiology].coding.code = #RAD
* code from http://terminology.hl7.org/ValueSet/report-codes (extensible)
* code ^binding.description = "Tipo de reporte de Tomografía Computarizada"
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
* presentedForm 0..*
* basedOn only Reference(ServiceRequest)
* encounter only Reference(Encounter)
