Profile: CRDiagnosticReportUltrasound
Parent: DiagnosticReport
Id: cr-diagnostic-report-ultrasound
Title: "CR Diagnostic Report - Ultrasound (Ecography)"
Description: "Perfil de Reporte Diagnóstico para estudios de Ultrasonido (Ecografía) en Costa Rica. Estructura alineada con EU IG para interoperabilidad internacional."

* identifier 1..* MS
* status 1..1 MS
* status = #final (exactly)

* category 1..*
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "coding.system"
* category ^slicing.rules = #open
* category contains ultrasound 1..1
* category[ultrasound].coding.system = $DiagnosticServiceSectionsCS
* category[ultrasound].coding.code = #US

* code 1..1 MS
* code from $ReportCodesSet (extensible)
* code ^binding.description = "Tipo de reporte de Ultrasonido"

* subject 1..1 MS
* subject only Reference(Patient)

* effective[x] 1..1 MS
* effective[x] only dateTime or Period

* issued 1..1 MS

* performer 1..* MS
* performer only Reference(Practitioner or Organization)

* resultsInterpreter only Reference(Practitioner)

* specimen only Reference(Specimen)

* result only Reference(Observation)

* study only Reference(ImagingStudy)

* composition 1..1 MS
* composition only Reference(Composition)

* conclusion 0..1

* conclusionCode only CodeableConcept
* conclusionCode from $DiagnosticFindingsSet

* presentedForm 0..*

* basedOn 0..* MS
* basedOn only Reference(ServiceRequest)

* encounter only Reference(Encounter)

* extension contains DICOMInstanceUID named dicomInstanceUid 0..* MS
* extension[dicomInstanceUid] ^short = "Información de acceso a imágenes DICOM"
* extension[dicomInstanceUid] ^definition = "Información DICOM para acceder a las imágenes de Ultrasonido (UID de instancia, URL de acceso)"

* extension contains CRHL7IDRImpression named impression 0..* MS
* extension[impression] ^short = "Impresión radiológica del reporte"
* extension[impression] ^definition = "Interpretación profesional del radiólogo sobre los hallazgos"

* extension contains CRHL7IDRRecommendation named recommendation 0..* MS
* extension[recommendation] ^short = "Recomendaciones radiológicas"
* extension[recommendation] ^definition = "Acciones clínicas recomendadas basadas en los hallazgos"

* extension contains CRHL7IDRPatientHistory named patientHistory 0..* MS
* extension[patientHistory] ^short = "Historial del paciente relevante"
* extension[patientHistory] ^definition = "Información clínica previa que contextualiza el estudio"
