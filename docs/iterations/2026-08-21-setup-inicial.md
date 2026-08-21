# Iteración 2026-08-21 — Setup inicial del proyecto

**Participantes:** Mavis + user
**Estado al final:** estructura de docs creada, gnosis instalado, ADR-0001
aceptado. Sin código aún.

## Lo que se trabajó

- **Refinamiento de spec** (sesiones 2026-08-14 a 2026-08-21): pivot de
  "data literacy general" a "consulta de candidatos políticos con 2 modos
  del mismo modelo".
- **Diseño 1×2 con sesgo en prompting** lockeado. Sesgo hard-coded hacia
  **progresista**.
- **Estructura separada**: APP code en `alfabetizacion-datos/`, doc viva
  en `alfabetizacion-datos-docs/`. agent-playbook NO se toca (proyecto
  independiente).
- **gnosis instalado** en `alfabetizacion-datos-docs/` con wrapper per-proyecto
  (`gnosis-serve.mjs`).
- **Anti-patterns 01-04** documentados.
- **ADR-0001** aceptado.
- **Backlog** inicial con 3 diferidos, 2 descartados, 4 próximos.

## Decisiones tomadas

- ADR-0001 → `docs/adr/0001-diseno-experimental-1x2.md` (Aceptado)
- 4 anti-patterns hard-locked → `docs/anti-patterns/01-04-*.md`
- Estructura de carpetas → ver `AGENTS.md`

## Open questions (para próxima session)

- ¿Qué 3-4 áreas políticas concretas van en `\candidatos\`? Mi recomendación:
  progresiva / centrista / conservadora (3 áreas), con 3-5 candidatos por área.
- ¿Stack técnico? (ADR-0002 queda para cuando se confirme el corpus primero.)
- ¿Cómo capturamos las respuestas de los 40 estudiantes para M5? (ADR-0004.)

## Archivos tocados

- `AGENTS.md` (creado)
- `docs/anti-patterns/01-no-asumir.md` (creado)
- `docs/anti-patterns/02-corpus-antes-codigo.md` (creado)
- `docs/anti-patterns/03-ciego-en-demo.md` (creado)
- `docs/anti-patterns/04-alcance-hermetico.md` (creado)
- `docs/adr/0001-diseno-experimental-1x2.md` (creado, Aceptado)
- `docs/backlog.md` (creado)
- `docs/iterations/2026-08-21-setup-inicial.md` (este archivo)
- `.mcp.json` (creado)
- `.gitignore` (creado)
- `gnosis-serve.mjs` (copiado desde engineering-harness reference)
- `alfabetizacion-datos/.gitignore` (creado, repo APP hermano)

## Update 2026-08-21 (misma sesión) — consolidación a repo único

Decisión: dejar la estructura en un solo repo en vez de dos. Razones:
- Handoff al profe más simple (1 URL).
- Setup de gnosis más limpio (wrapper en raíz, ingest apunta a `docs/`).

Cambios ejecutados:
- Todo el contenido de `alfabetizacion-datos-docs/` (excepto `.git/`, `.gnosis/`)
  se movió a `alfabetizacion-datos/docs/`.
- `.mcp.json` y `gnosis-serve.mjs` quedaron en la raíz de `alfabetizacion-datos/`.
- `.gitignore` mergeado (ignora `.gnosis/`, `node_modules/`, `__pycache__/`, etc.).
- `app/` y `corpus/` creados con `.gitkeep` para tracking.
- `alfabetizacion-datos-docs/` eliminado completamente.
- gnosis re-ingestado apuntando a `docs/` (7 docs / 39 chunks / 39 embedidos).
- `AGENTS.md` actualizado con la nueva estructura.
- Próximo paso: `git push` a `https://github.com/TurmeDev/alfabetizacion-datos.git`.
