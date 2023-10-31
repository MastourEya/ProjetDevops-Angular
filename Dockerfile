FROM node:latest as node
WORKDIR /app
# Copy the package.json and package-lock.json files
COPY package*.json ./
RUN npm install --legacy-peer-deps
# Copy the rest of your application files
COPY . .
RUN npm run build 

FROM nginx:alpine
COPY --from=node /app/dist/ /usr/share/nginx/html
EXPOSE 80
