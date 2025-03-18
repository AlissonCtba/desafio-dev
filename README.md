# Desafio CNAB - Aplicação Ruby on Rails

Este é um projeto desenvolvido como parte do desafio para a vaga de desenvolvedor. O objetivo é importar dados CNAB (transações financeiras) e salvá-los em um banco de dados relacional. A aplicação pode ser executada usando Docker.

## Tecnologias Utilizadas

- Ruby 3.0.2
- Rails 7.1.5.1
- Postgres 14.17

## Instalação e Execução

### Requisitos

- Docker
- Docker Compose

### Passo 1: Clone o repositório

Clone este repositório em seu ambiente local:

```bash
git clone https://github.com/AlissonCtba/desafio-dev
cd desafio-dev
```

### Passo 2: Configuração do Docker

Certifique-se de que o **Docker** e o **Docker Compose** estão instalados em sua máquina. Caso não tenha o Docker instalado, siga a documentação oficial do Docker [aqui](https://docs.docker.com/get-docker/) e [Docker Compose](https://docs.docker.com/compose/install/).

No diretório do seu projeto, você terá um arquivo `docker-compose.yml` configurado.

### Passo 3: Configuração do Docker

Após configurar o Docker, construa e suba os containers com o seguinte comando:

```bash
docker-compose up --build
```

Esse comando irá:

- Construir as imagens dos containers.
- Iniciar os containers da aplicação, banco de dados, Redis e sidekiq.

### Passo 4: Configurar o banco de dados

Uma vez que os containers estão em execução, execute a migração do banco de dados. Para isso, utilize os seguintes comandos:

```bash
docker-compose exec web rails db:create
docker-compose exec web rails db:migrate
```

### Passo 5: Iniciar o servidor

Depois de configurar o banco de dados, o servidor Rails estará pronto para ser iniciado. Se você estiver utilizando Docker, o servidor será iniciado automaticamente ao rodar o `docker-compose up`.

O servidor estará disponível no navegador em: http://localhost:3000
