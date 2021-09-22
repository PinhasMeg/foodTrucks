#multi dockerfile

FROM alpine:3.5 AS mult

RUN apk add
RUN apk add --no-cache python2
RUN apk add --update py2-pip
RUN apk update && \
    apk add --update nodejs  && \
    npm install newman --global
WORKDIR /project/flask-app

COPY flask-app /project/flask-app


FROM alpine:3.5

COPY --from=mult project/flask-app/ /project/flask-app/
WORKDIR /project/flask-app/
RUN apk add
RUN apk add --no-cache python2
RUN apk add --update py2-pip
RUN pip install -r requirements.txt
WORKDIR /project/flask-app/

RUN rm -rf templates static


# expose port
EXPOSE 5000


CMD [ "python", "./app.py" ]
