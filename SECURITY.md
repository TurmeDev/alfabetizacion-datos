# Security Policy

## System and Scope

Este repositorio contiene la documentación, el corpus curado y, en el futuro,
la aplicación de consulta de candidatos políticos de Alfabetización de Datos.
Se publica en GitHub para colaboración académica. No existe aún código de
producción ni un proveedor de modelo/API definido.

## Threat Model and Trust Boundaries

- Colaboradores pueden proponer cambios mediante ramas y pull requests.
- Todo archivo que llegue por un colaborador, una fuente del corpus o una
  herramienta de generación se considera no confiable hasta revisarlo.
- Las credenciales futuras viven solo en variables locales o secretos del
  proveedor de despliegue; nunca en Git, documentos, corpus o cliente web.
- Los datos de estudiantes no forman parte del repositorio público.

## Security Invariants

- No se versionan secretos, archivos `.env` con valores, llaves privadas,
  tokens, contraseñas ni archivos de credenciales.
- No se versiona PII de estudiantes ni información que permita identificarlos.
- La rama predeterminada se modifica mediante pull request y las reglas de
  GitHub protegen su historial, eliminaciones y force-pushes.
- El demo no usa búsqueda web durante su ejecución y no debe enviar datos de
  estudiantes a servicios externos.

## Reportable Findings and Severity Context

Son reportables, entre otros, secretos o PII expuestos en el árbol actual o
el historial alcanzable; bypass de controles de rama; dependencias o
automatizaciones que transmitan datos del proyecto sin autorización; y fallas
que permitan modificar corpus o configuración sin el flujo de revisión.

## Reporting a Vulnerability

Para reportar un hallazgo de seguridad, usar el flujo privado de GitHub
("Report a vulnerability" / Security Advisories) cuando esté disponible.
Si no está habilitado, abrir un issue público solo con información mínima y
solicitar un canal privado antes de compartir detalles, llaves o PII.

## Out of Scope, Exclusions, and Accepted Risk

La elección de stack, proveedor de IA, esquema de datos de Módulo 5 y el
mecanismo definitivo de privacidad siguen pendientes de sus ADRs. Esta
política no autoriza introducirlos ni almacenar secretos en el repositorio.

## Known Limitations and Compensating Controls

No hay CI ni análisis automático de secretos configurado todavía. Antes de
agregar código o desplegar la app, se deben definir ADR-0002 y ADR-0005,
activar el escaneo de secretos en GitHub y establecer los secretos en el
entorno de despliegue correspondiente.
