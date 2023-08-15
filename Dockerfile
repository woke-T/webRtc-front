FROM node as builder

WORKDIR /app

ADD . /app

RUN npm install --registry=https://registry.npm.taobao.org

RUN npm run build

RUN ls

FROM nginx:latest

COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80