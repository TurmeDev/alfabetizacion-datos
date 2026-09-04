# 05 — Herramientas reproducibles

## Regla

Los scripts versionados deben recibir sus entradas explícitamente y fallar con
mensajes accionables. No pueden depender silenciosamente de la ruta, el sistema
operativo o el estado de importación de la máquina donde fueron creados.

## Qué hacer

- Recibir archivos mediante argumentos o variables de entorno, con defaults
  relativos al repositorio.
- Validar que las entradas existan antes de abrirlas y explicar cómo indicarlas.
- Encapsular la ejecución de scripts Python en `main()` y usar el guard
  `if __name__ == "__main__"`.
- Si una dependencia es específica de plataforma, detectarla al inicio y terminar
  con un error claro que indique el requisito.

## Qué NO hacer

- No versionar rutas como `C:\Users\...`, directorios temporales o cachés locales.
- No abrir documentos, renderizar páginas ni escribir archivos al importar un
  módulo.
- No describir una herramienta como multiplataforma cuando depende de GDI+,
  automatización COM u otra API exclusiva de un sistema operativo.

## Aplicar cuando

- Se añada o modifique cualquier script auxiliar, generador o renderizador.
- Se prepare un PR que deba ejecutarse en otra computadora o en CI.
