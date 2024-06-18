# define base docker image
FROM node:alpine
# default application directory
WORKDIR /usr/src/app
# copy package.json and package-lock.json separately to leverage Docker cache
COPY package*.json ./
# install the necessary dependencies
RUN npm install
# copy the rest of the application code
COPY . .
# build the Angular application
RUN npm run build
# runs the Angular app
CMD ["ng", "serve", "--host", "0.0.0.0"]