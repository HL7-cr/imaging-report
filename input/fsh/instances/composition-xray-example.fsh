/* ------------------------------------------------------------------ 
 @type:         FSH-File for FHIR® Instance
 @about:        Ejemplo de Composition para Reporte de Radiología X-Ray
 @created by:   National Working Group for FHIR® - Costa Rica
 @date:         2026-01-26
--------------------------------------------------------------------*/

Instance: composition-xray-example
InstanceOf: CRCompositionImagingReport
Usage: #example
Title: "Ejemplo de Composition para Reporte Radiológico X-Ray"
Description: "Documento de composición con secciones narrativas para reporte radiológico X-Ray."

* status = #final
* type = $LOINC#72134-0  // Radiology Report

* subject.display = "María Rodríguez García"
* date = 2026-01-20T10:30:00-06:00
* author.display = "Dr. Carlos López Martínez, Radiólogo"
* title = "Radiografía de Tórax - Reporte Diagnóstico"

* section[+].title = "Hallazgos"
* section[=].code.coding = $LOINC#72131-6  // Findings
* section[=].text.status = #generated
* section[=].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'><p>Radiografía de tórax posteroanterior: Pulmones bien expandidos bilateralmente. No hay opacidades localizadas ni consolidaciones. Corazón de tamaño normal. Mediastino dentro de los límites normales. Diafragmas regulares. Sin neumotórax. Hilios pulmonares normales.</p></div>"

* section[+].title = "Impresión"
* section[=].code.coding = $LOINC#72132-4  // Impression
* section[=].text.status = #generated
* section[=].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'><p>Radiografía de tórax normal sin hallazgos patológicos.</p></div>"

* section[+].title = "Recomendaciones"
* section[=].code.coding = $LOINC#72133-2  // Recommendations
* section[=].text.status = #generated
* section[=].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'><p>Seguimiento clínico según criterio médico. No se requieren estudios de imagen adicionales en este momento.</p></div>"

* section[+].title = "Findings Observations"
* section[=].code.coding = $LOINC#72131-6  // Clinical findings
* section[=].text.status = #generated
* section[=].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'><p>Observations and clinical findings from the imaging study.</p></div>"
* section[=].entry = Reference(observation-xray-lung-finding)
