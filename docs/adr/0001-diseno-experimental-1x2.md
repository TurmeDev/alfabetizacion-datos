# ADR-0001: Diseño experimental 1×2 con sesgo en prompting

**Estado:** Aceptado
**Fecha:** 2026-08-21
**Decisores:** Mavis + user

## Contexto

El proyecto es la Estación 2 (Alfabetización de Datos) del Startup Educativa
para TOM 5° UNA PY + Control de Gestión. El objetivo general es demostrar a
~40 estudiantes de educación media que el sesgo de los modelos AI no está
solo en los datos de entrada, sino también en cómo se le pide al modelo que
los presente.

El objetivo específico original planteaba "comparación que ayude a determinar
la confiabilidad de los modelos AI". La spec fue refinada en sesiones de
2026-08-14 a 2026-08-21 hacia un demo concreto con candidatos políticos.

## Opciones consideradas

### A) 2×2 (2 modelos × corpus sesgado/verídico)
Comparar 2 modelos distintos, cada uno con 2 versiones de corpus (sesgado y
verídico) = 4 respuestas por pregunta.
- ❌ Descartado: la spec pivotó hacia contenido político con `\candidatos\`
  como única fuente. La duplicación del corpus no aporta al demo pedagógico.

### B) 1×2 con corpus distinto por modo
Un modelo, dos corpus diferentes (uno sesgado, uno neutro) = 2 respuestas
por pregunta.
- ❌ Descartado: ambos modos deben leer la **misma** información de
  `\candidatos\`. La diferencia está en cómo se presenta, no en qué se lee.

### C) 1×2 con sesgo en prompting
Un modelo, un corpus (`\candidatos\`), dos system prompts distintos (sesgado
hard-coded / neutro) = 2 respuestas por pregunta.
- ✅ **ELEGIDO**

## Decisión

**Opción C**: diseño 1×2. Un modelo, dos modos, misma data, distinto framing.

El sesgo hard-coded va hacia el área **progresista**. Esta dirección se eligió
porque (a) la mayoría del material académico/medios en español tiende a esa
direccionalidad, (b) el contraste con la versión neutra es más notorio, y
(c) el "momento ajá" del estudiante es más fuerte. Si el colegio es de zona
más conservadora o el profe pide invertir la dirección, es una constante en
el system prompt — no toca arquitectura.

## Estructura Sólida v1

Decisiones que se lockean y NO cambian sin un ADR nuevo:

1. **Arquitectura 1×2**: un modelo, dos modos. Mismo input, distinto system
   prompt.
2. **Corpus único**: ambos modos leen `\candidatos\` (no hay duplicación
   sesgado/neutro). El sesgo vive en el prompt, no en la data.
3. **Sesgo hard-coded hacia progresiva**: el system prompt del modo sesgado
   instruye framing pro-progresivo. No es random ni elegible.
4. **Modo neutro = balanceado**: el system prompt del modo neutro instruye
   presentación balanceada de todos los candidatos sin favorecer área.
5. **Estudiante tipea libremente**: no hay menú temático, no hay preguntas
   guiadas. El estudiante pregunta lo que quiera sobre los candidatos.
6. **Out of scope = "No tengo datos sobre eso"**: si preguntan algo fuera de
   `\candidatos\`, el modelo responde honestamente sin alucinar ni recurrir
   a su entrenamiento en internet.
7. **Demo ciego**: el estudiante ve "Modo A" / "Modo B", no nombres de modelo.
8. **Idioma único: español**. **Sin web-search** en runtime. **Sin PII** del
   estudiante. **Tiempo limitado** por sesión (~5-8 min).

## Consecuencias

### Positivas
- El demo es **claro y reproducible**: misma pregunta, dos respuestas, el
  estudiante ve la diferencia en el framing.
- El "momento ajá" pedagógico es fuerte: el sesgo no está en los datos
  (ambos leen lo mismo), está en cómo se le pide al modelo que los presente.
- El M5 (Evaluación, Control de Gestión) puede medir la diferencia entre
  las 2 respuestas a la misma pregunta con análisis textual.

### Trade-offs aceptados
- **Datos de M5 menos comparables entre estudiantes**: como cada uno tipea
  libremente, las preguntas son distintas. M5 debe analizar a nivel de
  respuesta individual, no a nivel agregado por pregunta.
- **Sesgo hard-coded es explícito pero fijo**: si el colegio pide rotar la
  dirección del sesgo, hay que cambiar el system prompt. No es dinámico.
- **El "modo neutro" no es realmente neutro**: el modelo sigue con sesgo de
  entrenamiento en internet. El framing al estudiante debe ser honesto sobre
  esto.

### Próximos pasos
1. ADR-0002 — Stack técnico (será el último ADR, tras corpus).
2. ADR-0003 — Criterios de construcción del corpus `\candidatos\`.
3. ADR-0004 — Contrato de datos con M5 (formato JSON, schema).
4. ADR-0005 — Privacidad y manejo de datos de estudiantes.
5. ADR-0006 — Métricas de "sesgo" para M5 (cómo se cuantifica la diferencia).

## Notas de iteración
- 2026-08-21: ADR aceptado. Sesgo hard-coded lockeado hacia progresiva.
