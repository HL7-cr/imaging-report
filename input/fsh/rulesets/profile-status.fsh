/* ------------------------------------------------------------------ 
 @type:         FSH-File for a FHIR® RuleSet Resource
 @about:        HL7® FHIR® LABORATORY Costa Rica
 @created by:   National Working Group for FHIR® - Costa Rica
 @date:         2025-12-25
 @fhir version: 5.0.0
--------------------------------------------------------------------*/

RuleSet: RuleSetStatus (fmm, status, wg)

* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm].valueInteger = {fmm}
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status].valueCode = #{status}
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-wg].valueCode = #{wg}
