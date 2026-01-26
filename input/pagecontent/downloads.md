# Descargas

## Acceso a Recursos

Esta página proporciona enlaces e instrucciones para descargar todos los recursos de la Guía de Implementación de Reportes de Imágenes Médicas de HL7 FHIR Costa Rica.

---

## Descargas Directas

### Especificación Completa

**ZIP Archive - Todos los Recursos**
- Disponible en: [HL7 FHIR Registry](https://fhir.hl7.org/ig/HL7-cr/imaging-report/package.zip)
- Tamaño: ~4 MB
- Contenido:
  - ✅ Perfiles (StructureDefinition)
  - ✅ Extensiones
  - ✅ Ejemplos de reportes de imágenes
  - ✅ Documentación HTML
  - ✅ Mapeos de modalidades de imagen

### Por Componente

#### Perfiles (StructureDefinitions)
- Los perfiles están disponibles en la página de Artefactos
- StructureDefinitions para ImagingStudy, DiagnosticReport y Media
- Incluye perfiles específicos para cada modalidad: Rayos X, RM, Tomografía, Mamografía, Ultrasonido
- Documentación de diferencias y restricciones

#### Extensiones
- Las extensiones están disponibles en la página de Artefactos
- StructureDefinitions de extensión para campos locales
- Ejemplos de uso en contexto de imágenes médicas

#### Ejemplos e Instancias
- Los ejemplos están disponibles en la sección Artefactos
- Instancias de ejemplo de reportes completos
- Pacientes, Estudios de imagen, Reportes diagnósticos
- Casos de uso clínicos para cada modalidad

#### Sellado GAUDÍ (Firma Digital)
- Ver la sección [Sellado GAUDÍ](gaudi-sealing.html)
- Configuración para firmar Bundles de tipo documento
- Integración con servicio GAUDÍ del Banco Central
- Ejemplos de Bundle sellados

---

## Documentación

### Guía HTML (Navegable)

Acceso en línea (recomendado):
- **URL Principal:** https://hl7.or.cr/fhir/imaging-report/
- **Guía Completa:** https://hl7.or.cr/fhir/imaging-report/index.html
- **Artefactos:** https://hl7.or.cr/fhir/imaging-report/artifacts.html
- **Sellado GAUDÍ:** https://hl7.or.cr/fhir/imaging-report/gaudi-sealing.html

### Descarga Offline

Para acceso sin internet:

```bash
# Descargar sitio completo
wget -r https://hl7.or.cr/fhir/imaging-report/

# O usar herramienta FHIR
fhir ig download hl7.fhir.cr.imaging-report
```

---

## Código Fuente

### GitHub Repository

Accede al código fuente y historial de cambios:

- **URL:** https://github.com/HL7-cr/imaging-report
- **Branch Principal:** main
- **Licencia:** CC-BY-4.0

### Clonar Repositorio

```bash
# Clonar completo
git clone https://github.com/HL7-cr/imaging-report.git
cd imaging-report

# Navegar rama específica
git checkout -b version-0.0.1-draft origin/version-0.0.1-draft

# Ver historial
git log --oneline
```

### Estructura del Repositorio

```
imaging-report/
├── input/
│   ├── fsh/
│   │   ├── profiles/
│   │   │   ├── imaging-study.fsh
│   │   │   ├── diagnostic-report-xray.fsh
│   │   │   ├── diagnostic-report-mri.fsh
│   │   │   ├── diagnostic-report-ct.fsh
│   │   │   ├── diagnostic-report-mammography.fsh
│   │   │   └── diagnostic-report-ultrasound.fsh
│   │   ├── extensions/
│   │   ├── examples/
│   │   └── aliases.fsh
│   └── pagecontent/
│       ├── index.md
│       ├── gaudi-sealing.md
│       └── downloads.md
├── fsh-generated/
│   └── resources/
│       ├── StructureDefinition-*.json
│       └── Example-*.json
├── sushi-config.yaml
├── ig.ini
└── README.md
```

---

## Dependencias

### Paquetes FHIR Requeridos

Para integrar esta guía de implementación en tu sistema:

```json
{
  "dependencies": {
    "hl7.fhir.r5.core": "5.0.0",
    "hl7.fhir.uv.extensions.r5": "5.2.0",
    "hl7.terminology.r5": "7.0.1"
  }
}
```

### Valores de Sistemas Externos

- **Modalidades de Imagen:** `https://hl7.or.cr/fhir/terminology/ValueSet/cr-imaging-modalities`
- **Tipos de Identificación:** `https://hl7.or.cr/fhir/terminology/ValueSet/cr-identification-types`
- **Divisiones Territoriales:** `https://hl7.or.cr/fhir/terminology/ValueSet/cr-territorial-divisions`

Ver [Guía de Implementación de Terminología](https://hl7.or.cr/fhir/terminology/) para la lista completa.

---

## Versión Actual e Histórico

### Versión 0.0.1-draft
- **Fecha:** Enero 2026
- **Estado:** Draft (borrador)
- **Cambios:**
  - Versión inicial compilada
  - 6 perfiles principales (ImagingStudy + 5 modalidades)
  - 6 extensiones de imágenes
  - 15+ ejemplos de reportes
  - Integración GAUDÍ para sellado de documentos

### Versiones Anteriores

Todas las versiones estarán disponibles en:
- **NPM Registry:** https://www.npmjs.com/package/hl7.fhir.cr.imaging-report/
- **GitHub Releases:** https://github.com/HL7-cr/imaging-report/releases

---

## Actualizar a Nuevas Versiones

### Actualizar Paquete

```bash
# Instalar última versión
npm install hl7.fhir.cr.imaging-report@latest

# O versión específica
npm install hl7.fhir.cr.imaging-report@0.0.1
```

### Monitorear Cambios

```bash
# Ver historial de cambios
git log --oneline input/

# Comparar versiones
git diff v0.0.1-draft v0.0.1
```

---

## Contacto y Soporte

Para preguntas sobre esta guía o reportar problemas:

- **Email:** info@hl7.or.cr
- **GitHub Issues:** https://github.com/HL7-cr/imaging-report/issues
- **Sitio Web:** https://hl7.or.cr

---

## Licencia

Esta Guía de Implementación está bajo licencia **Creative Commons Attribution 4.0 International (CC-BY-4.0)**.

Puedes compartir, adaptar y utilizar este contenido siempre que:
- Atribuyas la autoría a la Iniciativa HL7 Costa Rica
- Incluyas el enlace a la licencia
- Indiques si hiciste cambios

Más información en: https://creativecommons.org/licenses/by/4.0/
