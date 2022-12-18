FROM node:12
RUN mkdir /app
WORKDIR /app
COPY . .
COPY .npmrc /root/.npmrc
RUN npm install 
RUN npm run build-prod
RUN npm run build-webpack-prod

FROM bitnami/nginx:latest
EXPOSE 8080
COPY nginx.conf /opt/bitnami/nginx/conf/server_blocks/
COPY emailrootCA.pem /etc/ssl/certs/emailrootCA.pem
COPY --from=0 app/dist/shell /usr/share/nginx/html/
