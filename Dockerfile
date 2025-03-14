FROM ruby:3.0.2

# Instalar dependências do sistema operacional (Postgres, dependências do Node.js e Yarn)
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn

# Instalar o bundler
RUN gem install bundler -v '2.2.11' # Adicione a versão que você usa

# Defina o diretório de trabalho e copie os arquivos
WORKDIR /myapp
COPY . /myapp

# Rodar o bundle install
RUN echo "Iniciando o bundle install"
RUN bundle install
RUN echo "Bundle install concluído"

# Exponha a porta 3000
EXPOSE 3000

# Comando para iniciar a aplicação
CMD ["rails", "server", "-b", "0.0.0.0"]