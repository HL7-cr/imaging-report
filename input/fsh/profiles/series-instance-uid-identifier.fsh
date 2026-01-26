Profile: CRSeriesInstanceUIDIdentifier
Parent: Identifier
Id: cr-series-instance-uid-identifier
Title: "CR Series Instance UID Identifier"
Description: "DICOM Series Instance UID (UID de serie dentro de un estudio)."

* system 1..1 MS
* system = "urn:dicom:uid"
* system ^short = "DICOM UID system"
* value 1..1 MS
* value ^short = "DICOM Series Instance UID (1.2.840...)"
* type 1..1 MS
* type.coding.code = #DICOMUID
* use = #usual
