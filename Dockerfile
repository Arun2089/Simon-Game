FROM node as app
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install 
COPY .  .
RUN npm run build

FROM nginx
WORKDIR /usr/share/nginx/html
COPY --from=app /app/build  .
EXPOSE 80
