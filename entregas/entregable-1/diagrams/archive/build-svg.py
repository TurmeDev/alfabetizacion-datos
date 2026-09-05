"""
Genera el flujograma formal ANSI con sub-procesos como cuadros conectados
dentro de la cascada vertical del proceso principal.

Diseño v4 (2026-08-23, ajuste lógico del borrador):
- 9 actividades (NO 10): se eliminó "Pruebas" como proceso separado.
  La validación es un control de calidad al final de cada proceso.
- Cada sub-proceso empieza con un VERBO (Diseñar, Redactar, Implementar,
  Validar, etc.) que define qué es.
- Cada actividad cierra con un rombo de validación externa. La Actividad 7
  valida la prestación y registra incidencias para el cierre de evidencias.
- El PDF/Word no es el fin del servicio: es evidencia académica posterior.
"""

from pathlib import Path

# Paleta
BG = "#1e1e1e"
TEXT = "#ffffff"
TEXT_DIM = "#b0b0b0"
TEXT_FAINT = "#888888"
MAIN_FILL = "#2a4a6b"
SUB_FILL = "#1e3a5a"
OUTPUT_FILL = "#3a6b41"
DECISION_FILL = "#8a6e2a"
GROUP_STROKE = "#555555"
ARROW = "#b0b0b0"

# Geometría
VB_W = 1100
BOX_H = 50
GAP = 30

MAIN_X, MAIN_W = 200, 700
SUB_X, SUB_W = 300, 500
OUT_X, OUT_W = 350, 400
DEC_CX = 550
DEC_HW = 180   # ancho medio (rombo de 360px) — caben 2 líneas de texto
DEC_HH = 25    # alto medio (rombo de 50px) — mismo alto que una caja, no cambia y-coords

RETURN_X_FAR = 120
RETURN_X_NEAR = 180

# Datos — 9 actividades con verbos primero
ACTIVITIES = [
    {
        "id": 1,
        "title": "Analizar la guía y el contexto del proyecto",
        "subs": [
            ("1.1", "Leer la guía del Entregable 1"),
            ("1.2", "Leer el mapa visual del proyecto"),
            ("1.3", "Listar dudas para consultar al docente"),
        ],
        "sub_output": "Guía comprendida, dudas listadas",
        "post_decision": ("¿Guía comprendida?", "revisar 1.1", "1.1"),
    },
    {
        "id": 2,
        "title": "Diseñar el servicio",
        "subs": [
            ("2.1", "Fijar el objetivo de aprendizaje de la estación"),
            ("2.2", "Definir la comparación de dos respuestas"),
            ("2.3", "Redactar la explicación breve para el estudiante"),
        ],
        "sub_output": "Dinámica educativa definida y explicable",
        "post_decision": ("¿Objetivo y dinámica|son claros?",
                          "revisar 2.1", "2.1"),
    },
    {
        "id": 3,
        "title": "Seleccionar la herramienta de apoyo",
        "subs": [
            ("3.1", "Identificar herramientas de IA con acceso del equipo"),
            ("3.2", "Comparar costo, idioma, velocidad y facilidad"),
            ("3.3", "Elegir la herramienta para operar la estación"),
        ],
        "sub_output": "Herramienta elegida para la estación",
        "post_decision": ("¿Herramienta apta|para la estación?",
                          "revisar 3.1", "3.1"),
    },
    {
        "id": 4,
        "title": "Preparar fichas de candidatos ficticios",
        "subs": [
            ("4.1", "Aplicar los tres perfiles ficticios acordados"),
            ("4.2", "Redactar una ficha por perfil programático"),
            ("4.3", "Redactar fichas con datos comparables"),
            ("4.4", "Verificar ficción, equilibrio y comparabilidad"),
        ],
        "sub_output": "Fichas completas y verificadas",
        "post_decision": ("¿Fichas completas|y verificadas?",
                          "revisar 4.3", "4.3"),
    },
    {
        "id": 5,
        "title": 'Preparar el chatbot "Dos Tonos"',
        "subs": [
            ("5.1", "Cargar la base verificada de candidatos"),
            ("5.2", "Preparar la respuesta neutra"),
            ("5.3", "Preparar la respuesta con encuadre comparativo"),
            ("5.4", "Armar la vista de comparación del chatbot"),
            ("5.5", "Probar consulta del chatbot y registro de datos"),
        ],
        "sub_output": "Chatbot listo para demostración",
        "post_decision": ("¿Chatbot|validado?",
                          "revisar 5.1", "5.1"),
    },
    {
        "id": 6,
        "title": "Preparar la demostración de la Estación 2",
        "subs": [
            ("6.1", "Redactar guion de bienvenida para estudiantes"),
            ("6.2", "Asignar roles de facilitación con sub-equipo B"),
            ("6.3", "Verificar mesa, dispositivo y conexión"),
            ("6.4", "Confirmar lista de materiales de la estación"),
        ],
        "sub_output": "Estación 2 lista, sub-equipo B alineado",
        "post_decision": ("¿Estación 2 lista|para operar?",
                          "revisar 6.4", "6.4"),
    },
    {
        "id": 7,
        "title": "Prestar el servicio: demostración en el colegio",
        "subs": [
            ("7.1", "Recibir al grupo rotativo de estudiantes"),
            ("7.2", "Explicar la actividad en lenguaje simple"),
            ("7.3", "Ingresar en el chatbot la consulta del estudiante"),
            ("7.4", "Mostrar dos respuestas sobre la misma información"),
            ("7.5", "Guiar la comparación de diferencias"),
            ("7.6", "Registrar respuestas e incidencias acordadas"),
        ],
        "sub_output": "Experiencia realizada y datos registrados",
        "post_decision": ("¿Experiencia y datos|registrados?",
                          "registrar incidencia 8.1", "8.1"),
    },
    {
        "id": 8,
        "title": "Cerrar la estación y ordenar evidencia",
        "subs": [
            ("8.1", "Reunir observaciones de los facilitadores"),
            ("8.2", "Ordenar registros e incidencias de la actividad"),
            ("8.3", "Entregar información acordada a Módulo 5"),
        ],
        "sub_output": "Evidencia del servicio ordenada y usable",
        "post_decision": ("¿Evidencia completa|y usable?",
                          "revisar 8.1", "8.1"),
    },
    {
        "id": 9,
        "title": "Elaborar el informe académico del proceso",
        "subs": [
            ("9.1", "Redactar tablas de roles, recursos y controles"),
            ("9.2", "Incluir el flujograma formal del servicio"),
            ("9.3", "Redactar aprendizaje y mejoras del equipo"),
            ("9.4", "Armar el documento con las 6 partes"),
            ("9.5", "Verificar formato final y nombre de archivo"),
        ],
        "sub_output": "Documento completo y alineado al servicio",
        "post_decision": ("¿Documento explica|el servicio?",
                          "revisar 9.4", "9.4"),
    },
]


def arrow(x1, y1, x2, y2, color=ARROW, width=1.5, dashed=False):
    da = ' stroke-dasharray="3,3"' if dashed else ""
    return (f'<line x1="{x1}" y1="{y1}" x2="{x2}" y2="{y2}" '
            f'stroke="{color}" stroke-width="{width}" '
            f'marker-end="url(#arrow)"{da}/>')


def path_arrow(d, color=ARROW, width=1.5, dashed=False):
    da = ' stroke-dasharray="3,3"' if dashed else ""
    return (f'<path d="{d}" fill="none" stroke="{color}" '
            f'stroke-width="{width}" marker-end="url(#arrow)"{da}/>')


def main_box(x, y, w, label, sub=None):
    sub_html = (f'<text x="{x + w / 2}" y="{y + 36}" text-anchor="middle" '
                f'font-size="11" fill="#e8e8e8">{sub}</text>') if sub else ""
    return (
        f'<rect x="{x}" y="{y}" width="{w}" height="{BOX_H}" '
        f'fill="{MAIN_FILL}" stroke="{TEXT}" stroke-width="1.5" rx="4"/>'
        f'<text x="{x + w / 2}" y="{y + 22}" text-anchor="middle" '
        f'font-size="13" font-weight="bold" fill="{TEXT}">{label}</text>'
        f'{sub_html}'
    )


def sub_box(x, y, w, sid, title):
    return (
        f'<rect x="{x}" y="{y}" width="{w}" height="{BOX_H}" '
        f'fill="{SUB_FILL}" stroke="{TEXT_DIM}" stroke-width="1.2" rx="4"/>'
        f'<text x="{x + 18}" y="{y + 22}" font-size="11" font-weight="bold" '
        f'fill="{TEXT}">{sid}</text>'
        f'<text x="{x + w / 2 + 15}" y="{y + 22}" text-anchor="middle" '
        f'font-size="11" fill="{TEXT}">{title}</text>'
    )


def output_box(x, y, w, label):
    return (
        f'<rect x="{x}" y="{y}" width="{w}" height="{BOX_H}" '
        f'fill="{OUTPUT_FILL}" stroke="{TEXT}" stroke-width="1.5" rx="4"/>'
        f'<text x="{x + 25}" y="{y + 22}" font-size="11" font-weight="bold" '
        f'fill="{TEXT}">Output</text>'
        f'<text x="{x + w / 2 + 25}" y="{y + 22}" text-anchor="middle" '
        f'font-size="11" fill="{TEXT}">{label}</text>'
    )


def decision(cx, cy, label):
    """Renderiza un rombo de decisión. Si el label contiene '|', se parte en 2 líneas."""
    lines = label.split("|")
    n = len(lines)
    if n == 1:
        text_y = cy + 4
        text_elements = (
            f'<text x="{cx}" y="{text_y}" text-anchor="middle" font-size="11" '
            f'font-weight="bold" fill="{TEXT}">{lines[0]}</text>'
        )
    else:
        # 2 líneas centradas verticalmente: separacion 14px
        line1_y = cy - 3
        line2_y = cy + 11
        text_elements = (
            f'<text x="{cx}" y="{line1_y}" text-anchor="middle" font-size="11" '
            f'font-weight="bold" fill="{TEXT}">{lines[0]}</text>'
            f'<text x="{cx}" y="{line2_y}" text-anchor="middle" font-size="11" '
            f'font-weight="bold" fill="{TEXT}">{lines[1]}</text>'
        )
    return (
        f'<polygon points="{cx},{cy - DEC_HH} {cx + DEC_HW},{cy} '
        f'{cx},{cy + DEC_HH} {cx - DEC_HW},{cy}" '
        f'fill="{DECISION_FILL}" stroke="{TEXT}" stroke-width="1.5"/>'
        f'{text_elements}'
    )


def ellipse_node(cx, cy, rx, ry, label, sublabel):
    return (
        f'<ellipse cx="{cx}" cy="{cy}" rx="{rx}" ry="{ry}" '
        f'fill="{OUTPUT_FILL}" stroke="{TEXT}" stroke-width="1.5"/>'
        f'<text x="{cx}" y="{cy - 4}" text-anchor="middle" font-size="12" '
        f'font-weight="bold" fill="{TEXT}">{label}</text>'
        f'<text x="{cx}" y="{cy + 12}" text-anchor="middle" font-size="10" '
        f'fill="{TEXT}">{sublabel}</text>'
    )


def lookup_subprocess_y(target_id):
    """Busca la coordenada y del sub-proceso con id target_id. Retorna None si no existe."""
    for a in ACTIVITIES:
        for sy, sid, _ in a.get("_subs_y", []):
            if sid == target_id:
                return sy
    return None


# ---- Compute y-coordinates ----
y_cursor = 140 + GAP  # after INICIO
for idx, act in enumerate(ACTIVITIES):
    act["_y"] = y_cursor
    y_cursor += BOX_H + GAP

    if act.get("subs"):
        act["_y_group_label"] = y_cursor - GAP - 8
        act["_y_subs_start"] = y_cursor
        sub_ys = []
        for sid, stitle in act["subs"]:
            sub_ys.append((y_cursor, sid, stitle))
            y_cursor += BOX_H + GAP
        act["_subs_y"] = sub_ys

        if act.get("sub_decision"):
            dec_label, return_label, return_to = act["sub_decision"]
            act["_y_sub_decision"] = y_cursor + DEC_HH
            y_cursor += BOX_H + GAP
            act["_sub_decision"] = (dec_label, return_label, return_to)

        act["_y_sub_output"] = y_cursor
        y_cursor += BOX_H + GAP

    if act.get("post_decision"):
        dec_label, return_label, return_to = act["post_decision"]
        act["_y_post_decision"] = y_cursor + DEC_HH
        y_cursor += BOX_H + GAP
        act["_post_decision"] = (dec_label, return_label, return_to)

# FIN
fin_y = y_cursor + DEC_HH
y_cursor += BOX_H + GAP + BOX_H

VIEWBOX_H = y_cursor + 250  # leave room for legend

# ---- Generate SVG ----
parts = []
parts.append('<?xml version="1.0" encoding="UTF-8"?>')
parts.append(
    f'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 {VB_W} {VIEWBOX_H}" '
    f'font-family="Segoe UI, Arial, sans-serif" font-size="13" fill="{TEXT}">'
)
parts.append(f'''  <defs>
    <marker id="arrow" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="6" markerHeight="6" orient="auto-start-reverse">
      <path d="M 0 0 L 10 5 L 0 10 z" fill="{ARROW}"/>
    </marker>
  </defs>''')

# Background
parts.append(f'  <rect x="0" y="0" width="{VB_W}" height="{VIEWBOX_H}" fill="{BG}"/>')

# Title
parts.append(f'  <text x="{VB_W / 2}" y="30" text-anchor="middle" font-size="18" '
             f'font-weight="bold" fill="{TEXT}">Flujograma Formal del Proceso — Estándar ANSI</text>')
parts.append(f'  <text x="{VB_W / 2}" y="52" text-anchor="middle" font-size="12" '
             f'font-style="italic" fill="{TEXT_DIM}">Servicio: Dos Tonos · '
             f'Equipo: CriterIA · Módulo 2 — Estación 2</text>')
parts.append(f'  <text x="{VB_W / 2}" y="70" text-anchor="middle" font-size="11" '
             f'font-style="italic" fill="{TEXT_DIM}">9 procesos con controles '
             f'de calidad y retornos al sub-proceso que debe corregirse.</text>')

# INICIO
parts.append(ellipse_node(VB_W / 2, 120, 130, 28, "INICIO",
                          "Guía + mapa visual del proyecto"))
parts.append(arrow(VB_W / 2, 148, VB_W / 2, ACTIVITIES[0]["_y"] - 2))

# Render each activity
for idx, act in enumerate(ACTIVITIES):
    y_act = act["_y"]

    # Header
    title = f'{act["id"]}. {act["title"]}'
    n_subs = len(act.get("subs", []))
    sub = ""
    if n_subs:
        sub = f'↳ {n_subs} sub-procesos'
    parts.append(main_box(MAIN_X, y_act, MAIN_W, title, sub))
    parts.append(arrow(VB_W / 2, y_act + BOX_H, VB_W / 2, y_act + BOX_H + GAP - 2))

    if act.get("subs"):
        # Group rect
        first_sub_y = act["_y_subs_start"]
        last_sub_y = act["_y_sub_output"]
        group_h = last_sub_y - first_sub_y + BOX_H + 10
        group_x = 145
        group_w = 810
        parts.append(
            f'<rect x="{group_x}" y="{first_sub_y - 8}" '
            f'width="{group_w}" height="{group_h}" fill="none" '
            f'stroke="{GROUP_STROKE}" stroke-width="1" '
            f'stroke-dasharray="5,4" rx="6"/>'
        )
        # Group label
        parts.append(
            f'<text x="{group_x + 10}" y="{first_sub_y - 14}" '
            f'font-size="11" font-style="italic" fill="{TEXT_DIM}">'
            f'Sub-procesos de la Actividad {act["id"]}</text>'
        )

        # Sub-process boxes
        for sub_y, sid, stitle in act["_subs_y"]:
            parts.append(sub_box(SUB_X, sub_y, SUB_W, sid, stitle))
            parts.append(arrow(VB_W / 2, sub_y + BOX_H, VB_W / 2,
                               sub_y + BOX_H + GAP - 2))

        # Sub-decision (internal validation, inside the sub-process group)
        if act.get("sub_decision"):
            dec_label, return_label, return_to = act["_sub_decision"]
            cy = act["_y_sub_decision"]
            parts.append(decision(DEC_CX, cy, dec_label))
            # Return to top of the target sub-process
            return_to_y = lookup_subprocess_y(return_to)
            if return_to_y is None:
                # Fallback: return to top of first sub-process
                return_to_y = act["_subs_y"][0][0] - 2
            # NO label
            parts.append(f'  <text x="{DEC_CX - DEC_HW - 8}" y="{cy + 4}" '
                         f'text-anchor="end" font-size="10" font-weight="bold" '
                         f'fill="{TEXT}">NO</text>')
            # NO arrow
            no_path = (
                f'M {DEC_CX - DEC_HW} {cy} '
                f'L {RETURN_X_NEAR} {cy} '
                f'L {RETURN_X_NEAR} {return_to_y} '
                f'L {DEC_CX} {return_to_y}'
            )
            parts.append(path_arrow(no_path, dashed=True))
            # Return label
            parts.append(f'  <text x="{RETURN_X_NEAR + 6}" y="{cy - 6}" '
                         f'font-size="9" font-style="italic" fill="{TEXT_DIM}">'
                         f'{return_label}</text>')
            # SÍ label — debajo del rombo, con fondo BG para "cortar" la flecha
            si_y = cy + DEC_HH + 15
            parts.append(f'  <rect x="{DEC_CX - 12}" y="{si_y - 10}" '
                         f'width="24" height="14" fill="{BG}"/>')
            parts.append(f'  <text x="{DEC_CX}" y="{si_y}" '
                         f'text-anchor="middle" font-size="10" '
                         f'font-weight="bold" fill="{TEXT}">SÍ</text>')
            parts.append(arrow(DEC_CX, cy + DEC_HH, DEC_CX,
                               cy + DEC_HH + GAP - 2))

        # Sub-output
        parts.append(output_box(OUT_X, act["_y_sub_output"], OUT_W,
                                act["sub_output"]))
        parts.append(arrow(VB_W / 2, act["_y_sub_output"] + BOX_H, VB_W / 2,
                           act["_y_sub_output"] + BOX_H + GAP - 2))

    # Post-decision (control de calidad al final del proceso)
    if act.get("post_decision"):
        dec_label, return_label, return_to = act["_post_decision"]
        cy = act["_y_post_decision"]
        parts.append(decision(DEC_CX, cy, dec_label))
        # Return to top of the target sub-process
        return_to_y = lookup_subprocess_y(return_to)
        if return_to_y is None:
            # Fallback: return to top of the first sub-process of this activity
            if act.get("subs"):
                return_to_y = act["_subs_y"][0][0] - 2
            else:
                return_to_y = y_act - 2  # activity header
        # NO label
        parts.append(f'  <text x="{DEC_CX - DEC_HW - 8}" y="{cy + 4}" '
                     f'text-anchor="end" font-size="10" font-weight="bold" '
                     f'fill="{TEXT}">NO</text>')
        # NO arrow (further left for post-decision to avoid crossing sub-process group)
        no_path = (
            f'M {DEC_CX - DEC_HW} {cy} '
            f'L {RETURN_X_FAR} {cy} '
            f'L {RETURN_X_FAR} {return_to_y} '
            f'L {DEC_CX} {return_to_y}'
        )
        parts.append(path_arrow(no_path, dashed=True))
        # Return label
        parts.append(f'  <text x="{RETURN_X_FAR + 6}" y="{cy - 6}" '
                     f'font-size="9" font-style="italic" fill="{TEXT_DIM}">'
                     f'{return_label}</text>')
        # SÍ label — debajo del rombo, con fondo BG para "cortar" la flecha
        si_y = cy + DEC_HH + 15
        parts.append(f'  <rect x="{DEC_CX - 12}" y="{si_y - 10}" '
                     f'width="24" height="14" fill="{BG}"/>')
        parts.append(f'  <text x="{DEC_CX}" y="{si_y}" '
                     f'text-anchor="middle" font-size="10" '
                     f'font-weight="bold" fill="{TEXT}">SÍ</text>')
        parts.append(arrow(DEC_CX, cy + DEC_HH, DEC_CX, cy + DEC_HH + GAP - 2))

# FIN
parts.append(ellipse_node(VB_W / 2, fin_y, 200, 28, "FIN",
                          "Servicio cerrado y documentado"))

# ---- Leyenda ----
legend_y = VIEWBOX_H - 200
parts.append(f'  <rect x="50" y="{legend_y}" width="1000" height="160" '
             f'fill="#252525" stroke="{TEXT_DIM}" stroke-width="1" rx="4"/>')
parts.append(f'  <text x="70" y="{legend_y + 24}" font-size="13" '
             f'font-weight="bold" fill="{TEXT}">Simbología (ANSI)</text>')

items_y = legend_y + 60
parts.append(ellipse_node(120, items_y, 50, 16, "Inicio / Fin", ""))
parts.append(main_box(220, items_y - 16, 130, "Actividad", ""))
parts.append(sub_box(380, items_y - 16, 160, "2.1", "Sub-proceso"))
# Legend decision: rombo chico solo para la leyenda (el grande está en el flujo)
parts.append(
    f'<polygon points="630,{items_y - 15} 680,{items_y} 630,{items_y + 15} 580,{items_y}" '
    f'fill="{DECISION_FILL}" stroke="{TEXT}" stroke-width="1.5"/>'
    f'<text x="630" y="{items_y + 4}" text-anchor="middle" font-size="10" '
    f'font-weight="bold" fill="{TEXT}">Decisión</text>'
)
parts.append(output_box(710, items_y - 16, 160, "Output"))
parts.append(arrow(900, items_y, 950, items_y))
parts.append(f'  <text x="925" y="{items_y - 8}" text-anchor="middle" '
             f'font-size="10" fill="{TEXT_DIM}">Dirección</text>')

notes_y = legend_y + 100
parts.append(f'  <text x="70" y="{notes_y}" font-size="11" fill="{TEXT_DIM}">'
             f'Cada actividad cierra con un rombo de validación: si SÍ, '
             f'continúa; si NO, vuelve al sub-proceso específico.</text>')
parts.append(f'  <text x="70" y="{notes_y + 18}" font-size="11" fill="{TEXT_DIM}">'
             f'La Actividad 7 valida la prestación y registra incidencias '
             f'para el cierre de evidencias.</text>')
parts.append(f'  <text x="70" y="{notes_y + 36}" font-size="11" fill="{TEXT_DIM}">'
             f'La verificación está integrada al final de cada proceso; '
             f'no aparece como proceso separado.</text>')

parts.append('</svg>')

svg = "\n".join(parts)

out_path = Path(__file__).resolve().with_name("flujograma-formal-ans.svg")
with out_path.open("w", encoding="utf-8") as f:
    f.write(svg)

print(f"OK: {out_path}")
print(f"viewBox: 0 0 {VB_W} {VIEWBOX_H}")
print(f"Actividades: {len(ACTIVITIES)}")
print(f"Elementos: {svg.count('<')}")
