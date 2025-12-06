# 🚀 NexaAdmin – Sistema de Gestão ERP

NexaAdmin é um ERP mobile desenvolvido em **Flutter** para gestão de **Clientes** e **Produtos**, integrado a um backend **Node.js/Express** com banco **MySQL**.  
Projeto final da disciplina **Desenvolvimento Mobile II**, com arquitetura limpa, design responsivo e elementos neon/glow futuristas.

---

## 🧩 Funcionalidades Principais

- 🔐 **Autenticação / Acesso**  
  Controle de acesso ao sistema (login) para utilizar as funcionalidades do app.

- 📊 **Dashboard Interativo**  
  Contagem de clientes, produtos e gráficos de desempenho da empresa em tempo real.

- 👥 **Gestão de Clientes (CRUD completo)**  
  - Listar clientes  
  - Cadastrar novos clientes  
  - Editar informações  
  - Remover registros  

- 📦 **Gestão de Produtos**  
  Controle de inventário, cadastro de produtos, atualização de estoque e gerenciamento de preços.

- 📈 **Relatórios (em construção)**  
  Módulo de relatórios com métricas de desempenho da empresa.

- 🔗 **Integração Backend**  
  Comunicação com API RESTful em tempo real, consumindo dados do servidor Node/Express.

- 🎨 **UI Moderna**  
  Tema escuro, elementos neon/glow, layout responsivo e clean.

---

## 👨‍💻 Equipe

- Giovany V Mota  
- Tallis Teixeira  
- Marcos Rezende  
- Hiago Vinícius  

---

## 🛠️ Tecnologias Utilizadas

O projeto foi construído com as seguintes tecnologias e bibliotecas:

| Tecnologia              | Descrição                                                                 |
| ----------------------- | ------------------------------------------------------------------------- |
| **Flutter (Dart)**      | Construção do app mobile responsivo.                                     |
| **Node.js & Express**   | Backend RESTful para regras de negócio e API.                            |
| **MySQL**               | Banco de dados relacional para persistência das informações.             |
| **Provider / Services** | Gerenciamento de estado e camada de serviços no Flutter.                 |
| **HTTP / Axios**        | Comunicação HTTP entre o app e o backend (requisições REST).            |

---

## ⚙️ Como Executar o Projeto

### ✅ Pré-requisitos

- Flutter SDK instalado  
- Node.js e npm instalados  
- Servidor MySQL rodando  

---

### 1️⃣ Configurar Banco de Dados

1. Crie um banco chamado **`nexaadmin`** no MySQL.  
2. Configure o arquivo `nexaadmin-backend/src/config/db.js` com suas credenciais:

```js
module.exports = {
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'nexaadmin',
};
2️⃣ Executar Backend
No diretório nexaadmin-backend:

bash
Copiar código
npm install
node src/server.js
O servidor rodará na porta 3000.

3️⃣ Executar App Mobile (Flutter)
No diretório do app Flutter:

bash
Copiar código
flutter pub get
flutter run
Selecione o dispositivo/emulador desejado para rodar o NexaAdmin.

📂 Estrutura do Projeto (sugestão)
text
Copiar código
nexaadmin/
  ├── nexaadmin-app/          # Projeto Flutter
  │   ├── lib/
  │   ├── android/
  │   └── ios/
  └── nexaadmin-backend/      # Backend Node.js
      ├── src/
      │   ├── routes/
      │   ├── controllers/
      │   ├── models/
      │   └── config/db.js
      └── package.json
