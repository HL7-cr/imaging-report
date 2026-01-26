Profile: CRDiagnosticReport
Parent: DiagnosticReport
Id: cr-diagnostic-report
Title: "CR Diagnostic Report"
Description: "Perfil unificado para reportes diagnósticos en Costa Rica: estudios de imagen (Rayos X, CT, MRI, Mamografía, Ultrasonido), laboratorio, patología, etc. Regla común: reporte final, soporte para Composition, y extensiones clínicas." 

* identifier 1..* MS
* status 1..1 MS
* status = #final (exactly)

* category 1..*
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "coding.system"
* category ^slicing.rules = #open
* category contains radiology 1..1
* category[radiology].coding.system = $DiagnosticServiceSectionsCS
* category[radiology].coding.code = #RAD

* code 1..1 MS
* code from $ReportCodesSet (extensible)
* code ^binding.description = "Tipo de reporte diagnóstico (todos los tipos: imaging, lab, patología, etc.)"

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

* composition 0..1
* composition only Reference(Composition)

* conclusion 0..1

* conclusionCode only CodeableConcept
* conclusionCode from $DiagnosticFindingsSet

* presentedForm 0..*

* basedOn 0..* MS
* basedOn only Reference(ServiceRequest)

* encounter only Reference(Encounter)

// Extensión DICOM para UIDs y acceso web (opcional, para estudios de imagen)
* extension contains DICOMInstanceUID named dicomInstanceUid 0..* 
* extension[dicomInstanceUid] ^short = "Información de acceso a imágenes DICOM"
* extension[dicomInstanceUid] ^definition = "Información DICOM para acceder a las imágenes (UIDs y URL de acceso) - aplica principalmente a estudios radiológicos"

// Extensiones HL7IDR para contenido clínico (opcional)
* extension contains CRHL7IDRImpression named impression 0..* 
* extension[impression] ^short = "Impresión clínica del reporte"
* extension[impression] ^definition = "Interpretación profesional sobre los hallazgos"

* extension contains CRHL7IDRRecommendation named recommendation 0..* 
* extension[recommendation] ^short = "Recomendaciones clínicas"
* extension[recommendation] ^definition = "Acciones clínicas recomendadas basadas en los hallazgos"

* extension contains CRHL7IDRPatientHistory named patientHistory 0..* 
* extension[patientHistory] ^short = "Historial del paciente relevante"
* extension[patientHistory] ^definition = "Información clínica previa que contextualiza el estudio"
