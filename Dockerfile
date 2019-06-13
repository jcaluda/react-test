# Build the app
FROM node:10-alpine AS build

WORKDIR /var/app

COPY package.json /var/app

COPY package-lock.json /var/app

RUN npm install

ADD . .

RUN npm run build

# Create deployable image
FROM beamaustralia/react-env:latest

WORKDIR /var/www

COPY --from=build /var/app/build /var/www

COPY docker/.env* /var/www/

COPY docker/entrypoint.sh /var/entrypoint.sh