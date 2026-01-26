Extension: CRHL7IDRRecommendation
Id: cr-hl7idr-recommendation
Title: "HL7 IDR Recommendation"
Description: "Recomendaciones radiológicas derivadas del reporte de imágenes."
* ^url = "http://fhir.org.cr/hl7/imaging-report/StructureDefinition/hl7idr-recommendation"
* ^context.type = #element
* ^context.expression = "DiagnosticReport"
* value[x] only Reference(CarePlan or ServiceRequest)
