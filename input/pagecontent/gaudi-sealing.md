## Sellado de Documentos con GAUDÍ

Esta guía de Reportes de Imágenes Médicas soporta el sellado digital de documentos clínicos (Bundles de tipo "document") utilizando **GAUDÍ**, el sistema oficial de sellado de tiempo del Banco Central de Costa Rica.

### Referencia de Uso

Solo **Bundles de tipo "document"** pueden ser sellados con GAUDÍ:

```json
{
  "resourceType": "Bundle",
  "type": "document",  ← Único tipo soportado para sellado
  "composition": { "reference": "Composition/..." },
  "timestamp": "2026-01-20T10:30:00-06:00",
  "entry": [ ... recursos de imagen médica ... ],
  "signature": {
    "when": "2026-01-20T10:35:00Z",
    "who": { "reference": "Organization/radiologia" },
    "data": "[sello GAUDÍ en base64]"
  }
}
```

GAUDÍ proporciona:

- **Autenticidad**: Verificación del origen del reporte
- **Integridad**: Garantía de que no ha sido modificado
- **No Repudio**: El centro radiológico no puede negar haber generado el reporte
- **Legalidad**: Reconocido por la Ley de Firma Digital de Costa Rica
- **Timestamp oficial**: Marca de tiempo del Banco Central

### Para Más Información

Para obtener detalles completos sobre:
- **Contexto legal y normativo de GAUDÍ**
- **Estructura técnica del sellado**
- **Proceso de solicitud de sello**
- **Validación de documentos sellados**
- **Integración en sistemas FHIR**
- **Casos de uso clínicos**
- **Mejores prácticas de seguridad**

Consultar la **Guía Core de Costa Rica - Sección GAUDÍ** que incluye documentación exhaustiva sobre sellado digital de documentos.

### Estructura Mínima de un Bundle Sealable

```json
{
  "resourceType": "Bundle",
  "type": "document",
  "identifier": {
    "system": "urn:ietf:rfc:3986",
    "value": "urn:uuid:3e4130b9-e5ed-4b90-80c8-4b12f5d7f5f5"
  },
  "timestamp": "2026-01-20T10:30:00-06:00",
  "entry": [
    {
      "fullUrl": "urn:uuid:composition-001",
      "resource": {
        "resourceType": "Composition",
        "type": { "coding": [...] },
        "title": "Resultados de Laboratorio",
        "date": "2026-01-20",
        "author": [ { "reference": "Organization/..." } ],
        "subject": { "reference": "Patient/..." },
        "section": [ { "entry": [...] } ]
      }
    },
    { "fullUrl": "urn:uuid:patient-001", "resource": { ... } },
    { "fullUrl": "urn:uuid:organization-lab-001", "resource": { ... } },
    { "fullUrl": "urn:uuid:observation-001", "resource": { ... } }
  ]
}
```

El sello GAUDÍ se añade después, cuando el documento está completo y listo para transmisión.

### Contacto

Para consultas técnicas sobre implementación:
- **Email**: info@hl7.or.cr
- **Banco Central GAUDÍ**: gaudi@bcr.fi.cr
- **Documentación GAUDÍ**: https://www.bcr.fi.cr/regulaciones/gaudi

