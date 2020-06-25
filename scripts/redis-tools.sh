#!/usr/bin/env bash

# Redis tools
##

function usage() {
  echo "Access redis to run redis-cli:"
  echo "docker exec -it redis_redis_1 /bin/bash"
  echo ">redis-cli"
}

function debugger() {
  echo "There is a debugger for lua"
  echo "/redis-cli --ldb --eval my-script.lua"
}

usage
debugger
