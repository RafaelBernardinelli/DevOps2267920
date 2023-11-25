FROM node:12-alpine as builder
WORKDIR /usr/src/app/
COPY package*.json ./
RUN npm install

FROM node:12-alpine
ENV USER node
ENV WORKDIR /home/$USER/app
WORKDIR $WORKDIR

# Instalando dependências específicas do Alpine
RUN apk --no-cache add libgconf-2-4 gconf || \
    (echo "Installing dependencies using pacman" && pacman -Sy --noconfirm libxss libxtst libnotify)

COPY --from=builder /usr/src/app/node_modules node_modules
COPY --chown=node . $WORKDIR
USER $USER
EXPOSE 4000