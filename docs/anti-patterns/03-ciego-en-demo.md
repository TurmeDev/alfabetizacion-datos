# 03 — Ciego en demo

## Regla
**El estudiante NO ve el nombre del modelo durante el demo.** La comparación
es entre los dos modos (sesgado / neutro), no entre marcas.

## Por qué existe
- Si el estudiante ve "Gemini" vs "MiniMax", el aprendizaje se va a "¿cuál es
  mejor?" en vez de "el sesgo está en cómo se presenta la info, no en los datos".
- La marca del modelo introduce ruido: el estudiante media ya tiene percepciones
  previas sobre marcas tech.
- El demo es de **alfabetización de datos**, no de comparación de productos.

## Qué hacer
- En la UI, los dos modos se identifican como **"Modo A"** y **"Modo B"** (o
  nombres neutrales equivalentes).
- El nombre real del modelo NO aparece en pantalla, NO aparece en logs visibles
  al estudiante, NO aparece en el handout.
- Solo el equipo y el profe saben cuál es cuál (para reproducir el demo).

## Qué NO hacer
- ❌ Mostrar "Respuesta de Gemini" / "Respuesta de MiniMax" lado a lado
- ❌ Dejar que el estudiante adivine cuál es "el bueno"
- ❌ Usar el nombre del modelo como feature de marketing

## Excepción (para el equipo / M5)
M5 (Evaluación) y el equipo SÍ ven qué modelo es cuál, porque necesitan
reproducir y reportar. Pero ese dato está en el JSON interno, no en la UI del
estudiante.

## Aplicar cuando
- Cualquier demo educativo que compare respuestas de modelos
- Cualquier evaluación A/B donde el branding pueda sesgar al usuario
- Cualquier experimento de UX donde la marca sea variable de confusión
