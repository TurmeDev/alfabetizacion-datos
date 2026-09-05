# DT-TASK-003 — Revisar y liberar el corpus v1

**Estado:** `READY_FOR_HUMAN_REVIEW`

**Riesgo:** medio

**Dependencia:** ADR-0003 aceptado mediante DT-TASK-002

## Objetivo

Revisar las tres fichas ficticias, corregir únicamente las observaciones
aceptadas por el equipo y congelar el primer corpus reproducible en
`corpus/v1/`. Esta task no implementa la APP ni selecciona stack o proveedor.

## Entradas

- `corpus/templates/candidato-v0.md`
- `corpus/candidatos/candidata-progresista-borrador-v0.md`
- `corpus/candidatos/candidata-centrista-borrador-r1.md`
- `corpus/candidatos/candidato-conservador-borrador-v0.md`
- `corpus/README.md`
- `docs/adr/0003-criterios-corpus.md`

## Responsables humanos

P4 está asignado a Arnold y Mathias, de acuerdo con
[`docs/responsables-procesos.md`](../responsables-procesos.md). Uno puede editar
y el otro aprobar cada ficha. Si ambos participan en la última edición de una
ficha, debe aprobarla otra persona del equipo identificada por nombre. No puede
contar como revisión la IA que generó o corrigió el texto.

## Procedimiento mínimo

1. Leer las tres fichas lado a lado, no de forma aislada.
2. Marcar los once controles de cada ficha y registrar observaciones concretas.
3. Confirmar especialmente que ningún perfil esté caricaturizado o favorecido,
   que el detalle sea comparable y que las ciudades sólo ubiquen actividades
   hipotéticas.
4. Registrar nombre, fecha y resultado humano en cada ficha.
5. Corregir las fichas con resultado `requiere cambios` y repetir sólo los
   controles afectados.
6. Cuando las tres estén aprobadas, copiarlas sin la palabra `borrador` a
   `corpus/v1/candidatos/` y fijar `Versión del corpus: v1`.
7. Crear `corpus/v1/README.md` y `corpus/v1/_indice.md`; el índice debe contener
   archivo, ID, perfil, revisor, fecha y SHA-256.

## Verificación automática complementaria

- Exactamente tres fichas en `corpus/v1/candidatos/`.
- Exactamente una ficha progresista, una centrista y una conservadora.
- Tres propuestas, tres actividades y tres trade-offs por ficha.
- Ningún marcador `[COMPLETAR]`, `NO DEFINIDO`, estado `borrador` o aprobación
  pendiente en la versión liberada.
- Ninguna URL, secreto, PII de estudiantes o referencia a partidos políticos
  reales identificada por las búsquedas acordadas.
- Los SHA-256 del índice coinciden con los archivos liberados.
- `git diff --check` finaliza con código 0.

Las búsquedas automáticas son apoyo y no sustituyen la lectura humana del
significado político, los nombres ni la comparabilidad.

## Salida y cierre

La task termina en `COMPLETED / PASS` sólo si `corpus/v1/` está completo y las
tres aprobaciones tienen nombre y fecha. Mientras Arnold y Mathias no registren
los resultados de la revisión, se mantiene `READY_FOR_HUMAN_REVIEW`; no se crea
una versión parcial ni se habilita el corpus para la APP.

Después de liberar `v1`, el siguiente trabajo documental es ADR-0004, contrato de
datos con Módulo 5. El stack de ADR-0002 permanece para el final de los ADR.
