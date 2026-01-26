Profile: CRCompositionImagingReport
Parent: Composition
Id: cr-composition-imaging-report
Title: "CR Composition - Imaging Report"
Description: "Composición para el documento de reporte de imágenes médicas en Costa Rica. Contiene el texto narrativo estructurado del reporte."

* type = $LOINC#72134-0  // "Radiology Report"
* status 1..1 MS
* subject only Reference(Patient)
* subject 1..1 MS
* date 1..1 MS
* author 1..* MS
* author only Reference(Practitioner or Device)
* title 1..1 MS

* section 1..* MS
* section.title 1..1 MS
* section.code 1..1 MS
* section.code from $ReportCodesSet (extensible)
* section.text 1..1 MS
* section.entry only Reference(ImagingStudy or Observation)

* identifier 0..1

* extension contains CRHL7IDRImpression named impression 0..* MS
* extension[impression] ^short = "Impresión radiológica del reporte"

* extension contains CRHL7IDRRecommendation named recommendation 0..* MS
* extension[recommendation] ^short = "Recomendaciones derivadas del estudio"

* extension contains CRHL7IDRPatientHistory named patientHistory 0..* MS
* extension[patientHistory] ^short = "Historial relevante del paciente"
