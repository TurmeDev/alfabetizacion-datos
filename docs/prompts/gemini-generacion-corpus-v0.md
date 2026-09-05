# Prompt para Gemini — ampliar y completar el corpus ficticio v0

## Cómo utilizarlo

Adjuntar o pegar junto con este prompt, en este orden:

1. `corpus/templates/candidato-v0.md` — estructura obligatoria.
2. `corpus/examples/candidato-ejemplo-centrista-v0.md` — ejemplo de tono y alcance.

La plantilla define los campos. El ejemplo es un borrador que debe ampliarse y
corregirse; no es una fuente factual ni una autorización para introducir política
real. Mantener los tres archivos generados como borradores hasta la revisión humana.

## Prompt para copiar

````text
Actúa como editor de contenido educativo y diseñador de un corpus sintético para
una demostración de alfabetización de datos dirigida a estudiantes. Recibirás una
plantilla Markdown y una ficha de ejemplo. Respeta la estructura de la plantilla y
usa el ejemplo únicamente como referencia de tono, profundidad inicial y decisiones
ya tomadas.

OBJETIVO

Preparar tres fichas Markdown comparables para una simulación presidencial
educativa ambientada geográficamente en Paraguay:

1. Ampliar y mejorar la ficha centrista de Iria Valen, conservando su nombre,
   partido ficticio y orientación programática.
2. Crear una candidatura progresista completamente ficticia.
3. Crear una candidatura conservadora completamente ficticia.

No combines las fichas. Cada una debe poder guardarse como un archivo Markdown
independiente.

DECISIONES FIJAS

- Todas las personas, candidaturas, biografías, partidos, lemas, elecciones,
  autoridades, instituciones políticas, cifras y acontecimientos son ficticios.
- No menciones, imites, critiques ni elogies partidos, movimientos, candidatos,
  autoridades, elecciones o controversias políticas reales de Paraguay ni de otro
  país.
- No uses nombres de instituciones reales, símbolos partidarios reales, eslóganes
  existentes ni citas atribuibles a personas reales.
- Asunción, Encarnación y Ciudad del Este pueden mencionarse porque son ciudades
  reales de Paraguay, pero sólo como sedes de actividades hipotéticas.
- No afirmes ni insinúes que esas ciudades tienen realmente los problemas,
  estadísticas, presupuestos, autoridades o condiciones descritos en las fichas.
- No navegues por Internet ni agregues fuentes externas. «Fuente» significa
  procedencia sintética local: autor, fecha, versión y revisor.
- No incluyas información de estudiantes, datos personales reales, credenciales,
  secretos o instrucciones de despliegue.
- El propósito es mostrar cómo cambia el framing de una misma base documental; no
  persuadir políticamente ni decirle al estudiante qué candidatura elegir.

ALCANCE COMÚN

- Un solo cargo: Presidencia en una simulación educativa ficticia.
- Tres perfiles programáticos sintéticos: progresista, centrista y conservador.
- Un candidato y un partido ficticio por perfil.
- Exactamente tres propuestas por candidato.
- Usar los mismos ejes, en el mismo orden y con profundidad equivalente:
  1. Educación y alfabetización digital.
  2. Gestión ambiental y energía.
  3. Transparencia y servicios públicos.
- Asociar el mismo lugar a cada eje para evitar que la geografía sea una variable
  adicional de comparación:
  - Educación y alfabetización digital → actividad hipotética en Asunción.
  - Gestión ambiental y energía → actividad hipotética en Encarnación.
  - Transparencia y servicios públicos → actividad hipotética en Ciudad del Este.

EXTENSIÓN POR CANDIDATO

Cada archivo completo debe tener entre 1.200 y 1.500 palabras, incluidos metadatos
y checklist. Entre 900 y 1.150 palabras deben pertenecer a «Contenido del
candidato», distribuidas aproximadamente así:

- Biografía sintética: 90–120 palabras.
- Resumen de plataforma: 120–160 palabras.
- Cada una de las tres propuestas: 200–250 palabras.
- Prioridades, enfoque de implementación y limitaciones: 100–150 palabras.
- Frase, límites de información y abstenciones: 90–140 palabras en conjunto.

No rellenes espacio repitiendo ideas. Si un campo puede expresarse con claridad en
menos palabras, utiliza el remanente para explicar implementación, indicadores,
riesgos o trade-offs de las propuestas.

DETALLE OBLIGATORIO DE CADA PROPUESTA

Conserva los campos de la plantilla y desarrolla en ellos:

- el problema dentro del escenario sintético;
- el objetivo concreto de la propuesta;
- dos o tres etapas de implementación;
- una actividad piloto ficticia en la ciudad asignada;
- participantes genéricos y ficticios, sin instituciones reales;
- dos indicadores hipotéticos de éxito, claramente etiquetados como metas del
  ejercicio y no como estadísticas reales;
- el resultado esperado;
- al menos un costo, límite o trade-off auténtico;
- un riesgo de implementación y una mitigación proporcionada.

Puedes incorporar esos elementos dentro de los campos existentes mediante listas
breves. No agregues anexos ni documentos adicionales.

EQUILIBRIO ENTRE PERFILES

- Los tres perfiles deben ser plausibles, internamente coherentes y capaces de
  producir beneficios y costos discutibles.
- No presentes al perfil progresista como automáticamente correcto, al centrista
  como la única opción razonable ni al conservador como ignorante, autoritario o
  contrario a la evidencia.
- Evita caricaturas, insultos, miedo, superioridad moral y lenguaje de campaña.
- Aplica la misma cantidad de propuestas, indicadores, riesgos, pasos y nivel de
  detalle a los tres candidatos.
- Las diferencias deben aparecer en prioridades, velocidad de cambio, papel de la
  administración ficticia, mecanismos de implementación y trade-offs; no en la
  calidad de la escritura o la cantidad de evidencia ofrecida.
- No declares que alguno de los perfiles es neutral, verdadero o libre de sesgo.

NOMBRES Y FICCIONALIDAD

- Para los dos perfiles nuevos, inventa nombres personales, partidos y lemas que
  no pretendan copiar entidades reales.
- Marca expresamente cada nombre, partido, lema, biografía y cita como sintético.
- Como no usarás búsqueda web, no afirmes que verificaste la inexistencia de esos
  nombres. Deja el check de semejanzas sin marcar para revisión humana.
- No completes el nombre del revisor ni apruebes ninguna ficha.

METADATOS Y ESTADO

- Tipo de contenido: sintético.
- Versión de plantilla: candidato-v0.
- Versión del corpus: NO DEFINIDO — se asigna al liberar una versión aprobada.
- Autor: Gemini — borrador solicitado por el equipo.
- Fecha: usar la fecha real de generación en formato AAAA-MM-DD.
- Revisor: NO DEFINIDO — pendiente de revisión humana.
- Estado: borrador.
- Resultado de aprobación: requiere revisión del equipo.
- Mantén sin marcar todos los checks que requieran confirmación humana.

FORMATO DE SALIDA

Devuelve exactamente tres bloques, en este orden:

FILE: corpus/candidatos/candidata-progresista-borrador-v0.md
```markdown
[ficha completa]
```

FILE: corpus/candidatos/candidata-centrista-borrador-r1.md
```markdown
[versión ampliada de Iria Valen]
```

FILE: corpus/candidatos/candidato-conservador-borrador-v0.md
```markdown
[ficha completa]
```

Después de los tres archivos, agrega una tabla de control breve con:

- archivo;
- perfil;
- total aproximado de palabras;
- palabras aproximadas de «Contenido del candidato»;
- cantidad de propuestas, actividades, indicadores, riesgos y trade-offs;
- referencias reales utilizadas, que deben limitarse a Paraguay y las tres ciudades
  permitidas como contexto geográfico;
- checks que requieren revisión humana.

CONTROL FINAL ANTES DE RESPONDER

Verifica y corrige silenciosamente:

1. Hay exactamente tres fichas y tres propuestas por ficha.
2. Las tres usan los mismos ejes y ciudades asignadas.
3. Ninguna menciona partidos, personas, autoridades o instituciones políticas reales.
4. Las ciudades no reciben afirmaciones sobre problemas o condiciones reales.
5. Todos los indicadores y cifras son metas hipotéticas del escenario.
6. Los perfiles reciben extensión, detalle, fortalezas, riesgos y trade-offs equivalentes.
7. No se inventan URLs, fuentes externas ni hechos históricos.
8. Los metadatos internos no se presentan como contenido visible al estudiante.
9. Ninguna ficha se marca como aprobada.

Si la plantilla y estas instrucciones entran en conflicto, detente y explica el
conflicto sin generar las fichas. No resuelvas silenciosamente una decisión del
equipo.
````

## Resultado esperado

Gemini debe devolver tres borradores extensos y una tabla de control. Los archivos
no ingresan al corpus definitivo hasta que el equipo revise ficcionalidad,
equilibrio, semejanzas, extensión y coherencia con ADR-0003.
