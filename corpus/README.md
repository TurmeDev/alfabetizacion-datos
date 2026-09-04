# Corpus de candidatos ficticios

Este directorio contiene el corpus único que consultarán los dos modos de la
APP. El contenido político es completamente sintético. Las ciudades reales de
Paraguay sólo pueden usarse como ubicación de actividades hipotéticas; no se
incorporan personas, partidos, elecciones, autoridades ni afirmaciones
políticas reales.

## Estado actual

Todavía no existe una versión liberada para la APP. Los tres perfiles de
`candidatos/` son borradores sometidos a revisión humana. La plantilla aprobada
está en `templates/candidato-v0.md` y `examples/` contiene material de discusión,
no contenido ejecutable.

## Estructura y ciclo de vida

```text
corpus/
├── candidatos/          # borradores editables; la APP no debe leerlos
├── examples/            # ejemplos no normativos
├── templates/           # contrato de ficha
└── vN/
    ├── README.md        # versión, fecha, estado y cambios
    ├── _indice.md       # archivos, perfiles, revisión y SHA-256
    └── candidatos/      # copia inmutable de las fichas aprobadas
```

La primera liberación será `corpus/v1/`. Una versión se considera liberada sólo
cuando contiene las tres fichas aprobadas, su `README.md` y su `_indice.md`. Una
corrección posterior crea `v2`; no se modifica una versión ya usada en un demo.

Cada ejecución debe conservar al menos `corpus_version` (por ejemplo, `v1`) y el
commit Git del repositorio. Esa combinación permite reproducir el contenido que
recibió el modelo.

## Revisión mínima

Antes de promover una ficha desde `candidatos/` a una versión:

1. Arnold y Mathias, responsables de P4, coordinan la revisión. La persona que
   aprueba debe ser distinta de quien realizó la última edición de la ficha.
2. La persona registra su nombre, la fecha, el resultado y cualquier observación
   en «Aprobación interna».
3. Sólo un resultado `aprobado` permite copiar la ficha a `vN/candidatos/`.
4. El índice de la versión registra el archivo, perfil, revisor, fecha y SHA-256.

La identidad del revisor puede cambiar entre versiones, pero nunca puede quedar
como `NO DEFINIDO` en una versión liberada. Si Arnold y Mathias editan una ficha
en conjunto, debe firmarla otra persona del equipo. Una salida generada por IA no
cuenta como revisión humana. La asignación completa está en
[`docs/responsables-procesos.md`](../docs/responsables-procesos.md).

## Criterio de completitud v1

La versión `v1` requiere exactamente una candidatura progresista, una centrista
y una conservadora para el mismo cargo ficticio, con tres propuestas comparables
por ficha. Hasta completar y firmar esa revisión, el corpus puede discutirse y el
ADR-0003 puede documentarse, pero la APP no puede empezar a consumirlo.
