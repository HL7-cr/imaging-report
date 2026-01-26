/* ------------------------------------------------------------------ 
 @type:         FSH-File for FHIR® Extension
 @about:        DICOM Instance UID and Access Information
 @created by:   National Working Group for FHIR® - Costa Rica
 @date:         2026-01-26
 @fhir version: 5.0.0
--------------------------------------------------------------------*/

Extension: DICOMInstanceUID
Id: dicom-instance-uid
Title: "Extensión DICOM Instance UID"
Description: "Extensión para almacenar el UID de instancia DICOM y la URL o información de acceso a las imágenes médicas digitales en formato DICOM."
Context: DiagnosticReport

* extension contains
    uid 1..1 MS and
    accessUrl 0..1 MS and
    seriesInstanceUid 0..1 MS and
    studyInstanceUid 0..1 MS and
    modality 0..1 MS

* extension[uid].value[x] only string
* extension[uid].valueString 1..1 MS
* extension[uid].valueString ^short = "UID de Instancia DICOM"
* extension[uid].valueString ^definition = "Identificador único de la instancia DICOM (formato: 1.2.3.4.5.6.7.8.9.10)"

* extension[seriesInstanceUid].value[x] only string
* extension[seriesInstanceUid].valueString 1..1
* extension[seriesInstanceUid].valueString ^short = "UID de Serie DICOM"
* extension[seriesInstanceUid].valueString ^definition = "Identificador único de la serie DICOM a la que pertenece la instancia"

* extension[studyInstanceUid].value[x] only string
* extension[studyInstanceUid].valueString 1..1
* extension[studyInstanceUid].valueString ^short = "UID del Estudio DICOM"
* extension[studyInstanceUid].valueString ^definition = "Identificador único del estudio DICOM completo"

* extension[accessUrl].value[x] only url
* extension[accessUrl].valueUrl 1..1
* extension[accessUrl].valueUrl ^short = "URL de Acceso a las Imágenes"
* extension[accessUrl].valueUrl ^definition = "URL para acceder a las imágenes DICOM (DICOM Web, WADO-URI, o sistema local PACS)"

* extension[modality].value[x] only code
* extension[modality].valueCode 1..1
* extension[modality].valueCode from $ImagingModalitiesSet (required)
* extension[modality].valueCode ^short = "Modalidad de Imagen"
* extension[modality].valueCode ^definition = "Código de la modalidad de imagen (CR, MR, CT, MG, US, etc.)"
