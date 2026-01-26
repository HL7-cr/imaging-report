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

* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.ordered = true

// Entrada 0: Composition (obligatoria, índice del documento)
* entry contains composition 1..1 MS
* entry[composition].resource only Composition
* entry[composition] ^short = "Composition - Índice del documento"
* entry[composition] ^definition = "Primera entrada: recurso Composition que actúa como índice narrativo del documento"

// Entrada 1: DiagnosticReport (obligatoria, datos estructurados)
* entry contains diagnosticReport 1..1 MS
* entry[diagnosticReport].resource only DiagnosticReport
* entry[diagnosticReport] ^short = "DiagnosticReport - Reporte clínico"
* entry[diagnosticReport] ^definition = "Segunda entrada: recurso DiagnosticReport con datos estructurados del reporte"

// Entradas adicionales opcionales: Patient, ImagingStudy, ServiceRequest, Procedure, Observation
* entry contains patient 0..1 MS
* entry[patient].resource only Patient
* entry[patient] ^short = "Patient - Paciente"

* entry contains imagingStudy 0..1 MS
* entry[imagingStudy].resource only ImagingStudy
* entry[imagingStudy] ^short = "ImagingStudy - Estudio DICOM"

* entry contains serviceRequest 0..1 MS
* entry[serviceRequest].resource only ServiceRequest
* entry[serviceRequest] ^short = "ServiceRequest - Orden de imagen"

* entry contains procedure 0..1 MS
* entry[procedure].resource only Procedure
* entry[procedure] ^short = "Procedure - Procedimiento realizado"

* entry contains observation 0..* MS
* entry[observation].resource only Observation
* entry[observation] ^short = "Observation - Hallazgos clínicos"

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
