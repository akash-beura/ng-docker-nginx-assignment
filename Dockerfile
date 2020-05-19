#Taking a base image on top of which we'll run angular
FROM node:latest as build
#Setting up the work directory for the application.
WORKDIR /app
#Copying all the files outside app to the working dir
COPY . .
#to install the dependencies inside the container and build the application
RUN npm install && npm run build --prod

#Now I wil lsetup a NGINX proxy server for that.
FROM nginx:alpine
WORKDIR /usr/share/nginx/html
COPY --from=build /app/dist/NGDockerAssignment .


