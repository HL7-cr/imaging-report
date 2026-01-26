/* ------------------------------------------------------------------ 
 @type:         FSH-File for FHIR® Instance
 @about:        Ejemplo de Bundle de Reporte de Imagen (Completo como EU IG)
 @created by:   National Working Group for FHIR® - Costa Rica
 @date:         2026-01-26
 
 Estructura: Composition + DiagnosticReport + Patient + ImagingStudy + 
             ServiceRequest + Procedure + Observation
--------------------------------------------------------------------*/

Instance: bundle-imaging-report-with-dicom-example
InstanceOf: CRImagingReportBundle
Usage: #example
Title: "Bundle Completo de Reporte de Imagen"
Description: "Documento FHIR Bundle con estructura completa: Composition, DiagnosticReport, Patient, ImagingStudy, ServiceRequest, Procedure, Observation (como EU IG pero simplificado)"

* type = #document
* timestamp = 2026-01-20T10:30:00-06:00
* identifier.system = "urn:oid:2.16.840.1.113883.4.6.1"
* identifier.value = "DR-2026-BUNDLE-001"

// ========== ENTRADA 1: COMPOSITION (Obligatoria - Índice del documento)
* entry[+].fullUrl = "urn:uuid:11111111-1111-1111-1111-111111111111"
* entry[=].resource = bundle-composition-imaging

// ========== ENTRADA 2: DIAGNOSTIC REPORT (Datos clínicos + DICOM refs)
* entry[+].fullUrl = "urn:uuid:22222222-2222-2222-2222-222222222222"
* entry[=].resource = bundle-diagnostic-report

// ========== ENTRADA 3: PATIENT (Sujeto del reporte)
* entry[+].fullUrl = "urn:uuid:33333333-3333-3333-3333-333333333333"
* entry[=].resource = bundle-patient

// ========== ENTRADA 4: IMAGING STUDY (Metadatos del estudio DICOM)
* entry[+].fullUrl = "urn:uuid:44444444-4444-4444-4444-444444444444"
* entry[=].resource = bundle-imaging-study

// ========== ENTRADA 5: SERVICE REQUEST (Orden de imagen)
* entry[+].fullUrl = "urn:uuid:55555555-5555-5555-5555-555555555555"
* entry[=].resource = bundle-service-request

// ========== ENTRADA 6: PROCEDURE (Procedimiento realizado)
* entry[+].fullUrl = "urn:uuid:66666666-6666-6666-6666-666666666666"
* entry[=].resource = bundle-procedure

// ========== ENTRADA 7: OBSERVATION (Hallazgo radiológico)
* entry[+].fullUrl = "urn:uuid:77777777-7777-7777-7777-777777777777"
* entry[=].resource = bundle-observation

// ========== COMPOSITION (Documento con secciones narrativas)
Instance: bundle-composition-imaging
InstanceOf: CRCompositionImagingReport
Usage: #inline
* status = #final
* type = $LOINC#72134-0
* date = 2026-01-20T10:30:00-06:00
* title = "Radiografía de Tórax - Reporte Final"
* author.display = "Dr. Carlos López Martínez, Radiólogo"

* subject.reference = "urn:uuid:33333333-3333-3333-3333-333333333333"

* section[+].title = "Hallazgos Clínicos"
* section[=].code.coding = $LOINC#72131-6
* section[=].text.status = #generated
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><strong>Técnica:</strong> Radiografía de tórax posteroanterior (PA) y lateral.</p><p><strong>Hallazgos:</strong> Pulmones bien expandidos bilateralmente sin opacidades localizadas. Corazón de tamaño normal. Mediastino dentro de los límites normales. Diafragmas regulares y sin neumotórax. Hilios pulmonares normales.</p></div>"

* section[+].title = "Impresión"
* section[=].code.coding = $LOINC#72132-4
* section[=].text.status = #generated
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Radiografía de tórax normal. No se evidencian hallazgos patológicos agudos.</p></div>"

* section[+].title = "Recomendaciones"
* section[=].code.coding = $LOINC#72133-2
* section[=].text.status = #generated
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Seguimiento clínico según criterio médico. No se requieren estudios de imagen adicionales en este momento.</p></div>"

* section[+].title = "Findings"
* section[=].code.coding = $LOINC#18787-6
* section[=].text.status = #generated
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Observations and clinical findings from the imaging study.</p></div>"
* section[=].entry.reference = "urn:uuid:77777777-7777-7777-7777-777777777777"

// ========== DIAGNOSTIC REPORT (Datos estructurados + DICOM UIDs)
Instance: bundle-diagnostic-report
InstanceOf: CRDiagnosticReportXRay
Usage: #inline
* identifier.system = "urn:oid:2.16.840.1.113883.4.6.1"
* identifier.value = "DR-2026-001234"
* status = #final
* code.coding = $SNOMED#23078-2  // X-ray report
* code.text = "Radiografía de Tórax"

* category[radiology].coding.system = $DiagnosticServiceSectionsCS
* category[radiology].coding.code = #RAD

* subject = Reference(bundle-patient)
* effectiveDateTime = 2026-01-20T09:15:00-06:00
* issued = 2026-01-20T10:30:00-06:00

* performer.display = "Clínica de Radiología San José"
* resultsInterpreter.display = "Dr. Carlos López Martínez"

* study.reference = "urn:uuid:44444444-4444-4444-4444-444444444444"
* result.reference = "urn:uuid:77777777-7777-7777-7777-777777777777"
* composition.reference = "urn:uuid:11111111-1111-1111-1111-111111111111"

* conclusion = "Radiografía de tórax normal sin hallazgos patológicos."
* conclusionCode.coding = $SNOMED#17621005  // Normal
* conclusionCode.text = "Normal"

// DICOM InstanceUID Extension - Instancia 1 (PA)
* extension[+].url = "https://hl7.or.cr/fhir/imaging-report/StructureDefinition/dicom-instance-uid"
* extension[=].extension[0].url = "uid"
* extension[=].extension[0].valueString = "1.2.840.113619.2.55.3.2830498741.123.1234567890.1"
* extension[=].extension[1].url = "seriesInstanceUid"
* extension[=].extension[1].valueString = "1.2.840.113619.2.55.3.2830498741.123.1234567890"
* extension[=].extension[2].url = "studyInstanceUid"
* extension[=].extension[2].valueString = "1.2.840.113619.2.55.3.2830498741.123"
* extension[=].extension[3].url = "accessUrl"
* extension[=].extension[3].valueUrl = "dicom-web://pacs.example.cr/studies/1.2.840.113619.2.55.3.2830498741.123/series/1.2.840.113619.2.55.3.2830498741.123.1234567890/instances/1.2.840.113619.2.55.3.2830498741.123.1234567890.1"
* extension[=].extension[4].url = "modality"
* extension[=].extension[4].valueCode = #CR

// HL7IDR Impression Extension
* extension[+].url = "https://hl7.or.cr/fhir/imaging-report/StructureDefinition/cr-hl7idr-impression"
* extension[=].valueReference.reference = "urn:uuid:77777777-7777-7777-7777-777777777777"

// ========== PATIENT (Paciente)
Instance: bundle-patient
InstanceOf: Patient
Usage: #inline
* identifier.system = "urn:oid:2.16.840.1.113883.18.4"
* identifier.value = "123456789"
* name.given = "María"
* name.family = "Rodríguez García"
* birthDate = "1975-05-15"
* gender = #female

// ========== IMAGING STUDY (Metadatos del estudio DICOM)
Instance: bundle-imaging-study
InstanceOf: ImagingStudy
Usage: #inline
* identifier.system = "urn:dicom:uid"
* identifier.value = "1.2.840.113619.2.55.3.2830498741.123"
* status = #available
* subject.reference = "urn:uuid:33333333-3333-3333-3333-333333333333"
* started = 2026-01-20T09:00:00-06:00
* numberOfSeries = 1
* numberOfInstances = 2

// ========== SERVICE REQUEST (Orden de imagen)
Instance: bundle-service-request
InstanceOf: ServiceRequest
Usage: #inline
* identifier.system = "urn:oid:2.16.840.1.113883.4.6.1"
* identifier.value = "SR-2026-001"
* status = #completed
* intent = #order
* code = $SNOMED#71045-9  // Chest X-ray
* subject.reference = "urn:uuid:33333333-3333-3333-3333-333333333333"
* requester.display = "Centro de Salud Primario"

// ========== PROCEDURE (Procedimiento realizado)
Instance: bundle-procedure
InstanceOf: CRProcedureImagingAcquisition
Usage: #inline
* identifier.system = "urn:oid:2.16.840.1.113883.4.6.1"
* identifier.value = "PROC-2026-001"
* status = #completed
* category.coding = $SNOMED#363679005  // Imaging procedure
* code = $SNOMED#71045-9  // Chest X-ray
* subject.reference = "urn:uuid:33333333-3333-3333-3333-333333333333"
* performer.actor.display = "Técnico en Radiología - Clínica San José"
* basedOn.reference = "urn:uuid:55555555-5555-5555-5555-555555555555"
* report.reference = "urn:uuid:22222222-2222-2222-2222-222222222222"

// ========== OBSERVATION (Hallazgo radiológico)
Instance: bundle-observation
InstanceOf: Observation
Usage: #inline
* status = #final
* code.coding = $SNOMED#18752-6  // Lung finding
* code.text = "Hallazgo radiológico de pulmones"
* subject.reference = "urn:uuid:33333333-3333-3333-3333-333333333333"
* effectiveDateTime = 2026-01-20T09:15:00-06:00
* performer.display = "Dr. Carlos López Martínez"
* valueCodeableConcept.coding = $SNOMED#17621005  // Normal
* valueCodeableConcept.text = "Normal"
* bodySite.coding = $SNOMED#39607008  // Lung structure
* interpretation.coding.system = "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation"
* interpretation.coding.code = #N
* note.text = "Pulmones bien expandidos bilateralmente. Hilios pulmonares normales. Diafragmas regulares."

