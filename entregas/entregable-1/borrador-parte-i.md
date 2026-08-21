# Entregable 1 — Borrador de trabajo (corregido)

> Documento de trabajo. La versión final se exporta a PDF.
> **Equipo:** Sub-equipo de Módulo 2 (Contenido y Demostraciones), 5 estudiantes universitarios, OSM 5° sem.
> **Tema:** Estación 2: Alfabetización de Datos — construcción de la APP chatbot + base documental.

---

## Aclaración de equipo (importante para el profe)

Somos 1 de los 2 sub-equipos de 5 que cubren Alfabetización de Datos dentro de Módulo 2 (Contenido y Demostraciones).

**Módulos de operación** según el mapa visual del proyecto:
- **Módulo 1 (Diseño de Estaciones)** — OSM, 15-20 estudiantes
- **Módulo 2 (Contenido y Demostraciones)** — OSM, 10-15 estudiantes ← nuestro módulo

Los módulos 3 (Logística), 4 (Promoción de Carreras) y 5 (Evaluación) son de soporte operativo; los módulos 1 y 2 son los que **operan** la experiencia educativa el día del evento.

Dentro de Módulo 2:
- **Sub-equipo A — CriterIA (este equipo, 5 estudiantes):** construye la APP chatbot (código, arquitectura, infraestructura) y la base documental (ADRs, anti-patterns, decisiones de diseño, iteraciones) que queda a disposición del docente. **Produce el Documento entregable del Entregable 1.**
- **Sub-equipo B (otros 5 estudiantes):** alcance complementario, aún por confirmar. Probablemente facilitación, materiales impresos, dinámica de la estación o guión pedagógico de inducción. *A coordinar.*

**Interfaz entre los dos sub-equipos:** nuestro chatbot es la herramienta que el sub-equipo B opera el día del evento. La base documental es lo que el docente usa para entender qué construimos y por qué.

---

## PARTE I — Identificación del servicio (BORRADOR)

### 1. Nombre del equipo
**CriterIA** — Sub-equipo A de Módulo 2 (Contenido y Demostraciones), 5 estudiantes universitarios de la carrera de Ingeniería en Informática, OSM 5° semestre.

### 2. Tema o componente asignado
**Módulo 2 (Contenido y Demostraciones) — Estación 2: Alfabetización de Datos — sub-equipo técnico (APP + base documental).**

### 3. Nombre del servicio o experiencia
**"Dos Tonos"** — APP de consulta política con dos modos de presentación del mismo modelo (uno con sesgo marcado hacia el área ideológica progresiva, otro neutro/balanceado).

### 4. Descripción del servicio (BORRADOR)

> **"Dos Tonos"** es una APP de consulta sobre candidatos políticos del
> equipo CriterIA, pensada para la Estación 2 (Alfabetización de Datos)
> del Startup Educativa. Se alimenta de un corpus curado y presenta los
> datos en **dos modos claramente diferenciados e independientes del
> prompt** del estudiante. **Tono B (neutro)** responde **siempre** de
> forma objetiva y estadística, mostrando los datos tal como están en
> el corpus. **Tono A (sesgado)** introduce variaciones intencionales
> en el framing — resalta u opaca información según el área ideológica.
> Cuando un estudiante de educación media tipea una pregunta, recibe
> simultáneamente las dos respuestas y las compara en tiempo real. El
> insight pedagógico es que **el sesgo nunca está en los datos**: los
> dos modos leen exactamente la misma información. El sesgo es
> únicamente el efecto de las variaciones que el Tono A aplica sobre
> el framing. La experiencia es una **consulta**, no simulación de
> voto. El equipo entrega la APP junto con una base documental
> completa que permite al docente y al sub-equipo B entender el porqué
> de cada elección técnica.

---

## PARTE II — Identificación del proceso (esquema tentativo)

### 5. Proceso principal

| Campo | Valor |
|---|---|
| Nombre | Construcción de "Dos Tonos" y entrega de la documentación al docente |
| Inicio | El equipo CriterIA recibe el brief del Entregable 1 y conforma el plan de trabajo |
| Fin | PDF del Entregable 1 entregado al docente. **El docente NO es especialista en tecnologías informáticas**, por lo que el formato de entrega es siempre **documentación PDF**, y salvo a ciertos esquemas, simplemente se anexan al desarrollo (no se entrega código, configs, ni artefactos de dev como resultado formal) |
| Usuario/beneficiario directo | Docente de la asignatura |
| Resultado esperado | **Índice 3: Documento entregable** (el PDF con las 6 partes de la Guía del Entregable 1). El resto del trabajo (APP funcionando, base documental en git) son insumos/medio para producir el documento, no resultados formales del proceso |

### 6. Actividades principales — Plan de Acción secuencial (10 actividades, **desde el Diseño del servicio hasta la Prestación del servicio**)

| N.° | Actividad | Quién la realiza | Dónde | Recursos / documentos | Resultado |
|---|---|---|---|---|---|
| 1 | **Análisis de brief y contexto** — Lectura de la Guía del Entregable 1, mapa visual del proyecto, comprensión de la Estación 2 y su rol dentro del Startup Educativa | CriterIA completo | Reunión inicial (presencial o virtual) | Guía Entregable 1, mapa visual del proyecto, syllabus OSM | Brief digerido, plan de trabajo, dudas listadas para el profe |
| 2 | **Diseño del servicio + Setup de infraestructura** — ADRs (diseño 1x2, sesgo hard-coded, criterios del corpus, contrato M5) + creación del repo git + configuración de gnosis + AGENTS.md + anti-patterns | CriterIA completo (diseño) + 1 delegado (setup) | Sesión de diseño + trabajo técnico | Notas de la actividad 1, gnosis-mcp, node + git, reference engineering-harness | ADRs locked-in, repo inicializado, doc viva indexada |
| 3 | **Investigación de LLMs y herramientas** — Evaluar qué LLMs se pueden usar (vía API key), qué herramientas de soporte, qué restricciones técnicas (costo, latencia, idioma) | 1-2 delegados | Trabajo individual + puesta en común | API keys disponibles, docs de gnosis, búsqueda de LLMs | Lista corta de herramientas elegibles, restricciones documentadas |
| 4 | **Construcción del corpus `\candidatos\`** — Definir las 3 áreas políticas, seleccionar 3-5 candidatos por área, escribir un .md por candidato con: nombre, partido, propuestas, frases textuales, fuente | 2-3 delegados (uno por área) | Trabajo individual + revisión cruzada | Fuentes públicas verificables (perfil, propuestas, Wikipedia, sitios oficiales) | Carpeta `corpus/candidatos/` poblada, ≥9 candidatos completos |
| 5 | **Implementación de la APP "Dos Tonos"** — Backend (adapter por LLM, manejo de los 2 modos, lectura del corpus), Frontend (UI simple: input, 2 respuestas lado a lado), captura de datos para M5 | 2-3 delegados (backend / frontend) | Trabajo técnico iterativo | ADRs locked-in, corpus poblado, API keys | APP funcional con 2 modos (Tono A / Tono B), demo local corriendo |
| 6 | **Testing y validación** — Probar la APP con preguntas de ejemplo del corpus, verificar que ambos modos leen lo mismo, verificar que el sesgo se aplica en Tono A y NUNCA en Tono B, validar la captura de datos | CriterIA completo | Sesión de testing | APP, corpus, lista de preguntas de prueba | Reporte de bugs, fixes aplicados, demo validado |
| 7 | **Preparación de la demostración/exposición** — Preparar materiales de inducción para el estudiante, ensayar el flujo interno, coordinar con el sub-equipo B sobre la operación, preparar la logística de la Estación 2 (mesa, dispositivo, conexión, scripts) | CriterIA completo + coordinación con sub-equipo B | Trabajo de pre-evento | Guion de inducción, checklist logístico, plan de rotación | Estación 2 lista para operar, materiales preparados, sub-equipo B alineado |
| 8 | **Demostración del proyecto en el colegio (Prestación del servicio)** — Ejecutar la Estación 2 con cada grupo rotativo de estudiantes: inducción, tipeo de pregunta, comparación de respuestas, reflexión, captura de datos para M5 | CriterIA + sub-equipo B (operación conjunta) | Colegio asignado, Estación 2 | APP "Dos Tonos" deployada local, dispositivo, internet, materiales de inducción | Estudiantes experimentan el contraste entre Tono A y Tono B; datos capturados para M5 |
| 9 | **Tablas de análisis del proceso (Part IV)** — Intervinientes y funciones, Recursos y documentos (con quién los usa), Decisiones y controles | CriterIA completo | Trabajo de documentación | Notas del equipo, brief, esquema del proceso | 3 tablas completadas siguiendo el formato de la Guía |
| 10 | **Diagramas + Conclusión + Empaquetamiento PDF (Part III + V + VI)** — Flujograma preliminar (notación `INICIO → ACTIVIDAD → DECISIÓN → RESULTADO → FIN`) + flujograma formal (simbología Unidad VI) + conclusión 300 palabras + armado del PDF `Equipo_N°_Entregable_1_StartupEducativa.pdf` | CriterIA completo | Trabajo final individual | Todo el output previo, simbología U6 | PDF del Entregable 1 listo para subir a la plataforma |

**Estructura del plan:** actividades 1-6 son la fase de **diseño y construcción** del servicio; actividad 7 es la **preparación operativa**; actividad 8 es la **prestación** del servicio (el día del evento); actividades 9-10 son la **documentación formal** que cierra el ciclo y se entrega al docente como Entregable 1.

---

## PARTE III / IV / V / VI

Vacíos por ahora. Próxima sesión los armamos cuando confirmes:
- ☐ Nombre del equipo
- ☐ Nombre del servicio
- ☐ Validación de las 8 actividades
- ☐ Aporte del sub-equipo B (si lo conseguimos, podemos integrar su parte al flujograma)
- ☐ Diagrama de flujo preliminar (preludio del flujograma final, peso 25%)

---

## Tareas para próximas sessions
1. ~~Confirmar nombre del equipo + nombre del servicio~~ ✅ (CriterIA + Dos Tonos)
2. ~~Refinar descripción (modos bien separados, sesgo nunca en los datos)~~ ✅
3. ~~Establecer que el único resultado formal es el Documento entregable (PDF)~~ ✅
4. ~~Establecer que Módulos 1 y 2 son los de operación~~ ✅
5. ~~Plan de acción secuencial (Diseño → Prestación) con demo incorporada~~ ✅
6. Coordinar con el sub-equipo B (especialmente para actividades 7-8)
7. Construir el **flujograma preliminar** (Part III, notación `INICIO → ACTIVIDAD → DECISIÓN → RESULTADO → FIN`)
8. Construir el **flujograma formal** (Part V, simbología Unidad VI, peso 25%)
9. Llenar las **3 tablas de análisis** (Part IV: intervinientes, recursos, decisiones/controles)
10. Escribir la **conclusión** (Part VI, 300 palabras)
