FROM oracle/graalvm-ce:20.1.0-java11 as graalvm
RUN gu install native-image

COPY . /home/app/micronaut_redis_exporter
WORKDIR /home/app/micronaut_redis_exporter

RUN native-image --report-unsupported-elements-at-runtime --no-server -cp build/libs/micronaut_redis_exporter-*-all.jar

FROM frolvlad/alpine-glibc
RUN apk update && apk add libstdc++
EXPOSE 8080
COPY --from=graalvm /home/app/micronaut_redis_exporter/micronaut_redis_exporter /app/micronaut_redis_exporter
ENTRYPOINT ["/app/micronaut_redis_exporter"]
