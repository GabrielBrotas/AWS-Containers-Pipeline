# na imagem node versao 16-alpine
FROM node:16-alpine 

# diretorio onde vai estar a aplicação
WORKDIR /usr/app
# copiar o arquivo package.json e yarn lock(cache das dependencias) para o diretorio /usr/app
COPY package.json yarn.lock ./

# instalar as dependencias
RUN yarn

# copiar todos os arquivos dentro da raiz do projeto para o diretorio /usr/app, menos o node modules que vai estar no docker ignore
COPY . .

# expose na porta 3000
EXPOSE 3000

# comando para executar quando a aplicação inicializar
CMD ["yarn", "start"]
