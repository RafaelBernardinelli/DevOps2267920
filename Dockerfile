FROM node:12-alpine as builder
WORKDIR /usr/src/app/
COPY package*.json ./
RUN npm install

FROM node:12-alpine
ENV USER node
ENV WORKDIR /home/$USER/app
WORKDIR $WORKDIR

# Adiciona os repositórios de teste do Alpine
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

# Instala as dependências
RUN apk --no-cache add \
    libgconf-2-4=3.2.6-r1 \
    gconf=3.2.6-r1

COPY --from=builder /usr/src/app/node_modules node_modules
COPY --chown=node . $WORKDIR
USER $USER
EXPOSE 4000
