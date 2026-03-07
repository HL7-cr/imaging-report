# HL7 FHIR Costa Rica - Reportes de Imágenes Médicas

### Consideraciones Importantes

Esta Guía de Implementación se encuentra en fase **Draft (Borrador)** y está actualmente en revisión y desarrollo.

**Uso Permitido:**
- ✅ Implementación de prototipos
- ✅ Desarrollo de sistemas
- ✅ Capacitación y entrenamiento
- ✅ Evaluación técnica

**NO permitido en producción:**
- Esta guía **NO debe utilizarse en ambientes de producción** hasta que sea oficializada como normativa por el Ministerio de Salud de Costa Rica

### Oficialización de Guías Nacionales

El **Ministerio de Salud de Costa Rica** es la autoridad competente que oficializa las Guías de Implementación FHIR como normativas nacionales. Solo las guías que han sido formalmente aprobadas y publicadas como normativas pueden ser utilizadas en sistemas de producción y en la prestación de servicios de salud.

Para conocer el estado oficial de esta guía, contacte al Ministerio de Salud o a la Iniciativa HL7 Costa Rica en: **info@hl7.or.cr**
{:.stu-note}

## Introducción

Bienvenido a la Guía de Implementación de Reportes de Imágenes Médicas (IG) de HL7 FHIR para Costa Rica. Esta especificación define los perfiles, extensiones y terminología para el registro estandarizado de reportes de imágenes diagnósticas en el contexto costarricense.

## Alcance

Esta guía de implementación aborda:

- **Reportes de Imágenes Médicas**: Definición de perfiles FHIR para registrar reportes de imágenes diagnósticas en Costa Rica
- **Modalidades Soportadas**: Rayos X (radiografía), Resonancia Magnética, Tomografía, Mamografía, Ultrasonido
- **Informes Radiológicos**: Hallazgos, conclusiones, recomendaciones clínicas
- **Metadatos de Imagen**: Identificación del equipamiento, técnica utilizada, dosis de radiación
- **Trazabilidad**: Información sobre radiólogo responsable, fecha/hora de adquisición y reporte

## Perfiles Incluidos

| Perfil | Descripción |
|--------|-------------|
| **CRImagingStudy** | Estudio de imagen - Adquisición de imágenes |
| **CRDiagnosticReport-XRay** | Reporte de Rayos X (radiografía) |
| **CRDiagnosticReport-MRI** | Reporte de Resonancia Magnética |
| **CRDiagnosticReport-CT** | Reporte de Tomografía Computarizada |
| **CRDiagnosticReport-Mammography** | Reporte de Mamografía |
| **CRDiagnosticReport-Ultrasound** | Reporte de Ultrasonido (Ecografía) |

## Escenarios Clínicos

### Rayos X (Radiografía)
Estudio radiológico básico con adquisición de imágenes. **Nota:** El reporte es opcional, no todos los rayos X generan informe escrito.

### Resonancia Magnética (RM)
Estudio de alta resolución para tejidos blandos. Requiere reporte detallado de hallazgos.

### Tomografía Computarizada (TC)
Estudio avanzado con reconstrucciones 3D. Incluye información de protocolo y dosis.

### Mamografía
Estudio especializado de mama con clasificación BI-RADS. Integración con cribado oncológico.

### Ultrasonido (Ecografía)
Estudio dinámico en tiempo real. Incluye mediciones biométricas y evaluación Doppler.

## Interoperabilidad con Core IG

Cuando sea publicada en el HL7 FHIR npm registry, esta IG dependerá de:
- **HL7 FHIR Costa Rica - Core IG**: Para perfiles de Patient, Practitioner, Organization
- **HL7 FHIR Costa Rica - Terminology IG**: Para códigos y conjuntos de valores

## Licencia

Esta guía de implementación está licenciada bajo Creative Commons Attribution 4.0 Internacional (CC-BY-4.0).
