FROM oracle/graalvm-ce:20.1.0-java11 as graalvm
RUN gu install native-image

COPY . /home/app/redis_exporter
WORKDIR /home/app/redis_exporter

RUN native-image --no-server -cp build/libs/redis_exporter-*-all.jar

FROM frolvlad/alpine-glibc
RUN apk update && apk add libstdc++
EXPOSE 8080
COPY --from=graalvm /home/app/redis_exporter/redis_exporter /app/redis_exporter
ENTRYPOINT ["/app/redis_exporter"]
