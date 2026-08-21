# 04 — Alcance hermético del demo

## Regla
El demo opera dentro de un **alcance cerrado** con 7 specs hard-locked. Cualquier
desviación requiere un ADR nuevo.

## Las 7 specs

| # | Spec | Por qué |
|---|---|---|
| 1 | **Sin web-search** | Corpus cerrado → respuesta reproducible |
| 2 | **Topics pre-definidos** | El estudiante pregunta sobre candidatos de `\candidatos\`, no en general |
| 3 | **Sin uploads del estudiante** | UI simple, sin archivos |
| 4 | **Sin memoria entre conversaciones** | Cada chat es fresco (privacidad) |
| 5 | **Sin PII** | No se pide nombre real, no se guarda info personal |
| 6 | **Idioma único: español** | Demo en colegio PY, no traducir |
| 7 | **Tiempo limitado** | ~5-8 min por estudiante (40 chicos × 3-4 hs) |

## Spec adicional (política)
- **Contenido político requiere aprobación del colegio antes del demo.** No es
  decisión del bot ni del equipo — pasa por dirección del colegio.

## Por qué existe
- **Reproducibilidad**: M5 (Evaluación) necesita comparar las respuestas de los
  40 estudiantes. Si cada uno interactúa distinto, los datos son ruido.
- **Ética**: menores de edad + política = cuidado. El demo debe ser
  **alfabetización**, no persuasión.
- **Honestidad**: "modo no-sesgado" no existe. El modo neutro muestra "el
  modelo sin nuestro corpus" — sigue con sesgo de entrenamiento en internet.
  El framing al estudiante debe ser explícito sobre esto.

## Qué hacer
- Validar las 7 specs antes de cada demo
- Si algo no se puede cumplir, **documentar la desviación** y crear un ADR
  explicando por qué
- El corpus `\candidatos\` debe ser curado por el equipo (no scrape de internet)

## Qué NO hacer
- ❌ Agregar web-search "porque sería más fácil"
- ❌ Permitir que el estudiante suba su CV o documentos
- ❌ Guardar las conversaciones para "mejorar el modelo"
- ❌ Prometer que el modo "neutro" es "la verdad"

## Aplicar cuando
- Diseño de cualquier demo a menores
- Cualquier chatbot que procese contenido sensible (política, salud, etc.)
- Cualquier comparación que requiera dataset comparable
