import { createRequire } from "node:module";
import { mkdir } from "node:fs/promises";
import path from "node:path";

const require = createRequire(import.meta.url);
const sharp = require("sharp");

const root = process.cwd();
const svgPath = path.join(root, "entregas", "entregable-1", "diagrams", "flujograma-formal-ans.svg");
const outDir = path.join(root, "entregas", "entregable-1", "generated");

await mkdir(outDir, { recursive: true });

const density = 192;
const full = sharp(svgPath, { density });
const metadata = await full.metadata();
const fullPng = path.join(outDir, "flujograma-formal-completo.png");
await sharp(svgPath, { density }).png().toFile(fullPng);

const scale = metadata.width / 1100;
const viewSegments = [
  ["01_inicio_actividad_1", 0, 650],
  ["02_actividad_2_3", 640, 960],
  ["03_actividad_4", 1600, 610],
  ["04_actividad_5", 2160, 690],
  ["05_actividad_6", 2800, 610],
  ["06_actividad_7", 3360, 780],
  ["07_actividad_8", 4080, 570],
  ["08_actividad_9_fin", 4560, 740],
];

const segments = [];
for (const [name, topView, heightView] of viewSegments) {
  const output = path.join(outDir, `flujograma-${name}.png`);
  await sharp(fullPng)
    .extract({
      left: 0,
      top: Math.round(topView * scale),
      width: metadata.width,
      height: Math.round(heightView * scale),
    })
    .png()
    .toFile(output);
  segments.push(output);
}

console.log(`full=${fullPng}`);
for (const segment of segments) console.log(`segment=${segment}`);
