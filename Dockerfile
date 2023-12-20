FROM node:alpine as development

WORKDIR /app-docker-type

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build



FROM node:alpine as production

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

WORKDIR /app-docker-type

COPY package*.json ./

RUN npm ci --omit=dev

COPY --from=development /app-docker-type/dist ./dist

CMD [ "node", "dist/index.js" ]