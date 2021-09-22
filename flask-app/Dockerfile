FROM nginx:alpine
#WORKDIR /usr/share/nginx/html

COPY ./templates/ /usr/share/nginx/html/
COPY ./static /usr/share/nginx/html/static/
COPY ./static/favicon.ico /usr/share/nginx/html/
EXPOSE 80