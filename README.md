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

### 🗄️ 1️⃣ Configuração do Banco de Dados

Esta etapa é essencial para garantir o correto funcionamento da API backend. Abaixo, apresenta-se o script SQL responsável pela criação do banco de dados, das tabelas e de registros iniciais utilizados para testes.

#### 📘 Script SQL Oficial do Projeto

Execute o seguinte script no MySQL Workbench, DBeaver ou terminal MySQL:

```sql
-- =====================================================
--  CRIAÇÃO DO BANCO DE DADOS
-- =====================================================
CREATE DATABASE IF NOT EXISTS nexaadmin;
USE nexaadmin;

-- =====================================================
--  REMOÇÃO DE TABELAS EXISTENTES (CASO EXISTA CONFLITO)
-- =====================================================
DROP TABLE IF EXISTS relatorios;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS products;

-- =====================================================
--  TABELA: CLIENTES
-- =====================================================
CREATE TABLE clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  sobrenome VARCHAR(100) NOT NULL,
  email VARCHAR(150) UNIQUE NOT NULL,
  idade INT,
  foto TEXT,
  criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
--  TABELA: PRODUTOS
-- =====================================================
CREATE TABLE produtos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(120) NOT NULL,
  descricao TEXT,
  preco DECIMAL(10,2) NOT NULL,
  data_atualizado VARCHAR(100),
  criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
--  TABELA: RELATÓRIOS (OPCIONAL)
-- =====================================================
CREATE TABLE relatorios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(150),
  descricao TEXT,
  criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
--  DADOS INICIAIS PARA TESTE — CLIENTES
-- =====================================================
INSERT INTO clientes (nome, sobrenome, email, idade, foto) VALUES
('Ana', 'Martins', 'ana.martins@example.com', 28, 'https://i.pravatar.cc/150?img=1'),
('Lucas', 'Gomes', 'lucas.gomes@example.com', 35, 'https://i.pravatar.cc/150?img=3'),
('Mariana', 'Oliveira', 'mariana.oliveira@example.com', 22, 'https://i.pravatar.cc/150?img=5');

-- =====================================================
--  DADOS INICIAIS PARA TESTE — PRODUTOS
-- =====================================================
INSERT INTO produtos (nome, descricao, preco, data_atualizado) VALUES
('Teclado Mecânico RGB', 'Teclado gamer com switches azuis e iluminação RGB.', 359.90, '2023-10-25T14:30:00.000'),
('Mouse Gamer 7200 DPI', 'Alta precisão e botões programáveis.', 129.90, '2023-11-01T10:00:00.000'),
('Monitor 24" 144Hz', 'Alta taxa de atualização indicada para jogos competitivos.', 1299.00, '2023-11-10T09:15:00.000');
```

---

### ▶️ 2️⃣ Executando o Backend

No diretório **nexaadmin-backend**:

```bash
npm install
node src/server.js
```

O servidor iniciará na porta **3000**.

---

### 📱 3️⃣ Executando o Aplicativo Flutter

No diretório **nexaadmin-app**:

```bash
flutter pub get
flutter run
```

Selecione o dispositivo/emulador disponível.

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
