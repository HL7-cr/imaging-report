Extension: CRHL7IDRPatientHistory
Id: cr-hl7idr-patient-history
Title: "HL7 IDR Patient History"
Description: "Historial del paciente relevante al estudio de imágenes médicas."
* ^url = "https://hl7.or.cr/fhir/imaging-report/StructureDefinition/cr-hl7idr-patient-history"
* ^context.type = #element
* ^context.expression = "DiagnosticReport"
* value[x] only Reference(Observation)
