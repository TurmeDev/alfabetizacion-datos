# Backlog — Alfabetización de Datos

Pendientes con trigger claro de promoción. Cuando un item se ejecuta, se mueve
a `docs/iterations/<fecha>-*.md` con referencia al ADR/anti-pattern/etc. que
lo absorbió.

---

## Diferidos (no urgentes, evaluar en próximas sesiones)

### B2. AGENTS.md bilingüe (español estructura + inglés jerga técnica)
**Estado:** trigger alcanzado: `AGENTS.md` supera 3 KB. Se evaluará cuando el
equipo confirme que necesita una versión bilingüe; el tamaño por sí solo no
justifica duplicar documentación.
**Promoción esperada:** refinamiento acotado del `AGENTS.md`.
**Origen:** ideas-para-mejorar del 2026-08-14.

### B3. `docs/adr/README.md` como timeline visual
**Trigger para promover:** cuando se acumulen ≥5 ADRs y la lista por status
se vuelva difícil de escanear.
**Promoción esperada:** nuevo archivo en `docs/adr/`.
**Origen:** ideas-para-mejorar del 2026-08-14.

### B4. Convenciones de commits para el equipo
**Estado:** promovible ahora. Ya existe una rama `develop`, pull requests y
commits que el equipo deberá revisar.
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

## Próximos (en orden de dependencia)

### N3. Revisar y liberar `corpus/v1` (DT-TASK-003)
**Trigger:** revisión humana de las tres fichas por P4 (Arnold y Mathias).
**Acción:** registrar las aprobaciones, corregir sólo lo observado y congelar
la versión con su índice y hashes. No iniciar la APP antes de este cierre.

### N4. Contrato de datos con M5 (ADR-0004)
**Trigger:** después de liberar `corpus/v1` y antes de implementar el código,
para que M5 sepa qué esperar.
**Acción:** definir schema JSON de las respuestas capturadas (pregunta,
modo, respuesta, timestamp, metadata).

### N5. Privacidad y datos de estudiantes (ADR-0005)
**Trigger:** antes de aceptar entradas reales de estudiantes, persistir
conversaciones o enviar contenido a un proveedor externo.
**Acción:** definir minimización, conservación, acceso, eliminación y límites
de transmisión.

### N6. Métricas del contraste pedagógico (ADR-0006)
**Trigger:** antes de declarar que el demo mide o demuestra sesgo.
**Acción:** acordar métricas, evidencia y encuadre educativo con M5.

### N7. Stack técnico (ADR-0002)
**Trigger:** después de ADR-0004, ADR-0005 y ADR-0006.
**Acción:** elegir lenguaje, framework y proveedor sin contradecir el corpus,
la privacidad ni el contrato con M5.

---

## Última actualización
2026-09-04 — ADR-0003 y DT-TASK-002 cerraron los criterios del corpus. La
única tarea operativa actual es DT-TASK-003; el resto queda ordenado por sus
dependencias.
