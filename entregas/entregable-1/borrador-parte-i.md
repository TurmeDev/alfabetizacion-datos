# Entregable 1 — Borrador de trabajo (corregido)

> Documento de trabajo. La versión final se exporta a PDF.
> **Equipo:** Sub-equipo de Módulo 2 (Contenido y Demostraciones), 5 estudiantes universitarios, OSM 5° sem.
> **Tema:** Estación 2: Alfabetización de Datos — construcción de la APP chatbot + base documental.

---

## Aclaración de equipo (importante para el profe)

Somos 1 de los 2 sub-equipos de 5 que cubren Alfabetización de Datos dentro de Módulo 2.

- **Sub-equipo A (este equipo, 5 estudiantes):** construye la APP chatbot (código, arquitectura, infraestructura) y la base documental (ADRs, anti-patterns, decisiones de diseño, iteraciones) que queda a disposición del docente.
- **Sub-equipo B (otros 5 estudiantes):** alcance complementario, aún por confirmar con el otro equipo. Probablemente: facilitación, materiales impresos, dinámica de la estación, o guión pedagógico de inducción. *A coordinar.*

**Interfaz entre los dos sub-equipos:** nuestro chatbot es la herramienta que el sub-equipo B opera el día del evento. La base documental es lo que el docente usa para entender qué construimos y por qué.

---

## PARTE I — Identificación del servicio (BORRADOR)

### 1. Nombre del equipo
> ☐ PENDIENTE — el user lo define

### 2. Tema o componente asignado
**Módulo 2 (Contenido y Demostraciones) — Estación 2: Alfabetización de Datos — sub-equipo técnico (APP + base documental).**

### 3. Nombre del servicio o experiencia
> ☐ PENDIENTE — propuestas:
> - "Datos con lupa" (recomendada: invita a mirar críticamente)
> - "Voces en la IA" (énfasis en los candidatos detrás de los datos)
> - "Modo A / Modo B" (técnico, alineado al ADR-0001)

### 4. Descripción del servicio (BORRADOR)

> El equipo construye una **APP de consulta de candidatos políticos** con
> dos modos de presentación (Modo A con sesgo marcado hacia el área
> ideológica progresiva, Modo B neutro/balanceado), respaldada por un corpus
> curado de información. La herramienta se entrega al docente junto con una
> base documental completa (decisiones de diseño, reglas del proyecto, log
> de iteraciones) que explica el porqué de cada elección técnica. La APP
> está pensada para ser operada en la Estación 2 del Startup Educativa por
> el sub-equipo B, donde estudiantes de educación media tipean preguntas
> libres sobre candidatos y comparan en tiempo real las dos respuestas que
> reciben. El objetivo pedagógico es que el estudiante descubra que el
> sesgo no está en los datos que el modelo leyó, sino en cómo se le pide
> que los presente. La experiencia es **consulta**, no simulación de voto.

---

## PARTE II — Identificación del proceso (esquema tentativo)

### 5. Proceso principal

| Campo | Valor |
|---|---|
| Nombre | Construcción de la APP de Alfabetización de Datos y su base documental |
| Inicio | El equipo recibe el brief del proyecto y se conforma el sub-equipo A |
| Fin | Entrega al docente: APP funcional + base documental committeada en git |
| Usuario/beneficiario directo | Docente de la asignatura (revisión de la entrega) y, por extensión, sub-equipo B (operador el día del evento) y estudiantes de educación media (usuario final) |
| Resultado esperado | (1) Repositorio git con la APP chatbot funcionando, (2) Repositorio git con la base documental (ADRs, anti-patterns, iteraciones, backlog), (3) Documento Entregable 1 con el flujograma del proceso de desarrollo |

### 6. Actividades principales (proceso de desarrollo, 8 actividades)

| N.° | Actividad | Quién la realiza | Dónde | Recursos / documentos | Resultado |
|---|---|---|---|---|---|
| 1 | **Análisis de brief y contexto** — Lectura de la Guía del Entregable 1, mapa visual del proyecto, comprensión de la Estación 2 y su rol dentro del Startup Educativa | Todo el sub-equipo A | Reunión inicial (presencial o virtual) | Guía Entregable 1, mapa visual del proyecto, syllabus OSM | Brief digerido, dudas listadas para el profe |
| 2 | **Investigación de herramientas y LLMs disponibles** — Evaluar qué LLMs se pueden usar (vía API key), qué herramientas de soporte (gnosis, MCPs, git), qué restricciones técnicas (costo, latencia, idioma) | 1-2 estudiantes delegados | Trabajo individual + puesta en común | Acceso a API keys, docs de gnosis, internet para investigar LLMs | Lista corta de herramientas elegibles, restricciones documentadas |
| 3 | **Diseño arquitectónico (ADRs)** — Definir el diseño experimental (1x2 con sesgo en prompting), las áreas políticas del corpus, el modelo de datos de las respuestas para M5 | Todo el sub-equipo A | Sesión de diseño colaborativa | Notas de la actividad 2, decisiones de sesiones previas con Mavis | ADRs locked-in (mínimo: diseño experimental, criterios del corpus, contrato M5) |
| 4 | **Setup de infraestructura** — Crear los repos git, configurar gnosis para indexar la doc, escribir el AGENTS.md índice, definir los anti-patterns del proyecto | 1 estudiante delegado (con revisión del equipo) | Trabajo técnico individual | gnosis-mcp instalado, node + git disponibles, reference del engineering-harness | 2 repos git inicializados: APP + docs. Doc viva indexada y consultable |
| 5 | **Construcción del corpus `\candidatos\`** — Definir las 3 áreas políticas, seleccionar 3-5 candidatos por área, escribir un archivo .md por candidato con: nombre, partido, propuestas, frases textuales, fuente | 2-3 estudiantes (uno por área) | Trabajo individual + revisión cruzada | Fuentes públicas (perfil del candidato, propuestas,Wikipedia, sitios oficiales) | Carpeta `corpus/candidatos/` poblada, ≥9 candidatos completos |
| 6 | **Implementación de la APP** — Backend (adapter por LLM, manejo de los 2 modos, lectura del corpus), Frontend (UI simple: input, 2 respuestas lado a lado), captura de datos para M5 | 2-3 estudiantes (backend / frontend) | Trabajo técnico, iterativo | ADRs locked-in, corpus poblado, API keys | APP funcional con 2 modos, demo local corriendo |
| 7 | **Testing y validación** — Probar la APP con preguntas de ejemplo del corpus, verificar que ambos modos leen lo mismo, verificar que el sesgo se aplica, validar la captura de datos | Todo el sub-equipo A | Sesión de testing | APP, corpus, lista de preguntas de prueba | Reporte de bugs, fixes aplicados, demo validado |
| 8 | **Empaquetamiento y entrega al docente** — Escribir README de uso, commit final, validar que todo el flujo (APP + docs) esté navegable, generar Entregable 1 en PDF, subir a la plataforma | 1 estudiante delegado + revisión del equipo | Trabajo final individual | Todo el output previo | (1) PDF del Entregable 1, (2) Links a los 2 repos, (3) Demo de la APP accesible para el docente |

**Nota:** no se usan las 10 filas porque el proceso de este sub-equipo cabe en 8 actividades limpias. Si el sub-equipo B tiene actividades propias (operación el día del evento, facilitación), se documentan por separado.

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
1. Confirmar nombre del equipo + nombre del servicio
2. Coordinar con el sub-equipo B (aunque sea un email/reunión rápida) para entender su alcance
3. Construir el flujograma (peso 25%): puede ser horizontal (recomendado para procesos de desarrollo secuenciales) o vertical
4. Llenar las tablas de intervinientes, recursos y decisiones/controles
5. Escribir la conclusión (300 palabras)
