# NexaAdmin - Sistema de Gestão ERP

Este projeto consiste em uma aplicação mobile desenvolvida em **Flutter** para gestão de Clientes e Produtos, integrada a uma API RESTful em **Node.js** com banco de dados **MySQL**. O sistema foi desenvolvido como Desafio Final da disciplina de Desenvolvimento Mobile II.

## 👥 Integrantes
* [Nome do Integrante 1]
* [Nome do Integrante 2]
* [Nome do Integrante 3]

## 🚀 Funcionalidades

A aplicação permite realizar operações completas de **CRUD** (Create, Read, Update, Delete) e visualização de métricas:

* **Dashboard:** Visão geral com contagem de clientes, produtos e gráfico de desempenho.
* **Clientes:** Listagem, cadastro, edição e remoção de clientes.
* **Produtos:** Gestão completa de inventário com controle de estoque e preços.
* **Integração:** Comunicação em tempo real com backend via HTTP.

## 🛠️ Tecnologias Utilizadas

* **Frontend:** Flutter (Dart)
* **Backend:** Node.js, Express
* **Banco de Dados:** MySQL
* **Estilização:** Interface moderna com tema escuro e elementos "futuristas" (Neon/Glow).

## ⚙️ Como Executar o Projeto

### Pré-requisitos
* Flutter SDK instalado.
* Node.js e npm instalados.
* Servidor MySQL rodando.

### Passo 1: Configurar o Banco de Dados
1. Crie um banco de dados MySQL chamado `nexaadmin`.
2. Certifique-se de que as credenciais no arquivo `nexaadmin-backend/src/config/db.js` correspondam ao seu ambiente local (usuário `root`, senha vazia ou a sua senha).

### Passo 2: Executar o Backend
No terminal, navegue até a pasta do backend:
```bash
cd nexaadmin-backend
npm install
node src/server.js

O servidor iniciará na porta 3000.

### Passo 3: Executar o App (Frontend)
Em um novo terminal, navegue até a pasta do frontend:

Bash

cd nexaadmin_frontend
flutter pub get
flutter run -d chrome
(Você pode rodar em emulador Android/iOS ou Windows, mas o comando acima abre no Chrome para facilitar a demonstração).

Nota: O projeto segue uma arquitetura limpa com separação de responsabilidades (Models, Services, Pages) para garantir manutenibilidade e escalabilidade.