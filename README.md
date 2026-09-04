# Alfabetización de Datos — Startup Educativa (TOM 5° UNA PY)

Proyecto de la **Estación 2** del Startup Educativa. Módulo 2 (Contenido y
Demostraciones) — sub-equipo técnico de 5 estudiantes universitarios.

Construimos una **APP de consulta de candidatos políticos** con dos modos
(sesgo marcado hacia progresiva / neutro) sobre un corpus curado, junto con
la base documental completa (decisiones, reglas, log de iteraciones) que
queda a disposición del docente.

## Estructura

```
.
├── app/                          # Codigo de la APP (backend, frontend, tests)
├── corpus/                       # Corpus curado de candidatos
├── docs/                         # Documentacion viva del proyecto (indexada por gnosis)
│   ├── adr/                      # Architecture Decision Records
│   ├── anti-patterns/            # Reglas duras (no violar)
│   ├── iterations/               # Log de sessions
│   └── backlog.md
├── entregas/                     # Borradores de entregas al docente (PDF final)
│   └── entregable-1/
│       ├── fuente-oficial.md     # Transcripcion del .docx del profe
│       └── borrador-parte-i.md   # Borrador de trabajo
├── .mcp.json                     # Server gnosis (MCP)
├── gnosis-serve.mjs              # Wrapper per-proyecto
├── .gitignore
├── AGENTS.md                     # Indice para Mavis / agentes AI
└── README.md                     # Este archivo
```

## Quickstart para Mavis / agentes AI

1. Leer [`AGENTS.md`](./AGENTS.md) — índice del proyecto.
2. Revisar [`docs/iterations/`](./docs/iterations/) — log de sessions.
3. Consultar [`docs/adr/`](./docs/adr/) — decisiones arquitectónicas.
4. Respetar [`docs/anti-patterns/`](./docs/anti-patterns/) — reglas duras.
5. Revisar [`docs/backlog.md`](./docs/backlog.md) — pendientes con trigger.
6. Consultar [`SECURITY.md`](./SECURITY.md) — política de secretos y datos sensibles.
7. Antes de publicar, seguir [`docs/publicacion-segura.md`](./docs/publicacion-segura.md).

## Re-indexar gnosis (tras cambios en `docs/`)

```bash
GNOSIS_MCP_DATABASE_URL="$(git rev-parse --show-toplevel)/.gnosis/docs.db" \
  gnosis-mcp ingest docs/ --force --embed
```

## Estado del proyecto

- 🟡 **Corpus en revisión** (2026-09-03). ADR-0003 aceptado y tres fichas
  sintéticas en borrador.
- ⏳ Pendiente: revisión humana y liberación de `corpus/v1/`, contrato con
  Módulo 5, implementación de `app/` y finalización del Entregable 1.

## Curso

- **Asignatura:** Técnicas de Organización y Métodos (OSM, Ing. Informática)
- **Docente:** [por confirmar]
- **Fecha de Entregable 1:** martes 25 de agosto
- **Integración:** Control de Gestión (Módulo 5, Evaluación y Análisis)
