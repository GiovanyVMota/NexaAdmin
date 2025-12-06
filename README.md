NexaAdmin - Sistema de Gestão ERP 🚀

NexaAdmin é um ERP mobile desenvolvido em Flutter para gestão de Clientes e Produtos, integrado a um backend Node.js/Express com banco MySQL.
Projeto final da disciplina Desenvolvimento Mobile II, com arquitetura limpa, design responsivo e elementos neon/glow futuristas.

👥 Equipe

Giovany V Mota

Tallis Teixeira

Marcos Rezende

Hiago Vinicius

✨ Funcionalidades Principais

📊 Dashboard Interativo: Contagem de clientes, produtos e gráficos de desempenho.

👥 Clientes: CRUD completo (listar, cadastrar, editar, remover).

📦 Produtos: Gestão de inventário, controle de estoque e preços.

📈 Relatórios: Métricas de desempenho da empresa (em construção).

🔗 Integração Backend: Comunicação via API RESTful em tempo real.

🎨 UI Moderna: Tema escuro, elementos neon/glow, responsivo e clean.

🛠️ Tecnologias Utilizadas
Tecnologia	Descrição	Link Oficial
Flutter (Dart)	Construção do app mobile responsivo	flutter.dev

Node.js & Express	Backend RESTful	nodejs.org
 / expressjs.com

MySQL	Banco de dados relacional	mysql.com

Provider / Services	Gerenciamento de estado	pub.dev

HTTP / Axios	Comunicação frontend-backend	axios-http.com
⚙️ Como Executar o Projeto
Pré-requisitos

Flutter SDK instalado ✅

Node.js e npm instalados ✅

Servidor MySQL rodando ✅

1️⃣ Configurar Banco de Dados

Crie um banco nexaadmin no MySQL.

Configure nexaadmin-backend/src/config/db.js com suas credenciais:

module.exports = {
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'nexaadmin'
};

2️⃣ Executar Backend
cd nexaadmin-backend
npm install
node src/server.js


O servidor rodará na porta 3000.

3️⃣ Executar Frontend (App)
cd nexaadmin_frontend
flutter pub get
flutter run -d chrome


Dica: Use -d chrome para demo rápida no navegador, ou rode no emulador Android/iOS.

Estrutura do Projeto
nexaadmin_frontend/
│── lib/
│   ├── models/      # Models do app
│   ├── services/    # Comunicação API
│   ├── pages/       # Telas do app
│   └── main.dart    # Entry point
nexaadmin-backend/
│── src/
│   ├── routes/      # Endpoints
│   ├── controllers/ # Lógica das rotas
│   ├── models/      # Models do banco
│   └── server.js    # Entry point

🔑 Variáveis de Ambiente (Opcional)

Crie um .env no backend para segredos e configuração:

DB_HOST=localhost
DB_USER=root
DB_PASSWORD=
DB_NAME=nexaadmin
PORT=3000


🧑‍💻 Autores

Giovany V Mota

Tallis Teixeira

Marcos Rezende

Hiago Vinicius
