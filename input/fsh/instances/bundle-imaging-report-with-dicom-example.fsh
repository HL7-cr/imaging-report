/* ------------------------------------------------------------------ 
 @type:         FSH-File for FHIR® Instance
 @about:        Ejemplo de Bundle de Reporte de Imagen con Acceso DICOM
 @created by:   National Working Group for FHIR® - Costa Rica
 @date:         2026-01-26
--------------------------------------------------------------------*/

Instance: bundle-imaging-report-with-dicom-example
InstanceOf: CRImagingReportBundle
Usage: #example
Title: "Ejemplo de Bundle de Reporte de Imagen con Acceso DICOM"
Description: "Ejemplo de un Bundle tipo document para intercambiar reportes de imágenes médicas con acceso a instancias DICOM mediante UIDs y URLs de DICOM Web."

* type = #document
* timestamp = 2026-01-20T10:30:00-06:00
* identifier.system = "http://example.cr/bundle-id"
* identifier.value = "bundle-img-2026-001"

// Entrada obligatoria: Composition
* entry[0].fullUrl = "urn:uuid:11111111-2222-3333-4444-555555555555"
* entry[0].resource = Inline-Composition-Imaging

Instance: Inline-Composition-Imaging
InstanceOf: Composition
Usage: #inline
* status = #final
* type = http://loinc.org#72134-0
* date = 2026-01-20T10:30:00-06:00
* title = "Reporte de Imágenes Médicas - Rayos X de Tórax"
* author.display = "Clínica de Radiología San José"
* section[0].title = "Reporte Radiológico"
* section[0].text.status = #generated
* section[0].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Radiografía de tórax con hallazgos normales. Acceso a imágenes DICOM mediante identificadores de instancia DICOM UID.</p></div>"

