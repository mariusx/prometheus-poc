#!/usr/bin/env bash

# Run all containers

if [[ ! -d "prometheus" || ! -d "redis" ]]; then
  echo "Your'e in the wrong directory"
  exit 1
fi

basedir=$PWD

cd "redis"
docker-commpose up -d &
cd ${basedir}

cd "redis_exporter"
docker-commpose up -d &
cd ${basedir}

cd "prometheus"
docker-commpose up -d
docker-commpose logs -f
#cd ${basedir}
