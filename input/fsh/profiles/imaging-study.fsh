Profile: CRImagingStudy
Parent: ImagingStudy
Id: cr-imaging-study
Title: "CR Imaging Study"
Description: "Perfil de Estudio de Imagen para Costa Rica. Define los datos requeridos y restricciones para registrar estudios de imagen médica."

* identifier 1..*
* identifier.system = "urn:ietf:rfc:3986"
* status = #available
* modality 1..*
* subject 1..1
* subject only Reference(Patient)
* basedOn only Reference(ServiceRequest)
* encounter only Reference(Encounter)
* started 1..1
* series 1..*
* series.uid 1..1
* series.number 0..1
* series.modality 1..1
* series.description 0..1
* series.numberOfInstances 0..1
* series.bodySite 0..1
* series.instance 0..*
* series.instance.uid 1..1
* series.instance.number 0..1

