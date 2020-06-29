# Redis exporter
Basic test to create a binder for metrics read from Redis.

## What it does
Reads `Db: "0", Hash: "h1", Field: "field10"`

Exposed as `redis.transactions.count`

## Build
Build the app, then 
build the native-app in docker as native image with GraalVM
````bash
./gradlew assemble
./docker-build-sh
````
Will create the image `micronaut_redis_exporter:latest`.

## Run
Run with docker  
````bash
docker run -p 8080:8080 micronaut_redis_exporter
````

## Feature http-client documentation

- [Micronaut Micronaut HTTP Client documentation](https://docs.micronaut.io/latest/guide/index.html#httpClient)

## Feature management documentation

- [Micronaut Micronaut Management documentation](https://docs.micronaut.io/latest/guide/index.html#management)

