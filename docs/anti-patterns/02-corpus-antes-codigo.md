# 02 — Corpus antes de código

## Regla
**Sin `\candidatos\` poblado, no se toca la API del modelo.** Primero la data, después el código.

## Por qué existe
- El chatbot sin corpus es cáscara vacía. No se puede testear, no se puede
  validar, no se puede demostrar.
- El "momento ajá" del demo viene del **contenido** de las respuestas, no del
  framework que las genera.
- Construir la API primero genera código acoplado a placeholders que después
  hay que reescribir.

## Qué hacer
- **Orden obligatorio**: (1) definir estructura de `\candidatos\`, (2) poblar
  al menos 1 área completa, (3) recién ahí empezar el código del chatbot.
- Mockear respuestas del modelo durante desarrollo usando el corpus real (no
  respuestas inventadas).
- El corpus es **versionado**: `corpus/v1/`, `corpus/v2/`, etc. Si cambia entre
  iteraciones, saber qué versión usó cada demo para que M5 pueda reproducir.

## Qué NO hacer
- ❌ Empezar con `npm init` o framework setup antes de tener candidatos escritos
- ❌ Hardcodear respuestas de ejemplo en el código
- ❌ Asumir que el corpus "se puede armar después" — siempre se deja para el final
  y se entrega incompleto

## Estructura mínima del corpus antes de empezar el código
```
corpus/candidatos/
├── README.md
├── _indice.md
├── progresiva/
│   └── <candidato>.md       ← al menos 1 candidato completo
├── centrista/
└── conservadora/
```

Cada `<candidato>.md` debe tener: nombre, partido, propuestas resumidas, frases
textuales emblemáticas, fuente.

## Aplicar cuando
- Inicio de cualquier proyecto con RAG/corpus
- Cualquier chatbot que dependa de contexto
- Cualquier demo donde la fidelidad de las respuestas importa
