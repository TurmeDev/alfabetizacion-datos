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

> Nota para la Ing. de Producción: las descripciones pueden contener términos técnicos de informática (LLM, ADRs, API, etc.) porque así se referencian en la base documental del proyecto. Los **títulos** están redactados en lenguaje de procesos, sin jerga IT.

| N.° | Actividad | Quién la realiza | Dónde | Recursos / documentos | Resultado |
|---|---|---|---|---|---|
| 1 | **Análisis del brief y del contexto del proyecto** — Lectura de la Guía del Entregable 1, del mapa visual del proyecto, comprensión del rol de la Estación 2 dentro del Startup Educativa | CriterIA completo | Reunión inicial (presencial o virtual) | Guía Entregable 1, mapa visual del proyecto, syllabus OSM | Brief comprendido, plan de trabajo, dudas listadas para el profe |
| 2 | **Diseño del servicio y preparación técnica** — Definición del diseño experimental (un modelo de IA, dos modos de presentación), de las áreas políticas de la base de candidatos, del modelo de datos de las respuestas. Creación del repositorio del proyecto y configuración de las herramientas de documentación | CriterIA completo (diseño) + 1 delegado (preparación técnica) | Sesión de diseño + trabajo técnico | Notas de la actividad 1, herramientas de indexación de documentos, reference de configuración | Decisiones de diseño documentadas (ADRs), repositorio inicializado, documentación indexada |
| 3 | **Investigación de modelos de IA y herramientas disponibles** — Evaluar qué modelos de IA generativa se pueden usar (vía API key), qué herramientas de soporte, qué restricciones técnicas (costo, latencia, idioma) | 1-2 delegados | Trabajo individual + puesta en común | API keys disponibles, documentación de herramientas, búsqueda de modelos de IA | Lista corta de modelos y herramientas elegibles, restricciones documentadas |
| 4 | **Recopilación de información de candidatos** — Definir las 3 áreas políticas, seleccionar 3-5 candidatos por área, escribir una ficha por candidato con: nombre, partido, propuestas, frases textuales, fuente | 2-3 delegados (uno por área) | Trabajo individual + revisión cruzada | Fuentes públicas verificables (perfil del candidato, propuestas, Wikipedia, sitios oficiales) | Base de información de candidatos con ≥9 fichas completas |
| 5 | **Desarrollo de la aplicación "Dos Tonos"** — Construcción del sistema con dos modos diferenciados: Tono A con sesgo marcado hacia el área ideológica progresiva, Tono B neutro/balanceado. Interfaz para que el estudiante tipee preguntas y vea las dos respuestas lado a lado. Captura de datos para el equipo de evaluación | 2-3 delegados (parte técnica) | Trabajo técnico iterativo | Decisiones de diseño, base de candidatos, API keys | Aplicación funcional con 2 modos, demo local corriendo |
| 6 | **Pruebas y validación de la aplicación** — Probar con preguntas de ejemplo, verificar que ambos modos leen la misma información de la base, verificar que el sesgo se aplica en Tono A y NUNCA en Tono B, validar la captura de datos | CriterIA completo | Sesión de pruebas | Aplicación, base de candidatos, lista de preguntas de prueba | Reporte de errores, correcciones aplicadas, demo validado |
| 7 | **Preparación de la demostración** — Preparar materiales de inducción para el estudiante, ensayar el flujo interno, coordinar con el otro sub-equipo de 5 sobre la operación el día del evento, preparar la logística de la Estación 2 (mesa, dispositivo, conexión, scripts) | CriterIA completo + coordinación con el sub-equipo B | Trabajo previo al evento | Guion de inducción, checklist logístico, plan de rotación | Estación 2 lista para operar, materiales preparados, sub-equipo B alineado |
| 8 | **Demostración del proyecto en el colegio** — Ejecutar la Estación 2 con cada grupo rotativo de estudiantes: inducción, tipeo de pregunta, comparación de respuestas, reflexión, captura de datos para el equipo de evaluación | CriterIA + sub-equipo B (operación conjunta) | Colegio asignado, Estación 2 | Aplicación "Dos Tonos" instalada localmente, dispositivo, internet, materiales de inducción | Estudiantes experimentan el contraste entre Tono A y Tono B; datos capturados para el equipo de evaluación |
| 9 | **Análisis del proceso: tablas de intervinientes, recursos y decisiones** — Documentar quiénes participan en cada actividad, qué recursos se usan y quién los usa, qué decisiones o controles aplican durante el proceso | CriterIA completo | Trabajo de documentación | Notas del equipo, brief, esquema del proceso | 3 tablas completadas siguiendo el formato de la Guía del Entregable 1 |
| 10 | **Diagramas del proceso, conclusión y armado del documento final** — Dibujar el flujograma preliminar (notación `INICIO → ACTIVIDAD → DECISIÓN → RESULTADO → FIN`) y el flujograma formal (simbología de procesos de la Unidad VI). Redactar la conclusión del equipo (300 palabras). Armar el PDF final con el formato `Equipo_N°_Entregable_1_StartupEducativa.pdf` | CriterIA completo | Trabajo final individual | Todo el output previo, simbología de procesos | PDF del Entregable 1 listo para subir a la plataforma |

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
