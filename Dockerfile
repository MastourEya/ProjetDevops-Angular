# stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install --legacy-peer-deps
RUN npm run build
# stage 2
FROM nginx:latest
COPY default.conf /etc/nginx/conf.d
COPY --from=node /app/dist /usr/share/nginx/html 
