#Use the node:10-alpine image as a base to
#create a directory for the app and its node_modules with node as its owner
#install all packages in package.json
#expose port 8080 and run the app
#the docker lecture will help you complete this file 
#there should be a total of 9 lines
FROM node:10-alpine
RUN mkdir -p /home/node-10/app && chown -R node:node /home/node-10/app
WORKDIR /home/node-10/app
COPY package.json ./
USER node
RUN npm install
COPY --chown=node:node . .
EXPOSE 8080
CMD ["node","app.js"]