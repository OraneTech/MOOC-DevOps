#Using a node alpine base image
FROM node:13-alpine

# Setting up environment variables for our app to talk our mongodb Database
ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

# Creating a directory in our image
RUN mkdir -p /home/app

# Copying everything in in our local working directory into the image directory
COPY ./app /home/app

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/app

# will execute npm install in /home/app because of WORKDIR
RUN npm install

# no need for /home/app/server.js because of WORKDIR
CMD ["node", "server.js"]

