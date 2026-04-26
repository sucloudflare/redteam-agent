#!/usr/bin/env bash
# ══════════════════════════════════════════════
#  Red Team Agent — start.sh
#  Inicia o servidor local na porta 8080
# ══════════════════════════════════════════════

set -e

PORT=8080
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo ""
echo "  ╔══════════════════════════════════════╗"
echo "  ║       ⬡  RED TEAM AGENT v1.1        ║"
echo "  ║      Ollama Local — Pentest AI       ║"
echo "  ╚══════════════════════════════════════╝"
echo ""

# ── Verificar Ollama ──────────────────────────
echo "[*] Verificando Ollama em localhost:11434 ..."
if curl -sf http://localhost:11434/api/tags > /dev/null 2>&1; then
  echo "[✓] Ollama está rodando"
else
  echo "[!] Ollama NÃO está respondendo."
  echo ""
  echo "    Para iniciar com CORS aberto (em outro terminal):"
  echo "      OLLAMA_ORIGINS=* ollama serve"
  echo ""
  echo "    Continuando mesmo assim — você pode iniciar o Ollama depois."
  echo ""
fi

# ── Escolher servidor HTTP ────────────────────
start_server() {
  echo "[*] Iniciando servidor na porta $PORT ..."
  echo ""

  if command -v python3 &>/dev/null; then
    echo "[✓] Usando Python 3"
    echo "  Acesse: http://localhost:$PORT"
    echo "  Ctrl+C para parar"
    echo ""
    cd "$DIR"
    python3 -m http.server "$PORT" --bind 127.0.0.1

  elif command -v python &>/dev/null; then
    PY_VER=$(python -c 'import sys; print(sys.version_info.major)')
    if [ "$PY_VER" = "3" ]; then
      echo "[✓] Usando Python 3 (alias python)"
      cd "$DIR"
      python -m http.server "$PORT" --bind 127.0.0.1
    else
      echo "[✓] Usando Python 2"
      cd "$DIR"
      python -m SimpleHTTPServer "$PORT"
    fi

  elif command -v node &>/dev/null; then
    echo "[✓] Usando Node.js"
    node -e "
const http = require('http');
const fs   = require('fs');
const path = require('path');
const dir  = '$DIR';
const mime = { '.html':'text/html', '.js':'application/javascript', '.css':'text/css', '.ico':'image/x-icon' };
http.createServer((req, res) => {
  let file = path.join(dir, req.url === '/' ? 'index.html' : req.url);
  fs.readFile(file, (err, data) => {
    if (err) { res.writeHead(404); res.end('Not found'); return; }
    res.writeHead(200, { 'Content-Type': mime[path.extname(file)] || 'text/plain' });
    res.end(data);
  });
}).listen($PORT, '127.0.0.1', () => console.log('  Acesse: http://localhost:$PORT\n  Ctrl+C para parar'));
"

  elif command -v php &>/dev/null; then
    echo "[✓] Usando PHP"
    cd "$DIR"
    php -S 127.0.0.1:"$PORT"

  else
    echo "[✗] Nenhum servidor HTTP encontrado."
    echo ""
    echo "    Instale uma das opções:"
    echo "      sudo apt install python3"
    echo "      sudo apt install nodejs"
    echo "      sudo apt install php"
    echo ""
    echo "    Ou abra o index.html diretamente no navegador:"
    echo "      file://$DIR/index.html"
    echo ""
    echo "    (CORS pode ser bloqueado ao abrir via file:// — prefira um servidor HTTP)"
    exit 1
  fi
}

start_server
