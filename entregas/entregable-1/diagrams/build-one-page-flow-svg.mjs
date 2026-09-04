import { mkdir, writeFile } from "node:fs/promises";
import path from "node:path";

const root = process.cwd();
const diagrams = path.join(root, "entregas", "entregable-1", "diagrams");
await mkdir(diagrams, { recursive: true });

const activities = [
  [1, "Analizar la guía y el contexto del proyecto", ["Leer la guía del Entregable 1", "Leer el mapa visual del proyecto", "Listar dudas para consultar al docente"], "Guía comprendida, dudas listadas", "¿Guía comprendida?"],
  [2, "Diseñar el servicio", ["Fijar el objetivo de aprendizaje de la estación", "Definir la comparación de dos respuestas", "Redactar la explicación breve para el estudiante"], "Dinámica educativa definida y explicable", "¿Objetivo y dinámica claros?"],
  [3, "Seleccionar la herramienta de apoyo", ["Identificar herramientas de IA con acceso del equipo", "Comparar costo, idioma, velocidad y facilidad", "Elegir la herramienta para operar la estación"], "Herramienta elegida para la estación", "¿Herramienta apta para la estación?"],
  [4, "Preparar fichas de candidatos ficticios", ["Aplicar los tres perfiles ficticios acordados", "Redactar una ficha por perfil programático", "Completar datos comparables", "Verificar ficción, equilibrio y comparabilidad"], "Tres fichas sintéticas aprobadas", "¿Fichas completas y verificadas?"],
  [5, "Preparar el chatbot \"Dos Tonos\"", ["Cargar la base verificada de candidatos", "Preparar la respuesta neutra", "Preparar la respuesta con encuadre comparativo", "Armar la vista de comparación del chatbot", "Probar consulta del chatbot y registro de datos"], "Chatbot listo para demostración", "¿Chatbot validado?"],
  [6, "Preparar la demostración de la Estación 2", ["Redactar guion de bienvenida para estudiantes", "Asignar roles de facilitación con sub-equipo B", "Verificar mesa, dispositivo y conexión", "Confirmar lista de materiales de la estación"], "Estación 2 lista, sub-equipo B alineado", "¿Estación 2 lista?"],
  [7, "Prestar el servicio: demostración en el colegio", ["Recibir al grupo rotativo de estudiantes", "Explicar la actividad en lenguaje simple", "Ingresar en el chatbot la consulta del estudiante", "Mostrar dos respuestas sobre la misma información", "Guiar la comparación de diferencias", "Registrar respuestas e incidencias acordadas"], "Experiencia realizada y datos registrados", "¿Experiencia y datos registrados?"],
  [8, "Cerrar la estación y ordenar evidencia", ["Reunir observaciones de los facilitadores", "Ordenar registros e incidencias de la actividad", "Entregar información acordada a Módulo 5"], "Evidencia del servicio ordenada y usable", "¿Evidencia completa y usable?"],
  [9, "Elaborar el informe académico del proceso", ["Redactar tablas de roles, recursos y controles", "Incluir el flujograma formal del servicio", "Redactar aprendizaje y mejoras del equipo", "Armar el documento con las 6 partes", "Verificar formato final y nombre de archivo"], "Documento completo y alineado al servicio", "¿Documento explica el servicio?"],
];

const positions = new Map([
  [1, [80, 410]], [2, [1180, 410]], [3, [2280, 410]],
  [6, [2280, 1110]], [5, [1180, 1110]], [4, [80, 1110]],
  [7, [80, 1810]], [8, [1180, 1810]], [9, [2280, 1810]],
]);
const order = [1, 2, 3, 6, 5, 4, 7, 8, 9];
const esc = (s) => s.replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll('"', "&quot;");

function panel([n, name, steps, output, decision]) {
  const [x, y] = positions.get(n); const w = 1000; const h = 620;
  const title = `<rect x="${x}" y="${y}" width="${w}" height="54" rx="5" class="activity"/><text x="${x + w / 2}" y="${y + 34}" class="activityText">${n}. ${esc(name)}</text>`;
  const boxY = y + 76;
  let content = `<rect x="${x + 28}" y="${boxY}" width="${w - 56}" height="390" rx="5" class="process"/><text x="${x + 48}" y="${boxY + 23}" class="hint">Sub-procesos de la actividad ${n}</text>`;
  const gap = Math.floor(285 / steps.length);
  steps.forEach((step, i) => {
    const sy = boxY + 38 + i * gap;
    content += `<rect x="${x + 110}" y="${sy}" width="${w - 220}" height="${gap - 10}" rx="3" class="step"/><text x="${x + 135}" y="${sy + Math.floor((gap - 10) / 2) + 6}" class="stepText">${n}.${i + 1}</text><text x="${x + 230}" y="${sy + Math.floor((gap - 10) / 2) + 6}" class="stepText">${esc(step)}</text>`;
    if (i < steps.length - 1) content += `<path d="M ${x + w / 2} ${sy + gap - 10} v 10" class="arrow"/>`;
  });
  const outY = boxY + 326;
  content += `<rect x="${x + 220}" y="${outY}" width="${w - 440}" height="38" rx="4" class="output"/><text x="${x + 246}" y="${outY + 24}" class="outLabel">Output</text><text x="${x + w / 2 + 35}" y="${outY + 24}" text-anchor="middle" class="outText">${esc(output)}</text>`;
  const dY = y + 500;
  content += `<path d="M ${x + w / 2} ${outY + 38} v 22" class="arrow"/><polygon points="${x + w / 2},${dY} ${x + w / 2 + 160},${dY + 28} ${x + w / 2},${dY + 56} ${x + w / 2 - 160},${dY + 28}" class="decision"/><text x="${x + w / 2}" y="${dY + 33}" text-anchor="middle" class="decisionText">${esc(decision)}</text><text x="${x + w / 2}" y="${dY + 78}" text-anchor="middle" class="yes">Sí</text><path d="M ${x + w - 28} ${dY + 28} h 22 v -160 h -34" class="return"/><text x="${x + w - 6}" y="${dY - 145}" class="no">No: revisar</text>`;
  return `<g>${title}${content}</g>`;
}

function connector(from, to) {
  const [fx, fy] = positions.get(from); const [tx, ty] = positions.get(to);
  const cx = fx + 500; const cy = fy + 556;
  if (fy === ty && tx > fx) return `<path d="M ${fx + 1000} ${cy} h 75 v -118 h 25" class="connector"/>`;
  if (fy === ty && tx < fx) return `<path d="M ${fx} ${cy} h -75 v -118 h -25" class="connector"/>`;
  if (tx === fx && ty > fy) return `<path d="M ${cx} ${fy + 620} v 58 h ${tx + 500 - cx} v -58" class="connector"/>`;
  return `<path d="M ${cx} ${fy + 620} v 58 h ${tx + 500 - cx} v -58" class="connector"/>`;
}

const panels = activities.map(panel).join("\n");
const connectors = order.slice(0, -1).map((n, i) => connector(n, order[i + 1])).join("\n");
const svg = `<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg" width="3600" height="2500" viewBox="0 0 3600 2500">
<defs><marker id="arrowhead" markerWidth="10" markerHeight="10" refX="8" refY="5" orient="auto"><path d="M0,0 L10,5 L0,10 Z" fill="#374151"/></marker></defs>
<style>
  .activity{fill:#224c78;stroke:#dbeafe;stroke-width:3}.activityText{font:700 24px Arial;fill:#fff;text-anchor:middle}.process{fill:#1f2937;stroke:#9ca3af;stroke-width:2;stroke-dasharray:7 5}.hint{font:italic 16px Arial;fill:#cbd5e1}.step{fill:#1f4d7a;stroke:#93c5fd;stroke-width:2}.stepText{font:18px Arial;fill:#f8fafc}.output{fill:#3d7c4b;stroke:#d1fae5;stroke-width:2}.outLabel{font:700 17px Arial;fill:#fff}.outText{font:17px Arial;fill:#fff}.decision{fill:#91722b;stroke:#fde68a;stroke-width:2}.decisionText{font:700 17px Arial;fill:#fff}.arrow{stroke:#d1d5db;stroke-width:2;fill:none;marker-end:url(#arrowhead)}.connector{stroke:#374151;stroke-width:4;fill:none;marker-end:url(#arrowhead)}.return{stroke:#f05252;stroke-width:2;fill:none;marker-end:url(#arrowhead)}.no{font:15px Arial;fill:#f87171}.yes{font:15px Arial;fill:#86efac}
</style>
<rect width="3600" height="2500" fill="#16181d"/>
<text x="1800" y="64" text-anchor="middle" style="font:700 38px Arial;fill:#fff">Flujograma formal del proceso - Estación 2: Alfabetización de Datos</text>
<text x="1800" y="98" text-anchor="middle" style="font:20px Arial;fill:#cbd5e1">CriterIA | Proceso completo: diseño, preparación, prestación, cierre y documentación</text>
<g transform="translate(460,135)"><rect width="2680" height="120" rx="8" fill="#242934" stroke="#9ca3af"/><ellipse cx="130" cy="42" rx="36" ry="17" class="activity"/><text x="190" y="49" style="font:18px Arial;fill:#fff">Actividad</text><rect x="430" y="26" width="72" height="34" class="step"/><text x="530" y="49" style="font:18px Arial;fill:#fff">Sub-proceso</text><polygon points="910,24 980,43 910,62 840,43" class="decision"/><text x="1010" y="49" style="font:18px Arial;fill:#fff">Control</text><rect x="1270" y="26" width="90" height="34" class="output"/><text x="1390" y="49" style="font:18px Arial;fill:#fff">Output</text><path d="M1730 43h90" class="connector"/><text x="1880" y="49" style="font:18px Arial;fill:#fff">Dirección del flujo</text><text x="130" y="92" style="font:16px Arial;fill:#cbd5e1">Cada control devuelve al subproceso que debe corregirse. El “Sí” avanza a la actividad siguiente.</text></g>
<ellipse cx="580" cy="328" rx="170" ry="30" fill="#3d7c4b" stroke="#d1fae5" stroke-width="2"/><text x="580" y="336" text-anchor="middle" style="font:700 18px Arial;fill:#fff">INICIO: guía y contexto del proyecto</text><path d="M580 358v46" class="connector"/>
${connectors}${panels}
<ellipse cx="2780" cy="2460" rx="210" ry="28" fill="#3d7c4b" stroke="#d1fae5" stroke-width="2"/><text x="2780" y="2467" text-anchor="middle" style="font:700 18px Arial;fill:#fff">FIN: servicio cerrado y documentado</text><path d="M2780 2410v22" class="connector"/>
</svg>`;

const svgPath = path.join(diagrams, "flujograma-formal-una-pagina.svg");
await writeFile(svgPath, svg, "utf8");
console.log(svgPath);
