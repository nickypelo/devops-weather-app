# define base docker image
FROM node:alpine
# default application directory
WORKDIR /usr/src/app
# copy local app files to the defined application
COPY . /usr/src/app
# install the necessary angular CLI 
RUN npm install -g @angular/cli
# install the angular dependencies
RUN npm install
# create and run application
CMD ["ng", "serve", "--host", "0.0.0.0"]