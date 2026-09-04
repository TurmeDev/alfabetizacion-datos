# Backlog — Alfabetización de Datos

Pendientes con trigger claro de promoción. Cuando un item se ejecuta, se mueve
a `docs/iterations/<fecha>-*.md` con referencia al ADR/anti-pattern/etc. que
lo absorbió.

---

## Diferidos (no urgentes, evaluar en próximas sessions)

### B2. AGENTS.md bilingüe (español estructura + inglés jerga técnica)
**Trigger para promover:** cuando el AGENTS.md crezca >3KB o cuando entren
sub-agentes A1/A2/A3 que necesiten grounding en inglés para el código.
**Promoción esperada:** refinamiento del AGENTS.md.
**Origen:** ideas-para-mejorar del 2026-08-14.

### B3. `docs/adr/README.md` como timeline visual
**Trigger para promover:** cuando se acumulen ≥5 ADRs y la lista por status
se vuelva difícil de escanear.
**Promoción esperada:** nuevo archivo en `docs/adr/`.
**Origen:** ideas-para-mejorar del 2026-08-14.

### B4. Convenciones de commits para el equipo
**Trigger para promover:** antes del primer ciclo de commits colaborativos de
corpus o código, o cuando el equipo necesite revisar historial y PRs de forma
consistente.
**Promoción esperada:** sección breve en `CONTRIBUTING.md`; evaluar Conventional
Commits y automatización sólo después de acordar la convención humana.
**Origen:** decisión diferida por el usuario el 2026-09-03.

---

## Descartados (no se ejecutan — registrar para no re-introducir)

### D1. Menú temático para el estudiante
**Por qué se descartó:** la spec pivoteó hacia pure-query de candidatos.
**Origen:** propuesta inicial 2026-08-14.
**Decisión:** registrado por user el 2026-08-14 ("Ahora mismo queda descartado").

### D2. "Voto del estudiante" post-respuesta
**Por qué se descartó:** el demo es consulta, no simulación de voto. El user
lo aclaró explícitamente el 2026-08-14.
**Origen:** ideas-para-mejorar del 2026-08-14.
**Decisión:** "NO es una simulación de VOTOS, apunta a ser una fuente de
consulta en base a datos almacenados".

---

## Próximos (sesión siguiente)

### N3. Stack técnico (ADR-0002)
**Trigger:** decisión del user sobre lenguaje/framework.
**Nota:** el user decidió que el stack va al FINAL de los ADRs (después de
0001-0004) porque "el stack no debería acoplarse a una decisión de corpus
que puede cambiar".

### N4. Contrato de datos con M5 (ADR-0004)
**Trigger:** antes de implementar el código, para que M5 sepa qué esperar.
**Acción:** definir schema JSON de las respuestas capturadas (pregunta,
modo, respuesta, timestamp, metadata).

---

## Última actualización
2026-09-03 — B1, N1 y N2 fueron absorbidos por ADR-0003 y
`docs/tasks/DT-TASK-002.md`. Se conserva B4 para acordar commits antes del
primer ciclo colaborativo.
