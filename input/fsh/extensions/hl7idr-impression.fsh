Extension: CRHL7IDRImpression
Id: cr-hl7idr-impression
Title: "HL7 IDR Impression"
Description: "Impresión radiológica del reporte de imágenes médicas."
* ^url = "https://hl7.or.cr/fhir/imaging-report/StructureDefinition/cr-hl7idr-impression"
* ^context.type = #element
* ^context.expression = "DiagnosticReport"
* value[x] only Reference(Observation or Condition)
