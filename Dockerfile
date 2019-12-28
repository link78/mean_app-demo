#use this use a build docker image
FROM node:alpine AS builder

#update node alpine image
RUN apk update && apk add --no-cache make git

#create working directory
WORKDIR /app

COPY . .

#install dependencies and run app
RUN npm install && \
    npm run build

#image for deploy
FROM nginx:alpine

#Copy to nginx web server: will be listen to 0.0.0.0:80
COPY --from=builder /app/dist/* /usr/share/nginx/html/
