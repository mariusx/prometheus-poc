#!/bin/sh
docker build . -t micronaut_redis_exporter
echo
echo
echo "To run the docker container execute:"
echo "    $ docker run -p 8080:8080 redis_exporter"
