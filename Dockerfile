## build stage
FROM node:alpine as build-step
RUN mkdir -p /app
WORKDIR /app
COPY html/package.json /app
RUN npm install
COPY html /app/
RUN npm run build

# server stage
FROM php:7.0-apache
COPY --from=build-step /app/dist/ /var/www/html/
