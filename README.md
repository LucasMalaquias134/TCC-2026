## FitFlow

<div align="center">

**Plataforma digital para gerenciamento de fichas de treino em academias**

[![Tecnologias](https://img.shields.io/badge/Laravel-PHP-red?style=flat-square&logo=laravel)]()
[![Mobile](https://img.shields.io/badge/Flutter-Crossplatform-blue?style=flat-square&logo=flutter)]()
[![Banco de Dados](https://img.shields.io/badge/MySQL-Relational-blue?style=flat-square&logo=mysql)]()

</div>

---

## 📖 Sobre o Projeto

O **FitFlow** é uma solução desenvolvida como Trabalho de Conclusão de Curso (TCC) do Técnico Integrado em Informática no **IFMG — Campus Formiga**. O projeto tem como objetivo principal substituir o modelo tradicional de fichas de treino em papel por uma plataforma digital moderna, otimizando o tempo dos praticantes de atividades físicas e facilitando o acesso aos treinos de qualquer lugar.

---

## 🚀 Tecnologias Utilizadas

O sistema foi estruturado de forma *end-to-end*, englobando as seguintes tecnologias:

* **Front-End Web:** HTML5, CSS3, JavaScript.
* **Front-End Mobile:** Flutter.
* **Back-End:** PHP com **Laravel** (API REST integrada com autenticação Laravel Sanctum).
* **Banco de Dados:** MySQL.
* **Armazenamento de Mídia:** Cloudinary API (para upload de fotos de perfil em nuvem).

---

## ⚙️ Arquitetura do Sistema

A aplicação se comunica através de requisições HTTP/REST entre as interfaces cliente (Web e Mobile) e o servidor backend, que realiza a persistência no banco de dados relacional e gerencia o upload de imagens na nuvem.

[ Web (Laravel) / Mobile (Flutter) ] --(Requisições HTTP/REST)--> [ Backend (Laravel) ] <-----> [ MySQL ] +--(Requisições HTTP/REST)---> [ Cloudinary API ]


---

## 📋 Funcionalidades Principais

* **Usuário / Atleta:**
  * Cadastro e autenticação segura via token.
  * Visualização e gerenciamento de fichas de treino e exercícios detalhados (séries, repetições, carga e descanso).
  * Gerenciamento de perfil e atualização de foto em nuvem.
* **Administrador:**
  * Gestão completa de usuários e cadastro de exercícios do sistema.

---

## 📡 Documentação da API (Resumo)

A API backend utiliza autenticação baseada em **Bearer Token (Sanctum)** e retorna dados em formato **JSON**. Alguns dos principais endpoints incluem:

| Método | Rota | Descrição |
| :--- | :--- | :--- |
| `POST` | `/login` | Autentica o usuário e retorna o token de acesso. |
| `GET` | `/me` | Retorna os dados do usuário autenticado. |
| `POST` | `/logout` | Revoga o token atual de acesso. |
| `GET` | `/pegaDados/{id}` | Retorna as fichas de treino e exercícios associados ao usuário. |

---

## 👥 Autores

* **Lucas Malaquias Bispo Silva** — Desenvolvimento do Projeto.
* **Orientador:** Prof. Fernando Paim Lima.
* **Coorientador:** Prof. Roger Santos Ferreira.

---

<div align="center">
  <sub>Desenvolvido para o Trabalho Integrador do Técnico em Informática — IFMG Campus Formiga (2026)</sub>
</div>
