FROM node:15
WORKDIR /app
COPY  package.json .
RUN npm install 
#copy all the files to the /app and because we have used the WORKDIR so we can write . or ./ for the destination 
COPY . ./
ENV PORT 3000
#use printenv in the target to see the all environment variables
EXPOSE $PORT
#CMD ["npm", "index.js"]
CMD ["npm", "run", "dev"]

#docker build -t node-app-image .


#if you are in the development you need to use this command to edit your code 
#docker run -v ${PWD}:/app --name node-app-dh  -p 3000:3000 -d node-app-image

# to remove node_modules in the current directory and prevent docker to remove the node_modules in the container, we can use the ananymouse volume binding so there is no source but there is only one destination

#docker run -v ${PWD}:/app -v /app/node_modules --name node-app-dh  -p 3000:3000 -d node-app-image


#docker run -v ${PWD}:/app:ro -v /app/node_modules --name node-app-dh  -p 3000:3000 -d node-app-image




#-------------------------- evn file -------------------------
# if you had a lot of environment variables and need to use them all in the command with --env command, you can go for the .envfile and use them all together 
# then the command would be like this
# docker run -v ${PWD}:/app -v /app/node_modules --name node-app-dh --env-file ./envfile  -p 3000:3000 -d node-app-image