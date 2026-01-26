Profile: CRStudyInstanceUIDIdentifier
Parent: Identifier
Id: cr-study-instance-uid-identifier
Title: "CR Study Instance UID Identifier"
Description: "DICOM Study Instance UID (UID raíz del estudio)."

* system 1..1 MS
* system = "urn:dicom:uid"
* system ^short = "DICOM UID system"
* value 1..1 MS
* value ^short = "DICOM Study Instance UID (1.2.840...)"
* type 1..1 MS
* type.coding.code = #DICOMUID
* use = #usual
