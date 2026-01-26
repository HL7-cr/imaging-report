Extension: CRHL7IDRPatientHistory
Id: cr-hl7idr-patient-history
Title: "HL7 IDR Patient History"
Description: "Historial del paciente relevante al estudio de imágenes médicas."
* ^url = "http://fhir.org.cr/hl7/imaging-report/StructureDefinition/hl7idr-patient-history"
* ^context.type = #element
* ^context.expression = "DiagnosticReport"
* value[x] only Reference(Observation)
