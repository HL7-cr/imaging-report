/* ------------------------------------------------------------------ 
 @type:         FSH-File for a FHIR® Profile Resource
 @about:        HL7® FHIR® IMAGING Costa Rica - Paciente para Reportes de Imágenes
 @created by:   National Working Group for FHIR® - Costa Rica
 @date:         2026-01-26
 @fhir version: 5.0.0
 @authors:      - Ministerio de Salud
                - Caja Costarricense de Seguro Social
                - DHIT Costa Rica
                - Cámara Costarricense de la Salud
                - Cámara de Tecnologías de Información y Comunicación
                - Global Life-Centered Hub
                - Instituto Nacional de Seguros
--------------------------------------------------------------------*/

Profile: CRImagingPatient
Parent: Patient
Id: cr-imaging-patient
Title: "Paciente - Reportes de Imágenes Médicas"
Description: "Perfil Patient para representar pacientes en el contexto de reportes de imágenes médicas en Costa Rica. Incorpora todos los identificadores oficiales, metadatos y restricciones específicas del perfil CRCorePatient, permitiendo el uso en reportes de imágenes sin requerir dependencia externa del Core IG."

* obeys only-one-cedula and only-one-dimex

* identifier 1..* MS
* identifier ^short = "Identificadores oficiales del paciente"
* identifier.type from $IdentifierTypesSet (required)
* identifier.use MS

* name 1..1 MS
* name.given 1..2 MS
* name.family 1..1 MS

* birthDate 1..1 MS
* birthDate ^short = "Fecha de nacimiento del paciente"

* gender 1..1 MS
* gender ^short = "Sexo biológico del paciente"
* gender from $BiologicalSexSet (required)

* active 0..1 MS
* active ^short = "Si el registro del paciente está activo"

* telecom 0..* MS
* telecom.system MS
* telecom.value MS
* telecom.use MS

* address 0..* MS
* address only CRLabResultAddress
* address.use MS
* address.type MS
* address.line 1..* MS
* address.district 0..1 MS
* address.city 0..1 MS
* address.state 0..1 MS
* address.postalCode 0..1 MS
* address.country 0..1 MS

* deceased[x] 0..1 MS
* deceasedBoolean 0..1 MS
* deceasedDateTime 0..1 MS

* extension contains CRLabResultPatientCalculatedAge named calculatedAge 0..1 MS
* extension contains CRLabResultPatientReligion named religion 0..1 MS

* contact 0..* MS
* contact.relationship 0..* MS
* contact.relationship from $RelationsSet (extensible)
* contact.name 0..1 MS
* contact.telecom 0..* MS
* contact.address 0..1 MS
* contact.gender 0..1 MS


// INVARIANTS
Invariant: only-one-cedula
Description: "El paciente no puede tener más de una cédula costarricense."
Expression: "identifier.where(type.coding.code='cedula').count() <= 1"
Severity: #error

Invariant: only-one-dimex
Description: "El paciente no puede tener más de un DIMEX."
Expression: "identifier.where(type.coding.code='dimex').count() <= 1"
Severity: #error
