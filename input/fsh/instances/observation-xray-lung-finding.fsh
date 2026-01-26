/* ------------------------------------------------------------------ 
 @type:         FSH-File for FHIR® Instance
 @about:        Ejemplo de Observation para Hallazgo Radiológico X-Ray
 @created by:   National Working Group for FHIR® - Costa Rica
 @date:         2026-01-26
--------------------------------------------------------------------*/

Instance: observation-xray-lung-finding
InstanceOf: Observation
Usage: #example
Title: "Ejemplo de Observation - Hallazgo Radiológico de Pulmón"
Description: "Observation para documentar hallazgo radiológico normal en radiografía de tórax."

* status = #final
* code.coding = $SNOMED#18752-6  // Lung finding
* code.text = "Hallazgo radiológico de pulmones"

* subject.display = "María Rodríguez García"
* effectiveDateTime = 2026-01-20T09:15:00-06:00
* issued = 2026-01-20T10:30:00-06:00
* performer.display = "Dr. Carlos López Martínez"

* valueCodeableConcept.coding = $SNOMED#17621005  // Normal
* valueCodeableConcept.text = "Normal"

* bodySite.coding = $SNOMED#39607008  // Lung structure
* bodySite.text = "Pulmones"

* interpretation.coding.system = "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation"
* interpretation.coding.code = #N  // Normal

* note.text = "Pulmones bien expandidos bilateralmente. Hilios pulmonares normales."
