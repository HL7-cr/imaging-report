Profile: CRAccessionNumberIdentifier
Parent: Identifier
Id: cr-accession-number-identifier
Title: "CR Accession Number Identifier"
Description: "Identificador de número de acceso (Accession Number) para estudios de imágenes médicas."

* system 1..1 MS
* system ^short = "Sistema de acceso (ej: facility OID)"
* value 1..1 MS
* value ^short = "Número de acceso único"
* type 1..1 MS
* type = #ACSN
* use = #usual
