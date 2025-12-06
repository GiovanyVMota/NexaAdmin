# 🚀 NexaAdmin – Sistema de Gestão ERP

NexaAdmin é um ERP mobile desenvolvido em **Flutter** para gestão de **Clientes** e **Produtos**, integrado a um backend **Node.js/Express** com banco **MySQL**.
Projeto final da disciplina **Desenvolvimento Mobile II**, com arquitetura limpa, design responsivo e elementos neon/glow futuristas.

---

## 🧩 Funcionalidades Principais

* 🔐 **Autenticação / Acesso** – Controle de login para acessar o sistema.
* 📊 **Dashboard Interativo** – Contagem de clientes, produtos e gráficos de desempenho.
* 👥 **Gestão de Clientes (CRUD)** – Listar, cadastrar, editar e remover.
* 📦 **Gestão de Produtos** – Estoque, preços e inventário.
* 📈 **Relatórios** – Métricas da empresa (em construção).
* 🔗 **Integração Backend** – API REST em tempo real.
* 🎨 **UI Moderna** – Tema escuro, neon/glow, clean e responsivo.

---

## 👨‍💻 Equipe

* Giovany V Mota
* Tallis Teixeira
* Marcos Rezende
* Hiago Vinícius

---

## 🛠️ Tecnologias Utilizadas

| Tecnologia              | Descrição                      |
| ----------------------- | ------------------------------ |
| **Flutter (Dart)**      | Desenvolvimento do app mobile. |
| **Node.js & Express**   | Backend RESTful.               |
| **MySQL**               | Banco de dados relacional.     |
| **Provider / Services** | Gerenciamento de estado.       |
| **HTTP / Axios**        | Comunicação com o backend.     |

---

## ⚙️ Como Executar o Projeto

### 1️⃣ Configurar Banco de Dados

1. Crie um banco chamado **nexaadmin** no MySQL.
2. Configure o arquivo `nexaadmin-backend/src/config/db.js` com suas credenciais:

```js
module.exports = {
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'nexaadmin',
};
```

---

### 2️⃣ Executar Backend

No diretório **nexaadmin-backend**:

```bash
npm install
node src/server.js
```

O servidor rodará na porta **3000**.

---

### 3️⃣ Executar App Mobile (Flutter)

No diretório do app Flutter:

```bash
flutter pub get
flutter run
```

Selecione um dispositivo/emulador para rodar o NexaAdmin.

---

## 📂 Estrutura do Projeto (sugestão)

```
nexaadmin/
│
├── nexaadmin-app/            # Projeto Flutter
│   ├── lib/
│   ├── android/
│   └── ios/
│
└── nexaadmin-backend/        # Backend Node.js
    ├── src/
    │   ├── routes/
    │   ├── controllers/
    │   ├── models/
    │   └── config/db.js
    └── package.json
```

---

## 📌 Melhorias Futuras

* Módulo completo de relatórios.
* Exportação PDF/Excel.
* Perfis de usuário (admin/operador).
* Notificações push.
