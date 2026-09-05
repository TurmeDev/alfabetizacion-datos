# Dos Tonos — verificación v0

**Estado:** checklist de piloto, no ejecutada. **Fecha:** 2026-09-02.

Esta guía deriva controles de las decisiones existentes; no acepta nuevos ADRs,
no elige stack ni demuestra que la APP ya cumple. Es específica de esta APP, no
parte del core portable del harness. El comportamiento ante caída del proveedor
se mantiene como propuesta hasta acordar su aceptación.

## Cómo usarla por task

1. En el task packet, seleccionar IDs aplicables y registrar las exclusiones con
   motivo. Para una task documental no exigir pruebas runtime; antes del demo
   revisar todo el alcance obligatorio.
2. Fijar el resultado esperado antes de cambiar archivos. Completar el método con
   comandos existentes o revisión concreta; hoy no se inventan scripts ni tests.
3. Registrar `PASS`, `FAIL` o `UNKNOWN` por check, con evidencia y limitaciones.
   `not_applicable` describe aplicabilidad, no un resultado. La falta de código,
   contrato o herramienta para un requisito necesario no equivale a `PASS`.
4. Declarar quién verificó y si fue el mismo ejecutor. Un control documental
   aprobado no demuestra cumplimiento runtime ni independencia del verificador.

El corpus de candidatos de la APP es distinto del corpus de tasks del harness.
Se puede preparar documentación y contenido antes de programar el chatbot.
Para repetir una prueba, conservar revisión de código, corpus, configuración y
entrada; los resultados y diagnósticos previos no son input del ejecutor evaluado.

## Fuentes y autoridad

- [ADR-0001 aceptado](adr/0001-diseno-experimental-1x2.md): un modelo, dos modos,
  misma entrada y corpus; balance no implica neutralidad absoluta.
- [No asumir](anti-patterns/01-no-asumir.md): decisiones faltantes se consultan.
- [Corpus antes de código](anti-patterns/02-corpus-antes-codigo.md).
- [Demo ciego](anti-patterns/03-ciego-en-demo.md).
- [Alcance hermético](anti-patterns/04-alcance-hermetico.md).
- [SECURITY.md](../SECURITY.md) y [publicación segura](publicacion-segura.md).
- [Backlog](backlog.md): pendientes, no decisiones aceptadas.

La contradicción documental sobre el modo neutro se corrigió el 2026-09-02 para
alinearla con ADR-0001: ambos modos conservan el corpus. Esto no establece una
precedencia universal para futuros conflictos; una contradicción nueva se escala.

## Controles seleccionables

| ID | Requisito y fuente | Cuándo aplica | Evidencia y criterio observable |
| --- | --- | --- | --- |
| DT-01 | Corpus previo; regla 02 | Preparación de datos y antes de código del chatbot | Estructura y criterios humanos identificados, al menos un área completa conforme a esos criterios y fichas con los campos/fuentes requeridos. Conservar revisión o snapshot recuperable; no asumir que una ficha satisface un área sin definición humana. |
| DT-02 | Mismo modelo, pregunta y corpus; ADR-0001 | Integración de ambos modos | Comparar solicitudes sanitizadas o captura local con entradas ficticias: misma identidad/versión del modelo, pregunta y contenido documental, con diferencias de prompt identificadas. El nombre de una carpeta compartida no prueba que ambos reciban el mismo contenido. |
| DT-03 | Modelo oculto al estudiante; regla 03 | UI, errores, handout y exportación M5 | Revisar pantallas normal/error, logs visibles y material del estudiante: etiquetas Modo A/B, sin nombre del modelo. Equipo y M5 conservan identificación interna según el contrato acordado; no borrarla para hacer pasar el control visual. |
| DT-04 | Sin búsqueda web en runtime; ADR-0001 y SECURITY | Integración y demo | Revisar configuración/capacidades y observar las invocaciones en pruebas: sin herramientas ni llamadas de búsqueda web. No confundir la conexión autorizada al proveedor con búsqueda, ni extender esta prohibición a consultar fuentes durante desarrollo. Una instrucción en el prompt por sí sola no basta. |
| DT-05 | Sin PII ni envío de datos de estudiantes a servicios externos; regla 04 y SECURITY | Entrada, persistencia, logs, proveedor y exportación | Tras acordar privacidad, usar sólo datos ficticios para comprobar el flujo antes de transmisión y almacenamiento; revisar solicitudes, logs, registros y exportaciones. No solicitar nombres no prueba ausencia de PII en texto libre. No guardar preguntas/respuestas crudas por defecto. Registrar límites de cobertura: unas pruebas no garantizan ausencia universal de PII. |
| DT-06 | Abstención fuera del corpus; ADR-0001 | Respuestas de ambos modos | Con corpus fijo, probar preguntas respondibles y otras sin respaldo: las primeras se sustentan en el corpus; las segundas responden «No tengo datos sobre eso» sin añadir afirmaciones externas. Conservar resultados realmente observados de ambos modos con entradas ficticias; sólo rechazar todo no satisface el control. |
| DT-07 | Error controlado ante proveedor caído; propuesta del piloto | Integración del proveedor | Acordar primero el comportamiento visible y el registro. Luego simular indisponibilidad localmente, sin causar una caída real: no presentar éxito ni respuesta inventada, no filtrar secretos/datos/modelo al estudiante. Timeout, reintentos y recuperación quedan por decidir, no se implementan por esta checklist. |
| DT-08 | Registro compatible con M5; ADR-0004 pendiente | Exportación e integración con M5 | Validar una muestra ficticia contra la versión de contrato acordada con M5: campos, tipos, identificadores, procedencia y tratamiento de errores según ese contrato. Hoy es `UNKNOWN` si se pretende verificar conformidad; no inventar el schema ni dar aprobación en nombre de M5. |
| DT-09 | Sin uploads ni memoria entre conversaciones; regla 04 | UI y sesiones | Revisar que no exista carga de archivos del estudiante; abrir dos sesiones ficticias y comprobar que la segunda no recibe contenido ni estado conversacional de la primera. No confundir el corpus común con memoria de conversaciones. |
| DT-10a | Idioma único: español; ADR-0001 y regla 04 | UI, respuestas, errores y material del estudiante | Revisar que la interfaz, las respuestas, los errores y el material destinado al estudiante estén en español. Registrar por separado cualquier contenido interno que no sea visible durante el demo. |
| DT-10b | Tiempo limitado por sesión; ADR-0001 y regla 04 | UI y operación del demo | Cuando el equipo acuerde el valor y el mecanismo, medir una sesión ficticia y comprobar que el límite se aplica de forma observable sin perder ni atribuir datos a otro estudiante. Hasta entonces el resultado es `UNKNOWN`, no `PASS`. |
| DT-10c | Honestidad sobre el modo balanceado; ADR-0001 y regla 04 | UI, contenido y encuadre educativo | Revisar que no se presente el modo balanceado como verdad, neutralidad absoluta o ausencia de sesgo. El material debe explicar que ambos modos usan el mismo modelo, pregunta y corpus, y difieren en el framing solicitado. |
| DT-10d | Demo educativo, no persuasivo ni personalizado políticamente; regla 04 | Prompts, respuestas y preparación del demo | Revisar con el responsable humano que el encuadre busque alfabetización y que el sistema no adapte orientación o persuasión política a características del estudiante. Probar sólo con perfiles ficticios y conservar las limitaciones de cobertura. |
| DT-11 | Sin secretos ni datos de estudiantes en repositorio/cliente; SECURITY | Cambios de configuración, evidencia y publicación | Revisar archivos modificados y evidencias por rutas afectadas; no incluir credenciales, PII ni artefactos locales restringidos. Antes de publicar aplicar la lista de publicación segura. Esta revisión no equivale a una auditoría completa del historial. |

Los controles de comportamiento requieren observación del comportamiento: leer
prompts no prueba DT-05/06 y comparar outputs no prueba DT-02. Los controles
con evidencia insuficiente permanecen `UNKNOWN`, no se relajan para pasar el piloto.

## Decisiones que siguen abiertas

| Decisión | Qué debe resolver el humano o equipo responsable | Qué bloquea |
| --- | --- | --- |
| Liberación del corpus v1 / DT-TASK-003 | Revisión humana de las tres fichas y congelado de `corpus/v1/` con índice y hashes | Declarar DT-01 satisfecho y empezar código del chatbot. ADR-0003 ya resolvió criterios, fuentes y versionado; no reabrirlos para superar el gate. |
| Privacidad / ADR-0005 | Texto libre, transmisión, minimización, conservación, acceso y eliminación | Usar entradas reales de estudiantes, persistir conversaciones o enviarlas al proveedor. La prohibición vigente de SECURITY no queda levantada por esta guía. |
| Contrato M5 / ADR-0004 | Schema, procedencia, errores y tratamiento de datos, acordados con M5 | Implementar el registro definitivo y declarar DT-08 conforme; resolver antes del código según el backlog. |
| Stack / ADR-0002 | Proveedor e integración tras las decisiones previas | Código/integración del proveedor; observar también las condiciones previas de SECURITY. |
| Error de proveedor / DT-07 | Mensaje, límites y recuperación aceptables | Implementar y aprobar ese comportamiento, no la preparación del corpus. |
| Métricas y demo / ADR-0006 | Evaluación del contraste, encuadre educativo y operación de la sesión | Declarar efectividad del demo; no inventar umbrales ni equiparar balance con neutralidad absoluta. |

No se solicitan decisiones ajenas a la task para completar una corrección
documental. Antes de programar o desplegar siguen vigentes las condiciones de
SECURITY, incluidas las relativas a ADRs, secretos y escaneo de secretos. La guía
no configura esos mecanismos ni los promueve al core del harness.

## Registro de una comprobación

En el cierre del packet, sin crear otro formulario paralelo:

- ID, aplicabilidad, revisión de código/corpus/configuración e input de prueba.
- Método realmente ejecutado, resultado y puntero sanitizado a evidencia.
- Verificador, limitaciones y siguiente acción si hay `FAIL` o `UNKNOWN`.

No hay resultados runtime registrados por crear esta checklist. Una task puede
cerrar satisfactoriamente por su alcance documental sin declarar lista la APP.
