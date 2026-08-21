#!/usr/bin/env node
// gnosis-serve.mjs — wrapper robusto para arrancar el server MCP de gnosis.
//
// Por qué existe: el .mcp.json solo puede declarar un path ESTÁTICO para la DB.
// Un path relativo (".gnosis/docs.db") se resuelve contra el cwd del proceso, así
// que el aislamiento por proyecto (ADR-001) se rompe en silencio si Claude Code
// arranca el server desde otro directorio (DB vacía) o si la env var no se hereda
// (cae a la DB global compartida).
//
// Este wrapper elimina esa fragilidad: computa la raíz del repo como la carpeta
// donde vive ESTE archivo (no el cwd, no git), y setea GNOSIS_MCP_DATABASE_URL a
// un path ABSOLUTO antes de delegar en `gnosis-mcp serve`. Queda tan a prueba de
// cwd como el CLI de ingest. También fija PYTHONUTF8=1 (evita UnicodeEncodeError
// del CLI en la consola cp1252 de Windows).
//
// Portable: node abstrae el OS (Windows / macOS / Linux). Solo requiere `node`
// en el PATH — ya es prerequisito del harness (codegraph corre sobre npm).
//
// .mcp.json:
//   { "mcpServers": { "gnosis": { "command": "node", "args": ["gnosis-serve.mjs"] } } }

import { spawn } from 'node:child_process';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';

// La raíz del repo = la carpeta de este archivo. Independiente del cwd y de git,
// así que funciona igual en un checkout git o en un tarball extraído.
const repoRoot = dirname(fileURLToPath(import.meta.url));
const bin = process.platform === 'win32' ? 'gnosis-mcp.exe' : 'gnosis-mcp';

const child = spawn(bin, ['serve'], {
  stdio: 'inherit', // pasa stdin/stdout/stderr tal cual: el JSON-RPC de MCP fluye sin tocarse
  env: {
    ...process.env,
    GNOSIS_MCP_DATABASE_URL: join(repoRoot, '.gnosis', 'docs.db'),
    PYTHONUTF8: '1',
  },
});

child.on('error', (err) => {
  process.stderr.write(`gnosis-serve: no pude arrancar '${bin}': ${err.message}\n`);
  process.stderr.write("¿Instalaste las herramientas? Corré ./setup-tools.sh (o setup-tools.ps1).\n");
  process.exit(1);
});
child.on('exit', (code) => process.exit(code ?? 0));

// Propagar señales para no dejar el server huérfano.
for (const sig of ['SIGINT', 'SIGTERM']) {
  process.on(sig, () => child.kill(sig));
}
