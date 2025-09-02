# Usando Debian 13 como base
FROM debian:bookworm-slim

# Instala dependências básicas
RUN apt-get update && apt-get install -y \
    curl \
    git \
    sqlite3 \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Instala Node.js (versão 22 LTS, recomendada para Strapi v5)
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
    && apt-get install -y nodejs

# Instala Yarn (gerenciador de pacotes)
RUN npm install -g yarn

# Cria diretório do app
WORKDIR /srv/app

# Expõe a porta usada pelo Strapi
EXPOSE 1337

# Comando padrão ao entrar no container
CMD [ "bash" ]
