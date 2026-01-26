/* ------------------------------------------------------------------ 
 @type:         FSH-File for FHIR® Instance
 @about:        Ejemplo de Reporte Diagnóstico X-Ray con Acceso a Imágenes DICOM
 @created by:   National Working Group for FHIR® - Costa Rica
 @date:         2026-01-26
--------------------------------------------------------------------*/

Instance: diagnostic-report-xray-with-dicom-example
InstanceOf: CRDiagnosticReportXRay
Usage: #example
Title: "Ejemplo de Reporte Radiológico X-Ray con Acceso DICOM"
Description: "Ejemplo de un reporte diagnóstico X-Ray que incluye extensiones DICOM para acceso a imágenes con UIDs válidos de DICOM."

* identifier[0].system = "urn:oid:2.16.840.1.113883.4.6.1"
* identifier[0].value = "DR-2026-001234"

* status = #final
* code.coding[0].system = "https://hl7.or.cr/fhir/terminology/CodeSystem/cr-report-codes"
* code.coding[0].code = #CXR
* code.coding[0].display = "Radiografía de Tórax (Rayos X)"
* code.text = "Radiografía de Tórax"

* category[radiology].coding[0].system = "https://hl7.or.cr/fhir/terminology/CodeSystem/cr-diagnostic-service-sections"
* category[radiology].coding[0].code = #RAD
* category[radiology].coding[0].display = "Radiology"

* subject.display = "María Rodríguez García"
* effectiveDateTime = 2026-01-20T09:15:00-06:00
* issued = 2026-01-20T10:30:00-06:00
* performer.display = "Clínica de Radiología San José"

* composition = Reference(composition-xray-example)

* conclusion = "Radiografía de tórax posteroanterior: Pulmones bien expandidos bilateralmente. No hay opacidades localizadas ni consolidaciones. Corazón de tamaño normal. Mediastino dentro de los límites normales. Diafragmas regulares. Sin neumotórax. Hilios pulmonares normales."

* conclusionCode[0].coding[0].system = "http://snomed.info/sct"
* conclusionCode[0].coding[0].code = #17621005
* conclusionCode[0].coding[0].display = "Normal"

// Extensión DICOM - Primera instancia (vista PA)
* extension[0].url = "https://hl7.or.cr/fhir/imaging-report/StructureDefinition/dicom-instance-uid"
* extension[0].extension[0].url = "uid"
* extension[0].extension[0].valueString = "1.2.840.113619.2.55.3.2830498741.123.1234567890.1"
* extension[0].extension[1].url = "seriesInstanceUid"
* extension[0].extension[1].valueString = "1.2.840.113619.2.55.3.2830498741.123.1234567890"
* extension[0].extension[2].url = "studyInstanceUid"
* extension[0].extension[2].valueString = "1.2.840.113619.2.55.3.2830498741.123"
* extension[0].extension[3].url = "accessUrl"
* extension[0].extension[3].valueUrl = "dicom-web://pacs.example.cr/studies/1.2.840.113619.2.55.3.2830498741.123/series/1.2.840.113619.2.55.3.2830498741.123.1234567890/instances/1.2.840.113619.2.55.3.2830498741.123.1234567890.1"
* extension[0].extension[4].url = "modality"
* extension[0].extension[4].valueCode = #CR

// Extensión DICOM - Segunda instancia (vista Lateral)
* extension[1].url = "https://hl7.or.cr/fhir/imaging-report/StructureDefinition/dicom-instance-uid"
* extension[1].extension[0].url = "uid"
* extension[1].extension[0].valueString = "1.2.840.113619.2.55.3.2830498741.123.1234567890.2"
* extension[1].extension[1].url = "seriesInstanceUid"
* extension[1].extension[1].valueString = "1.2.840.113619.2.55.3.2830498741.123.1234567890"
* extension[1].extension[2].url = "studyInstanceUid"
* extension[1].extension[2].valueString = "1.2.840.113619.2.55.3.2830498741.123"
* extension[1].extension[3].url = "accessUrl"
* extension[1].extension[3].valueUrl = "dicom-web://pacs.example.cr/studies/1.2.840.113619.2.55.3.2830498741.123/series/1.2.840.113619.2.55.3.2830498741.123.1234567890/instances/1.2.840.113619.2.55.3.2830498741.123.1234567890.2"
* extension[1].extension[4].url = "modality"
* extension[1].extension[4].valueCode = #CR

// Nota sobre UIDs DICOM:
// Los UIDs siguientes se basan en el estándar DICOM Part 6:
// - Study Instance UID: 1.2.840.113619.2.55.3.2830498741.123
//   (Formato: enterprise-root.node.study-identifier)
// - Series Instance UID: 1.2.840.113619.2.55.3.2830498741.123.1234567890
//   (Formato: study-uid.series-identifier)
// - SOP Instance UID: 1.2.840.113619.2.55.3.2830498741.123.1234567890.1
//   (Formato: series-uid.instance-identifier)
// Para más información sobre UIDs válidos en DICOM:
// https://dicom.nema.org/medical/dicom/current/output/chtml/part06/chapter_a.html
