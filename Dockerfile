FROM node:12 as builder
WORKDIR /usr/src/app/
COPY package*.json ./
RUN npm install

FROM node:12-slim
ENV USER node
ENV WORKDIR /home/$USER/app
WORKDIR $WORKDIR

COPY --from=builder /usr/src/app/node_modules node_modules
COPY --chown=node . $WORKDIR
USER $USER
EXPOSE 4000