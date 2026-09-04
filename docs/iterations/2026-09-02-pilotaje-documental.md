# Iteración 2026-09-02 — Preparación del piloto documental

## Alcance autorizado

El humano aprobó resolver la contradicción del modo neutro conforme al ADR-0001
y preparar un task packet experimental, una checklist de la APP y el ajuste del
plan del harness. No autorizó cambiar el diseño experimental, implementar la APP
ni decidir privacidad, M5 o stack.

## Cambios

- [Alcance hermético](../anti-patterns/04-alcance-hermetico.md): la explicación de
  honestidad ya no describe al modo neutro como carente de corpus. Ambos modos
  usan el mismo modelo, pregunta y corpus; balance no garantiza ausencia de sesgo.
  Es una corrección de consistencia con el [ADR-0001](../adr/0001-diseno-experimental-1x2.md),
  que permanece intacto, no una decisión arquitectónica nueva.
- [Checklist Dos Tonos v0](../dos-tonos-verification-v0.md): fuentes, controles
  seleccionables, evidencia esperada y decisiones pendientes. Sin resultados runtime.
- En el repositorio independiente `harness-spec`, `templates/task-packet-v0.md`
  contiene la plantilla portable con cierre integrado; `PLAN.md` describe TASK-002
  como piloto K1 provisional con dos ejecuciones aún pendientes.

## Límites y siguiente paso

- No se implementaron código, proveedores, hooks, agentes ni adaptadores.
- No se resolvieron por inferencia ADR-0002/0003/0004/0005/0006.
- No se capturaron datos de estudiantes ni se habilitó su transmisión.
- La corrección actual no cuenta retroactivamente como ejecución del nuevo packet
  ni como caso `ready` del corpus del harness.
- Elegir y preparar dos tasks útiles de la APP, una trivial y otra con riesgo
  concreto, conservando estado inicial antes de actuar. Empezar por documentación
  o corpus cuando falten las decisiones necesarias para programar.
