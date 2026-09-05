# AGENTS.md — Alfabetización de Datos (TOM 5° UNA PY)

> Inyectado al inicio de cada session Mavis / agente AI.
> Este archivo es SOLO ÍNDICE. Reglas → `docs/anti-patterns/`.
> Decisiones → `docs/adr/`. Iteraciones → `docs/iterations/`. Pendientes → `docs/backlog.md`.

## Proyecto en una línea
APP de consulta sobre candidatos políticos para ~40 estudiantes de educación media
PY. Dos modos del mismo modelo leen `\candidatos\` con system prompts distintos
(sesgo hard-coded vs neutro) para demostrar que el sesgo no está en los datos,
sino en cómo se le pide al modelo que los presente.

## Fase actual
🟡 Corpus en revisión (2026-09-03). Hay tres fichas sintéticas en borrador y aún
no existe una versión liberada; sin código. Próximo: ejecutar DT-TASK-003 para
revisión humana y liberar `corpus/v1/`.

## Decisiones locked-in (ver `docs/adr/`)
- **ADR-0001** — Diseño 1x2 con sesgo en prompting, hard-coded hacia **progresista** ✅ Aceptado
- **ADR-0002** — Stack técnico — PENDIENTE (será el ÚLTIMO ADR, tras corpus)
- **ADR-0003** — Criterios y versionado del corpus — ACEPTADO; `v1` pendiente
- **ADR-0004** — Contrato de datos con Módulo 5 — PENDIENTE
- **ADR-0005** — Privacidad y manejo de datos de estudiantes — PENDIENTE
- **ADR-0006** — Métricas de "sesgo" para Módulo 5 — PENDIENTE

## Convenciones duras (ver `docs/anti-patterns/`)
- **01-no-asumir**: preguntar antes de inventar requisitos
- **02-corpus-antes-codigo**: sin `\candidatos\` no se toca la API
- **03-ciego-en-demo**: el estudiante no ve nombre de modelo
- **04-alcance-hermetico**: 7 specs del demo
- **05-herramientas-reproducibles**: sin rutas locales ni efectos al importar

## Estructura
```
alfabetizacion-datos/             ← repo único (consolidado 2026-08-21)
├── app/                          ← código de la APP (vacío por ahora)
├── corpus/                       ← borradores, plantilla y versiones aprobadas
├── docs/                         ← doc viva (indexada por gnosis)
│   ├── adr/                      ← decisiones arquitectónicas
│   ├── anti-patterns/            ← reglas duras
│   ├── iterations/               ← log de sessions
│   └── backlog.md                ← pendientes con trigger
├── entregas/                     ← borradores de entregas al docente (PDF final)
│   └── entregable-1/
├── AGENTS.md                     ← este archivo
├── .mcp.json                     ← server gnosis
├── gnosis-serve.mjs              ← wrapper per-proyecto
└── .gitignore                    ← ignora .gnosis/
```

## Cómo retomar una session
1. Leer este AGENTS.md
2. Leer el último `docs/iterations/<fecha>-*.md`
3. Revisar ADRs recientes
4. Continuar sin re-explicar el proyecto

## gnosis (índice semántico)
Este repo usa [gnosis-mcp](https://gnosismcp.com) como único índice semántico.
Indexa la raíz para conservar rutas únicas de `docs/`, `corpus/`, `entregas/`,
`README.md`, `AGENTS.md` y `SECURITY.md`. Antes de abrir muchos archivos, buscar
primero el contexto relevante con Gnosis. Las rutas `archive/` son evidencia
histórica, no fuente para decisiones o corpus activo.

Para re-indexar tras cambios documentales o del corpus:
```bash
GNOSIS_MCP_DATABASE_URL="$(git rev-parse --show-toplevel)/.gnosis/docs.db" \
  gnosis-mcp ingest . --force --embed --prune && \
gnosis-mcp check
```

## Integración con otros módulos del proyecto Startup Educativa
- **Módulo 2 (Contenido y Demostraciones)** → 10-15 estudiantes, dividido en 2 sub-equipos de 5
  - Sub-equipo A (este equipo): APP + base documental
  - Sub-equipo B (otro): alcance complementario, TBD
- Módulo 3 (Logística) → tiempo por estudiante
- Módulo 5 (Evaluación, Control de Gestión) → RECIBE nuestros datos
- Contrato de datos → ADR-0004
