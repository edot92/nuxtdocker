
FROM node:8
ENV NPM_CONFIG_LOGLEVEL info
RUN npm install pm2 -g

RUN echo 'we are running some # of cool things'
# Create app directory
RUN mkdir -p /app
COPY . /app
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./app
WORKDIR /app

RUN npm install
RUN npm run build

EXPOSE 3000
CMD [ "npm", "start" ]