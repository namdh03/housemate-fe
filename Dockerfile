##### Dockerfile #####
## build stage ##
FROM node:18.18-alpine as build
WORKDIR /app
COPY . .
RUN yarn
RUN yarn build

## run stage ##
FROM nginx:alpine
RUN mkdir -p /run
COPY --from=build /app/dist /run
COPY nginx.conf /etc/nginx/nginx.conf