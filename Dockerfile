#Taking a base image on top of which we'll run angular
FROM node:14.2.0 as build
#Setting up the work directory for the application.
WORKDIR /app
#Copying the package.json to the working dir in order
COPY package.json .
#to install the dependencies inside the container and build the application
RUN npm install && npm run build

#Now I wil lsetup a NGINX proxy server for that.
FROM nginx:alpine
WORKDIR /usr/share/nginx/html
COPY --from=build /app/dist/ .


