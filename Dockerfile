# Stage 1: Build dependencies
FROM node:12-alpine AS build
WORKDIR /usr/src/app/
COPY package*.json ./
RUN apk --no-cache add \
    libgconf \
    && npm install

# Stage 2: Copy dependencies to a smaller image
FROM node:12-alpine
ENV USER node
ENV WORKDIR /home/$USER/app
WORKDIR $WORKDIR
COPY --from=build /usr/src/app/node_modules ./node_modules

# Copy the rest of the application
COPY . .

# Set the user and expose the port
RUN adduser -D $USER && chown -R $USER:$USER $WORKDIR
USER $USER
EXPOSE 4000