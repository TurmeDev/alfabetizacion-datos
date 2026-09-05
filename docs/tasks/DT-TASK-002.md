# DT-TASK-002 — Definir criterios y versionado del corpus (ADR-0003)

**Preparación y ejecución documental:** completadas. La plantilla C-05, el
versionado C-06 y el procedimiento C-07 fueron aceptados y formalizados en
ADR-0003. Las tres fichas continúan como borradores; su revisión y la liberación
de `corpus/v1/` corresponden a DT-TASK-003.
Segundo piloto K1 provisional, task packet v0.

## Identificación

- Fecha / proyecto: 2026-09-03 / `alfabetizacion-datos` (Dos Tonos).
- Aprobación: el usuario aceptó en esta sesión el alcance mínimo propuesto para
  v1: universo político ficticio, un cargo, tres partidos y tres candidatos. El
  2026-09-03 permitió usar ciudades reales de Paraguay únicamente para ubicar
  actividades hipotéticas, sin incorporar partidos o actores políticos reales.
- Ejecutor / modelo / runtime: Codex en la sesión local actual; versión y
  configuración exactas no expuestas al packet.
- Directorio de ejecución: raíz de este repositorio, no `harness-spec`.
- Riesgo: medio. El cambio documental es reversible, pero criterios ambiguos o
  clasificación política no sustentada afectarían todo el corpus, el contraste
  pedagógico y la evaluación posterior de estudiantes menores de edad.
- Baseline Git: commit `1433ec963e0a7328befaf63b0364c343a8f3cbe7`, rama
  `codex/security-publication`.
- Estado relevante al preparar: `corpus/` sólo contiene `.gitkeep` y
  `docs/dos-tonos-verification-v0.md` aún no está versionado. Hay otros cambios
  locales en `docs/` y `entregas/` que pertenecen a trabajos anteriores.
- SHA256 de las fuentes actuales:
  - `AGENTS.md`: `0B2D5B4A96AE2AEE42EA5BD2D35615BA98534A30F3779FFE2FDEF2FA82F68F8C`.
  - `docs/adr/0001-diseno-experimental-1x2.md`:
    `EF5F53530CCCD41AFCC13FDD30D11A5DC27735723AAE3496B252A3DD34EEB3A1`.
  - `docs/anti-patterns/02-corpus-antes-codigo.md`:
    `DF721F131D2231312EF5B38E5FC21EF880051E4F78FCB08D2E4D1E62E6FCC96D`.
  - `docs/backlog.md`:
    `27BB9CBCFC03C222F34124BFCA4E53624DB3D9BBB608D6DC5EBB729EC47E0751`.
  - `docs/dos-tonos-verification-v0.md`:
    `5FC2A738DC5122622B2ABE26D24B482296CAD25BB9791EE7794DD017F42BB1C5`.
  - `corpus/.gitkeep`:
    `8E2009076F81C8A9DA27F942C46469862B0352444BC78FAF32CA0B886109A6B8`.

## Formular — antes de actuar

- Intención: acordar criterios reproducibles para construir el corpus único que
  consumen ambos modos y resolver su convención de versionado antes de poblarlo.
- Scope tras aceptación: preparar `corpus/templates/candidato-v0.md` y una única
  ficha en `corpus/examples/` para discusión; preparar
  `docs/prompts/gemini-generacion-corpus-v0.md`; redactar
  `docs/adr/0003-criterios-corpus.md`; crear el `README.md` del corpus con estructura,
  campos, fuentes, inclusión, exclusión, completitud y versión; alinear únicamente
  las referencias contradictorias de
  `docs/anti-patterns/02-corpus-antes-codigo.md` y `docs/backlog.md`.
- No-scope: investigar o mencionar personas, partidos, elecciones, autoridades o
  gobiernos reales; atribuir problemas o posiciones políticas a ciudades reales;
  ejecutar Gemini, importar sus salidas sin revisión, crear localmente las otras
  dos fichas o aprobar el ejemplo para la APP; navegar o hacer scraping;
  implementar APP/API/RAG; elegir stack o proveedor;
  decidir privacidad, contrato M5 o métricas; modificar ADR-0001; hacer commit,
  PR, publicación o cualquier acción externa.
- Decisiones humanas ya fijadas:
  - Un solo corpus curado para ambos modos; el sesgo vive en el prompt.
  - El corpus no se obtiene mediante scraping automático.
  - Antes del código debe existir una estructura acordada y al menos un área
    completa.
  - Cada ficha debe incluir, como mínimo, nombre, partido, propuestas resumidas,
    frases textuales emblemáticas y fuente.
  - Las personas, partidos, candidaturas, elecciones y autoridades serán
    completamente ficticios. Ciudades reales de Paraguay sólo pueden aparecer
    como sedes de actividades hipotéticas y sin afirmaciones sobre su realidad.
  - Los cargos serán pocos y estarán definidos de forma inequívoca; el usuario
    delegó a la IA proponerlos, no crear candidatos sin revisión posterior.
- Decisiones delegables tras aceptación: redacción, enlaces internos, formato de
  tablas, organización del ADR y propuesta de cargos mínimos, sin convertir las
  demás recomendaciones en decisiones.
- Contexto mínimo: [AGENTS.md](../../AGENTS.md),
  [ADR-0001](../adr/0001-diseno-experimental-1x2.md),
  [corpus antes de código](../anti-patterns/02-corpus-antes-codigo.md),
  [backlog](../backlog.md),
  [checklist Dos Tonos](../dos-tonos-verification-v0.md) y
  [SECURITY.md](../../SECURITY.md).
- Acciones permitidas tras aceptación: lecturas locales y edición exclusiva de
  los archivos de scope. No borrar ni restaurar cambios ajenos del worktree.
- Resultado esperado: una propuesta de ADR-0003 y un contrato documental del
  corpus coherentes, sin candidatos reales ni afirmaciones políticas, con las
  decisiones humanas y sus fuentes registradas.

### Decisiones reservadas y estado actual

| ID | Estado | Decisión humana requerida | Información que debe quedar fijada |
| --- | --- | --- | --- |
| C-01 | Resuelta | Contexto electoral | Simulación presidencial ficticia ambientada geográficamente en Paraguay. Personas, partidos, elección y autoridades son inventados; ciudades reales sólo ubican actividades hipotéticas. |
| C-02 | Resuelta | Taxonomía | Tres perfiles programáticos sintéticos: progresista, centrista y conservador; son categorías pedagógicas, no afirmaciones sobre personas reales. |
| C-03 | Resuelta | Cobertura | Un cargo, tres partidos y tres candidatos. La v1 mínima sólo está completa cuando existe una ficha revisada por cada perfil. |
| C-04 | Resuelta | Fuentes y procedencia | Procedencia local sintética con autor, fecha, versión y revisor; sin URLs inventadas ni atribuciones reales. |
| C-05 | Resuelta | Ficha | `corpus/templates/candidato-v0.md` es el contrato inicial: campos, exactamente tres propuestas comparables, separación de contenido/metadatos y checklist. Aprobar la plantilla no aprueba sus instancias. |
| C-06 | Resuelta | Versionado | Borradores en `corpus/candidatos/`; versiones inmutables en `corpus/vN/candidatos/`, con `README.md`, `_indice.md`, hashes y changelog. Cada ejecución registra versión y commit. |
| C-07 | Resuelta | Revisión humana | P4 está asignado a Arnold y Mathias. Cada ficha requiere nombre, fecha y resultado de una persona distinta de quien realizó su última edición; una IA no puede firmar. |

La aprobación del 2026-09-03 sustituye la sugerencia histórica de 3–5 candidatos
por área: la v1 tendrá exactamente tres candidatos en total, uno por perfil.

### Alcance mínimo aprobado para v1

- Un solo cargo: **Presidencia en una simulación educativa ficticia ambientada
  en Paraguay**. No representa una elección o gobierno real. Un cargo evita
  preguntas y comparaciones entre funciones incompatibles.
- Tres partidos y tres candidatos totalmente ficticios: una candidatura por cada
  perfil programático sintético propuesto (progresista, centrista y conservador).
- Tres fichas de candidato, más un `README.md` y un índice. No crear documentos
  separados por partido en v1; su identidad y plataforma resumida viven en cada
  ficha para evitar archivos innecesarios.
- `Vicepresidencia` no será un corpus separado en v1. `Intendencia` puede añadirse
  en una versión posterior sólo si el piloto demuestra que otro cargo aporta valor.
- Toda frase, propuesta y biografía se marcará explícitamente como contenido
  sintético. «Fuente» significará procedencia local: autor, fecha, versión y
  revisor humano; nunca una URL inventada ni una atribución a una persona real.

Este alcance minimiza el corpus inicial a tres fichas comparables y permite
probar el contraste 1×2 sin confundir diferencias de cargo con diferencias de
framing. Fue aprobado por el usuario el 2026-09-03 para incorporarse al ADR-0003.

### Conflicto documental resuelto

- `corpus/candidatos/` conserva borradores editables y no es fuente de runtime.
- `corpus/v1/candidatos/`, `corpus/v2/candidatos/`, etc. conservan snapshots
  aprobados e inmutables.
- B1 fue promovido y absorbido por ADR-0003 y `corpus/README.md` antes del primer
  demo para asegurar reproducibilidad desde la primera ejecución.

- Gap operativo: todavía no existe una versión liberada. DT-TASK-003 debe obtener
  las firmas humanas y congelar `v1`; esto no reabre C-05, C-06 ni C-07.
- Parada: detener la parte afectada si las fuentes cambiaron, una clasificación
  requiere juicio político no delegado, hay conflicto de autoridad o se intenta
  poblar el corpus para superar el gate. Entregar el conflicto al usuario con
  opciones y recomendación; no interpretar silencio como aprobación.

## Verificar — definir antes, completar después

| Criterio | Método y evidencia requerida | Resultado |
| --- | --- | --- |
| Decisiones atribuibles | ADR enumera C-01 a C-07, sus respuestas y la fuente de aprobación humana; ninguna sugerencia histórica aparece como decisión sin confirmación | `PASS` |
| Fuentes y criterios reproducibles | Revisión cruzada de ADR y README: inclusión/exclusión, procedencia, campos y revisión humana son observables | `PASS` |
| Versionado coherente | Una sola ruta y convención en ADR, README, regla 02 y backlog; borradores separados de snapshots | `PASS` |
| C-05, plantilla de ficha | Inspección de `corpus/templates/candidato-v0.md`: campos rellenables, exactamente tres propuestas, contenido separado de metadatos y checklist de aprobación | `PASS`: estructura aceptada; la aprobación de fichas se verifica aparte |
| Ejemplo único de C-05 | Inspección de `corpus/examples/candidato-ejemplo-centrista-v0.md`: contenido político sintético, tres ejes/propuestas, ciudades sólo como sedes hipotéticas, límites, metadatos y estado no aprobado | `UNKNOWN`: estructura local verificada; nombres, ejes, ciudades, actividades y equilibrio requieren revisión del equipo |
| Prompt de delegación | Inspección de `docs/prompts/gemini-generacion-corpus-v0.md`: recibe plantilla/ejemplo, fija extensión, simetría, restricciones y tres salidas separadas | `PASS`: Gemini fue ejecutado externamente; Codex corrigió y dejó sus tres salidas como borradores no aprobados |
| Límite de esta task | Diff confirma que no se añadió código de APP, dependencias, proveedor ni integración de modelo; la incorporación posterior de borradores quedó registrada como desvío autorizado | `PASS_WITH_OBSERVATIONS` |
| DT-01, preparación parcial | Estructura y criterios quedan definidos; resultado debe permanecer `UNKNOWN` hasta que exista al menos un área completa con fichas verificadas | `UNKNOWN`: las tres fichas existen, pero todavía carecen de aprobación humana |
| DT-10c/DT-10d, documental | Criterios no llaman «neutral» al corpus, no personalizan persuasión política y separan hechos, citas, resúmenes y clasificación | `PASS` documental |
| DT-11, delta documental | Inspección del contenido: sin secretos, PII de estudiantes ni artefactos locales restringidos | `PASS` para los archivos de alcance |
| Markdown y enlaces | `git diff --check` y comprobación de destinos relativos | `PASS`; `git diff --check` finalizó con código 0 |

DT-02 a DT-09 y DT-10a/DT-10b: `not_applicable`; esta task no integra modelos,
UI, sesiones, proveedor, exportación ni runtime. DT-01 no es `not_applicable`:
es necesario para el proyecto, pero no puede pasar sin corpus poblado.

Comandos PowerShell previstos desde la raíz del repositorio:

```powershell
$taskRoot = (Get-Location).Path
git -c "safe.directory=$taskRoot" status --short
git -c "safe.directory=$taskRoot" diff --check
git -c "safe.directory=$taskRoot" diff -- docs/adr/0003-criterios-corpus.md corpus docs/anti-patterns/02-corpus-antes-codigo.md docs/backlog.md
rg -n 'corpus/(v[0-9]+/candidatos|candidatos/v[0-9]+)' docs corpus
rg -n 'progresiva|centrista|conservadora|3-5|3–5' docs/adr/0003-criterios-corpus.md corpus
git -c "safe.directory=$taskRoot" status --short
```

Las búsquedas sólo detectan términos y rutas; la verificación debe inspeccionar
su significado. Que no exista todavía una herramienta o un área completa deja
el control correspondiente en `UNKNOWN`, no en `PASS`.

## Actuar — registro parcial

- Inicio: 2026-09-03 21:27:47, UTC-03:00. Ejecución global aún abierta.
- Aceptación humana: C-01 a C-04 aprobadas; el usuario solicitó preparar una
  plantilla rellenable y un único ejemplo. Después autorizó ciudades reales de
  Paraguay sólo para ubicar actividades hipotéticas, sin partidos políticos reales.
- Archivos creados: `corpus/templates/candidato-v0.md` y
  `corpus/examples/candidato-ejemplo-centrista-v0.md`. Ambos están marcados como
  borradores no normativos; el ejemplo no puede alimentar la APP. También se creó
  `docs/prompts/gemini-generacion-corpus-v0.md` para delegar la ampliación.
- Decisiones delegadas: organización del formulario, límites iniciales de texto,
  separación entre contenido para el modelo y metadatos internos, checklist,
  objetivo de 1.200–1.500 palabras por archivo y formato de salida para Gemini.
- Desvío controlado: se preparó C-05 y una única ficha sintética antes de ADR-0003
  para facilitar la revisión del equipo. El usuario ejecutó externamente el prompt
  en Gemini y añadió tres borradores; Codex los revisó y corrigió sin aprobarlos.
- Evidencia de plantilla: SHA256
  `461E4343D2024EC7385E64E285DC858B1216278C08572212F103AE97ED4504F9`;
  tres secciones de propuesta, tres campos de actividad, once checks de revisión,
  cero URLs y ningún whitespace final detectado.
- Evidencia de ejemplo: SHA256
  `AC24ED6084494AEC495041C2916EBE8D8171E7A8C5E22B274145F1D07A896C20`;
  tres propuestas, tres actividades, tres trade-offs, once checks, cero URLs y
  ningún whitespace final detectado. Inspección manual: las referencias reales se
  limitan a tres ciudades de Paraguay como sedes hipotéticas; no aparecen partidos,
  personas, autoridades ni elecciones reales. El ejemplo permanece no aprobado
  hasta la revisión de contenido del equipo; esto no revierte la aceptación de
  la estructura C-05.
- Evidencia de prompt Gemini: SHA256
  `125F17889C80749BA8A25C853DA6E351476E1333550CB683F05C92D465E6B857`;
  un bloque exterior correctamente delimitado, tres archivos de salida requeridos,
  cero referencias a partidos políticos reales y ningún whitespace final detectado.
  No fue ejecutado por Codex; sus salidas fueron incorporadas por el usuario y
  permanecen sujetas a revisión humana.
- Revisión de salidas Gemini: los borradores se renombraron a
  `candidata-progresista-borrador-v0.md`, `candidata-centrista-borrador-v1.md` y
  `candidato-conservador-borrador-v0.md` en `corpus/candidatos/`. Se corrigieron
  dos referencias ambiguas a actividades reales y tres errores de redacción. Sus
  SHA256 son respectivamente
  `79CDBCF760CF5706B7C3D1C1825758810D0F83A63A7E6A6B373B2A1EDEFC9F1D`,
  `1D187E79E860134BCA53EE3F29C765CCBEAC5F47C14C2826F7F24DF93CDC2E0F` y
  `5F6B1885D459AF591184AB7AFBF4ACEAEBDE4BC3492712C8EA73EAC127931D94`.
  Cada ficha conserva tres propuestas, actividades y trade-offs; la búsqueda no
  halló URLs, partidos políticos reales, nombres temporales de Gemini ni whitespace
  final. El cambio de nombre no resuelve C-06 ni aprueba las fichas.
- Cierre de decisiones: el usuario aceptó el 2026-09-03 el cierre mínimo
  propuesto para C-05 a C-07. Se creó `docs/adr/0003-criterios-corpus.md`, se
  documentó el ciclo de vida en `corpus/README.md`, se aprobó la estructura de
  la plantilla y se alinearon la regla 02 y el backlog. La identidad Git local
  era genérica (`user`), por lo que no se reutilizó como firma humana.
- Asignación humana: el usuario proporcionó la distribución P1–P8; P4 corresponde
  a Arnold y Mathias. La responsabilidad quedó registrada en
  `docs/responsables-procesos.md` y enlazada desde ADR-0003 y DT-TASK-003.

## Cerrar — completar sólo al terminar o detenerse

- Resultado / referencia final: ADR-0003 y contrato documental del corpus creados;
  C-01 a C-07 resueltas.
- Estado: `COMPLETED`.
- Veredicto: `PASS_WITH_OBSERVATIONS`.
- Verificador, independencia, resultados y límites: Codex verificó estructura,
  consistencia y búsquedas locales, sin independencia respecto de la redacción.
  La revisión política y editorial final pertenece a integrantes humanos del
  equipo y se ejecutará en DT-TASK-003.
- Rework / reintentos / costo observado: un ciclo de corrección sobre las salidas
  de Gemini; costo no medido (`unknown`).
- Fallo / near miss: no observado al preparar; no inferir prevención.
- Incertidumbres / siguiente acción: ejecutar DT-TASK-003 con revisores humanos,
  corregir observaciones y promover las tres fichas aprobadas a `corpus/v1/`.
- Utilidad del packet: permitió hacer visibles las decisiones políticas y cerrar
  el conflicto de versionado sin incorporar fichas no aprobadas al runtime.

No cerrar `COMPLETED` con decisiones reservadas o aceptación pendientes. Ningún
resultado se añade automáticamente al corpus del harness.
