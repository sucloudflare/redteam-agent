
<h1>⬡ RED TEAM AGENT v1.1</h1>
<img src='h.jpeg alt='img'>
<p><b>Ollama Local — Pentest AI</b></p>

<h2>📌 Sobre o Projeto</h2>
<p>O Red Team Agent é uma interface web local para execução de testes de segurança ofensiva utilizando modelos do Ollama. Permite interação em tempo real com IA para pentest, exploração, CTF, bug bounty e geração de PoCs.</p>

<h2>⚙️ Requisitos</h2>
<ul>
<li>Ollama instalado</li>
<li>Modelo baixado (ex: llama3.1)</li>
<li>Servidor HTTP (Python, Node ou PHP)</li>
</ul>

<h2>🚀 Instalação</h2>
<pre>ollama pull llama3.1
OLLAMA_ORIGINS=* ollama serve</pre>

<h2>▶️ Execução</h2>
<pre>chmod +x start.sh
./start.sh</pre>

<p>Acesse:</p>
<pre>http://localhost:8080</pre>

<h2>🧠 Funcionalidades</h2>
<ul>
<li>Chat com IA local (streaming)</li>
<li>Detecção automática de API</li>
<li>Modos: GENERAL, RECON, EXPLOIT, CTF, MITRE, BUG BOUNTY, POC GEN</li>
<li>Quick actions</li>
<li>Exportação de sessão</li>
<li>Interface estilo terminal</li>
</ul>

<h2>🔌 Conexão</h2>
<pre>http://localhost:11434</pre>

<h2>🛠️ Tecnologias</h2>
<ul>
<li>HTML, CSS, JavaScript</li>
<li>Ollama API</li>
<li>NDJSON streaming</li>
</ul>

<h2>📂 Estrutura</h2>
<pre>/project
index.html
start.sh</pre>

<h2>⚠️ Problemas</h2>
<h3>CORS</h3>
<pre>OLLAMA_ORIGINS=* ollama serve</pre>

<h3>Modelo</h3>
<pre>ollama pull llama3.1</pre>

<h3>Teste</h3>
<pre>curl http://localhost:11434/api/tags</pre>

<h2>📤 Export</h2>
<p>Exporta sessão em .txt pela interface.</p>

<h2>🧪 Uso</h2>
<p>Somente para testes autorizados.</p>

<h2>👨‍💻 Autor</h2>
<p>Edson Bruno</p>

<h2>📜 Licença</h2>
<p>Uso livre para estudo.</p>

</body>
</html>
