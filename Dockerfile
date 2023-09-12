FROM node

WORKDIR /app

ADD . /app

RUN npm install --registry=https://registry.npm.taobao.org

RUN npm run build

RUN ls

FROM nginx

COPY  dist/ /usr/share/nginx/html/
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80