# DT-TASK-001 — Enlazar las guías de seguridad desde el README

**Preparación:** aceptada. **Ejecución:** completada el 2026-09-02.
**Estado:** `COMPLETED`. **Veredicto:** `PASS_WITH_OBSERVATIONS`.
Piloto K1 provisional, task packet v0; no implica adopción normativa del harness.

## Identificación

- Fecha / proyecto: 2026-09-02 / `alfabetizacion-datos` (Dos Tonos).
- Ejecutor / modelo / runtime: Codex en la sesión local actual; versión y
  configuración exactas no expuestas al packet.
- Directorio de ejecución: raíz de este repositorio, no `harness-spec`.
- Riesgo bajo, cambio documental reversible. Deshacer sólo el delta de esta task
  mediante un parche revisado; nunca restaurar todo el worktree.
- Baseline de alcance: commit `1433ec963e0a7328befaf63b0364c343a8f3cbe7`.
  `README.md`, `AGENTS.md`, `SECURITY.md` y `docs/publicacion-segura.md` coinciden
  con esa revisión al preparar el packet. Son recuperables desde Git, sin commit nuevo.
- SHA256 inicial de los bytes de `README.md`, antes de ejecutar:
  `1A2EFBA352DE8B9B3A9180544F4F72D58E3E3C947B08A5977F6AA9F634FF5B57`.
  Puede variar por finales de línea; contrastar el contenido con Git.
- SHA256 del packet entregado al ejecutor, antes de registrar resultados:
  `D52A6E81CD04D12B2822B570B5B317B8C379E37887E967550807C436EFCE264F`.
- Hay cambios previos en `docs/` y `entregas/`, ajenos a esta task. La baseline
  cubre sus inputs, no todo el worktree. Conservar este packet inicial antes de
  añadir resultados si se reutiliza para comparación; no entregar el cierre como pista.

## Formular — antes de actuar

- Intención: que el colaborador encuentre las guías de seguridad y publicación
  desde el README. Ambas existen, pero el README no las enlaza.
- Scope: añadir dos enlaces relativos descriptivos a `README.md`, en un apartado
  breve o en el quickstart. No duplicar las políticas ni reescribir el resto.
- No-scope: modificar políticas, estado general del proyecto, corpus, código,
  entregas o harness; instalar, reindexar, hacer commits/PRs, publicar o usar proveedores.
- Decisión humana fijada: ejecutar `DT-TASK-001`, autorizada por el usuario en
  esta sesión el 2026-09-02 después de aprobar la subdivisión de DT-10.
- Decisiones delegables tras aceptación: ubicación, etiquetas y redacción mínima
  de los enlaces. Ninguna decisión de arquitectura, privacidad, corpus o M5.
- Contexto mínimo: [AGENTS.md](../../AGENTS.md), [README](../../README.md),
  [checklist Dos Tonos](../dos-tonos-verification-v0.md),
  [SECURITY.md](../../SECURITY.md) y [publicación segura](../publicacion-segura.md).
  Respetar instrucciones del repo; no cargar todo el harness ni entregas ajenas.
- Acciones permitidas tras aceptación: lecturas locales, editar `README.md` y
  registrar resultados en este packet. Otros archivos quedan fuera de scope.
- Resultado esperado: enlaces navegables a ambas guías con etiquetas claras;
  ningún cambio de requisitos, ninguna afirmación nueva de cumplimiento.
- Gaps: ninguno para este alcance. Corpus, privacidad, M5 y stack pendientes no
  impiden este cambio documental.
- Parada: si README/fuentes cambiaron desde la baseline, revisar el delta con el
  humano antes de editar. Escalar conflictos o ampliación de scope. No limpiar
  cambios ajenos ni interpretar silencio como autorización.

## Verificar — definir antes, completar después

| Criterio | Método y evidencia requerida | Resultado |
| --- | --- | --- |
| Dos enlaces relativos correctos | README enlaza `SECURITY.md` y `docs/publicacion-segura.md`, con etiquetas descriptivas y destinos existentes | `PASS`: `rg` encontró ambos enlaces en README:40-41; ambos `Test-Path` devolvieron `True` |
| Delta mínimo, sin cambio de políticas | Diff de README y estado antes/después; fuentes idénticas y ningún cambio ajeno producido por esta task | `PASS`: el diff de README contiene sólo dos líneas añadidas; comparación de AGENTS/SECURITY/guía con la baseline terminó con exit code 0 |
| DT-11, sólo alcance documental | Inspección del texto añadido y evidencia: sin credenciales, datos de estudiantes ni contenido restringido | `PASS`: las dos líneas sólo contienen etiquetas y rutas relativas a documentación existente |
| Formato válido | `git diff --check -- README.md` con exit code 0 e inspección del Markdown añadido | `PASS`: exit code 0 |

DT-01 a DT-09 y DT-10a a DT-10d: `not_applicable`; no se cambia corpus,
comportamiento, UI, sesiones, transmisión ni exportación. No se declaran
aprobados. DT-11 se limita a este delta y no constituye una auditoría.
La verificación fue realizada mediante herramientas y revisión del ejecutor, no
de forma independiente; la revisión humana del resultado queda como siguiente acción.

Comandos PowerShell desde la raíz del repo. Antes de editar, registrar estado y
confirmar la baseline (el diff debe terminar con exit code 0):

```powershell
$taskRoot = (Get-Location).Path
git -c "safe.directory=$taskRoot" status --short
git -c "safe.directory=$taskRoot" diff 1433ec963e0a7328befaf63b0364c343a8f3cbe7 --exit-code -- README.md AGENTS.md SECURITY.md docs/publicacion-segura.md
```

Después, conservar salidas relevantes y exit codes. La búsqueda no sustituye
la revisión del diff y de las etiquetas; debe encontrar ambos destinos:

```powershell
git -c "safe.directory=$taskRoot" diff --check -- README.md
git -c "safe.directory=$taskRoot" diff -- README.md
git -c "safe.directory=$taskRoot" diff 1433ec963e0a7328befaf63b0364c343a8f3cbe7 --exit-code -- AGENTS.md SECURITY.md docs/publicacion-segura.md
rg -n '\]\((\./)?(SECURITY\.md|docs/publicacion-segura\.md)\)' README.md
Test-Path -LiteralPath 'SECURITY.md'
Test-Path -LiteralPath 'docs/publicacion-segura.md'
git -c "safe.directory=$taskRoot" status --short
```

## Actuar — registro de ejecución

- Inicio / fin: 2026-09-02 19:03:45–19:05:32, UTC-03:00.
- Aceptación humana del alcance: mensaje del usuario en esta sesión, 2026-09-02.
- Cambio: se añadieron al quickstart de `README.md` enlaces descriptivos a
  `SECURITY.md` y `docs/publicacion-segura.md`. No se modificaron las políticas.
- Decisión delegada: ubicar ambos enlaces inmediatamente después de las demás
  fuentes obligatorias del quickstart.
- Intervenciones o reintentos: ninguno durante la edición y verificación.
- Evidencia: baseline previa con exit code 0; diff de dos líneas; `rg` con exit
  code 0; ambos destinos existentes; `git diff --check` y comparación posterior
  de las fuentes protegidas con exit code 0. El `git status` final conserva
  cambios locales anteriores ajenos a esta task.

## Cerrar — resultado

- Resultado / referencia final: cambio local verificado en `README.md`,
  reconstruible desde la baseline más el diff registrado.
- Estado: `COMPLETED`.
- Veredicto: `PASS_WITH_OBSERVATIONS`.
- Verificador: el mismo ejecutor mediante Git, ripgrep, `Test-Path` e inspección
  del diff; no fue una verificación independiente.
- Resultados: los cuatro criterios de la tabla dieron `PASS`.
- Límites: se verificó sólo el delta de README. DT-11 no representa un escaneo
  del repositorio o historial, y los demás cambios locales no se atribuyen a esta task.
- Rework / reintentos: ninguno observado.
- Decisiones tomadas: ubicación y redacción mínima de los enlaces, dentro del
  margen delegado; ninguna decisión de corpus, privacidad, M5 o stack.
- Costo: ejecución y verificación observadas en 1 min 47 s; preparación previa
  no cronometrada, tokens/costo `unknown`.
- Fallo / near miss: `none observed`; no se infiere prevención de incidentes.
- Incertidumbres / siguiente acción: revisión humana del resultado y elección de
  una segunda task con riesgo concreto para continuar el piloto del harness.
- Utilidad del packet: hizo explícitos alcance, baseline y evidencia, y evitó
  mezclar el worktree sucio con el cambio. Para una edición de dos líneas, el hash
  del README y parte del cierre generan overhead que conviene evaluar al comparar
  este caso trivial con la segunda task.

Check: `PASS`, `FAIL` o `UNKNOWN`; falta de evidencia no es éxito. `REJECTED` si hay
incumplimiento u omisión de evidencia obligatoria; `INCONCLUSIVE` si no se pudo
obtener evidencia necesaria. No cerrar `COMPLETED` con aceptación pendiente.
Ningún resultado se añade automáticamente al corpus del harness.
