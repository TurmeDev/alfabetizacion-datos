# 01 — No asumir

## Regla
**No inventar requisitos, decisiones, ni datos del proyecto.** Si falta info,
preguntar al usuario antes de avanzar.

## Por qué existe
- El proyecto tiene 4 módulos integrados (TOM + Control de Gestión). Asumir
  significa romper la integración con los otros equipos.
- El profe puede tener requisitos no documentados (aprobación colegio, formato
  de entrega, criterios de evaluación).
- Cambiar después es más caro que preguntar antes.

## Qué hacer
- Si el usuario dice "hacé X" sin detalles, **preguntar antes de ejecutar**.
- Si una decisión tiene 2+ caminos razonables, **presentar el trade-off con 1
  recomendación** y dejar que el usuario elija.
- Si no podés avanzar sin info, **decir qué info falta** explícitamente.

## Qué NO hacer
- ❌ Inventar nombres de archivos / funciones / carpetas
- ❌ Asumir defaults de stack (lenguaje, framework) sin preguntar
- ❌ Asumir permisos o aprobaciones que el equipo no confirmó
- ❌ Avanzar "para no molestar" — molestar con 1 pregunta es mejor que rehacer

## Ejemplo
> User: "Hacelo responsive"
> ❌ Asumir mobile-first y aplicar media queries
> ✅ Preguntar: "¿Mobile-first o desktop-first? ¿Breakpoints estándar (sm/md/lg) o custom?"

## Aplicar cuando
- Cualquier decisión que involucre el alcance del proyecto
- Cualquier dato que el usuario no haya provisto explícitamente
- Cualquier default que se pueda configurar de otra forma
