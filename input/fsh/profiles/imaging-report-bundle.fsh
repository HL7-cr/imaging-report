/* ------------------------------------------------------------------ 
 @type:         FSH-File for FHIR® Profile Resource
 @about:        HL7® FHIR® IMAGING REPORT Costa Rica - Bundle de Reportes
 @created by:   National Working Group for FHIR® - Costa Rica
 @date:         2026-01-26
 @fhir version: 5.0.0
--------------------------------------------------------------------*/

Profile: CRImagingReportBundle
Parent: Bundle
Id: cr-imaging-report-bundle
Title: "Bundle de Reportes de Imágenes Médicas"
Description: "Perfil FHIR Bundle para intercambiar reportes de imágenes médicas (Rayos X, RM, Tomografía, Mamografía, Ultrasonido) con acceso a imágenes DICOM. Este Bundle contiene estudios de imagen, reportes diagnósticos y referencias DICOM que pueden ser firmados digitalmente con JAdES para garantizar autenticidad e integridad."

* insert ProfileMeta
* insert RuleSetStatus (0, draft, pc)

* type = #document (exactly)
* type ^short = "Tipo de Bundle"
* type ^definition = "El tipo debe ser 'document' para representar un documento de reporte de imagen que será firmado digitalmente con JAdES y GAUDÍ"

* timestamp 1..1 MS
* timestamp ^short = "Fecha y hora del Bundle"
* timestamp ^definition = "Marca de tiempo cuando se creó el Bundle (para auditoría y firma JAdES)"

* entry 1..* MS
* entry.fullUrl 1..1 MS
* entry.fullUrl ^short = "URL única del recurso"
* entry.fullUrl ^definition = "Identificador único del recurso dentro del Bundle (requerido para firma JAdES)"

* entry.resource 1..1 MS
* entry.resource ^short = "Recursos contenidos en el Bundle"
* entry.resource ^definition = "Puede contener Patient, Practitioner, Organization, ImagingStudy, DiagnosticReport (reportes radiológicos) y Composition"

* entry.request 0..1 MS
* entry.request.method 1..1 MS
* entry.request.method from http://hl7.org/fhir/ValueSet/http-verb (required)
* entry.request.url 1..1 MS

* signature 0..1 MS
* signature ^short = "Firma digital del Bundle"
* signature ^definition = "Firma digital JAdES o similar para garantizar autenticidad e integridad del documento de imagen"
* signature.type 1..1 MS
* signature.type ^short = "Tipo de firma"
* signature.type ^definition = "Código que indica el tipo de firma (p.ej. JAdES)"
* signature.when 1..1 MS
* signature.when ^short = "Cuándo se firmó"
* signature.who 1..1 MS
* signature.who ^short = "Quién firmó"
* signature.data 1..1 MS
* signature.data ^short = "Datos de la firma"
* signature.data ^definition = "Contiene la firma digital en base64"
