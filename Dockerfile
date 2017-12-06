FROM node:7
WORKDIR /app

COPY package.json /app
RUN npm install
COPY . /app

RUN cd /app/angular-src; npm install -g @angular/cli@latest; npm install; ng build

CMD npm start

EXPOSE 3000
