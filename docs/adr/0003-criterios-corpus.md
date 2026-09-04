# ADR-0003: Criterios y versionado del corpus ficticio

**Estado:** Aceptado; primera liberación pendiente de revisión humana

**Fecha:** 2026-09-03

**Decisor:** responsable del repositorio, con revisión posterior del equipo

## Contexto

El diseño 1×2 definido en ADR-0001 exige que ambos modos consulten exactamente
el mismo corpus. Para que la comparación mida diferencias de framing y no
diferencias en los datos, las fichas deben tener estructura, alcance y nivel de
detalle comparables. El dominio político también exige evitar asociaciones
accidentales con personas, organizaciones o elecciones reales.

## Decisión

### C-01 — Universo

La APP usa una simulación presidencial educativa ambientada geográficamente en
Paraguay. Candidaturas, partidos, elección, autoridades, biografías, plataformas,
lemas y citas son completamente ficticios.

Las ciudades reales de Paraguay sólo pueden aparecer como ubicación de una
actividad hipotética. La ficha no puede atribuirles condiciones, problemas,
resultados, posiciones políticas ni decisiones de autoridades reales.

### C-02 y C-03 — Taxonomía y cobertura

La versión mínima contiene un único cargo ficticio y tres perfiles programáticos
sintéticos: progresista, centrista y conservador. Habrá exactamente una ficha por
perfil. Estas categorías son recursos pedagógicos, no clasificaciones de personas
o partidos reales.

Cada ficha incluye tres propuestas construidas sobre los mismos ejes y con un
nivel comparable de detalle, beneficios, costos y limitaciones. No se crean
documentos separados para los partidos ni para una vicepresidencia.

### C-04 — Procedencia

El contenido se produce localmente para el ejercicio y se etiqueta como
`sintético`. «Fuente» significa procedencia interna: autor o generador, fecha,
versión, revisor y cambios. No se inventan URLs ni atribuciones externas.

### C-05 — Contrato de ficha

La plantilla canónica inicial es
[`corpus/templates/candidato-v0.md`](../../corpus/templates/candidato-v0.md).
Se aprueba su estructura: identificación, presentación, exactamente tres
propuestas, prioridades, cita sintética, límites, metadatos, checklist y
aprobación interna.

La aprobación de la plantilla no aprueba automáticamente una ficha. Cada perfil
debe superar su propia revisión antes de entrar en una versión liberada.

### C-06 — Versionado reproducible

`corpus/candidatos/` es la zona editable de borradores y nunca es una fuente de
runtime. Las versiones aprobadas se congelan como `corpus/v1/`, `corpus/v2/`,
etc., con fichas en `corpus/vN/candidatos/` y dos controles:

- `README.md`: estado, fecha y registro de cambios de la versión.
- `_indice.md`: archivos incluidos, perfil, revisión y SHA-256.

Una versión utilizada en un demo es inmutable. Cualquier cambio de contenido
crea la siguiente versión. Cada ejecución conserva `corpus_version` y el commit
Git para permitir su reproducción por el Módulo 5.

### C-07 — Revisión humana

P4 es el proceso responsable del corpus y está asignado a Arnold y Mathias según
[`docs/responsables-procesos.md`](../responsables-procesos.md). Cada ficha es
aprobada por una persona identificada por nombre y distinta de quien realizó su
última edición. Esa persona verifica ficción, coherencia, comparabilidad,
separación de metadatos, ausencia de datos sensibles y capacidad de abstención.

Si Arnold edita una ficha, Mathias puede aprobarla, y viceversa. Si ambos la
editan conjuntamente, debe aprobarla otra persona del equipo identificada por
nombre.

El nombre, fecha, resultado y observaciones se registran dentro de la ficha y en
el índice de la versión. Gemini, Codex u otra IA pueden redactar o asistir la
verificación, pero no cuentan como aprobación humana. No se puede liberar una
versión con revisor `NO DEFINIDO`.

## Consecuencias

- Los tres borradores actuales pueden revisarse sin volver a diseñar el formato.
- No existe aún `v1`: falta que el equipo designe revisores y apruebe las tres
  fichas.
- La APP sólo podrá leer rutas versionadas; no podrá consumir `candidatos/`,
  `examples/` ni `templates/`.
- Una corrección posterior implica una nueva versión aunque cambie una sola ficha.
- El stack técnico continúa pendiente y no se decide mediante este ADR.

## Criterio de salida

El corpus queda listo para desarrollo cuando `corpus/v1/` contiene las tres
fichas aprobadas, `README.md` y `_indice.md`, y ninguna aprobación carece de
nombre o fecha. Hasta entonces, el siguiente trabajo permitido es la revisión
editorial y la documentación de los ADR restantes, no la integración del modelo.

## Evidencia de decisión

Las decisiones C-01 a C-04 fueron aprobadas durante la sesión del 2026-09-03. En
la misma sesión se aceptó la plantilla propuesta y, posteriormente, el cierre
mínimo auditable de C-05 a C-07 descrito en este ADR. El detalle operativo y las
comprobaciones viven en [`DT-TASK-002`](../tasks/DT-TASK-002.md).
