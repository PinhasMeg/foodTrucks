#!/bin/bash

# build the flask container
docker build -t mult_foodtrucks_image .

# create the network
docker network create foodtrucks_net

# run the ES container
docker run -d --name es --net foodtrucks_net -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:6.3.2

# run the flask app container
docker run  --net foodtrucks_net -p 5000:5000 --name foodtrucks_app mult_foodtrucks_image

