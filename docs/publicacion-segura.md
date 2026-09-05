# Publicación segura del repositorio

## Antes de hacer público o de subir cambios

1. Revisar `git status` y confirmar que no se añade ningún archivo local,
   especialmente `.env*`, llaves, bases SQLite o artefactos generados.
2. Buscar secretos en los archivos modificados y comprobar también el
   historial si alguna credencial llegó a estar versionada.
3. Verificar que no haya PII de estudiantes en `corpus/`, `docs/`, entregas,
   capturas ni archivos adjuntos.
4. Confirmar que las reglas de `develop` y `main` siguen activas y que los
   colaboradores usan pull requests.

## Uso futuro de secretos

- Definir el proveedor y el nombre exacto de cada variable en ADR-0002.
- Copiar `.env.example` a `.env.local` solo en cada equipo local.
- Cargar los valores reales únicamente en el entorno de despliegue o en los
  secretos de GitHub Actions cuando exista una automatización autorizada.
- No pegar claves en commits, issues, pull requests, documentos ni chats.
- Si una clave se expone: revocarla primero; después eliminarla del árbol y
  del historial antes de publicar.

## Flujo para colaboradores

1. Crear una rama propia desde `develop`.
2. Abrir un pull request hacia `develop` con una descripción breve del cambio.
3. Esperar una aprobación y resolver las conversaciones antes de fusionar.
4. Promover una versión estable desde `develop` hacia `main` mediante otro pull
   request.
5. No usar force-push ni eliminar ramas protegidas.

## Artefactos de entrega

`entregas/**/generated/` está ignorado porque contiene salidas regenerables.
Cuando se necesite entregar una versión final, adjuntarla al canal o medio
acordado con el docente, o versionarla deliberadamente en una ubicación que
el equipo haya decidido revisar.
