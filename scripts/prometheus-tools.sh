#!/usr/bin/env bash

## Reload config
### Required prometheus settings
### --web.enable-lifecycle
### https://prometheus.io/docs/prometheus/latest/migration/#prometheus-lifecycle

## Optional tools
### promtool

function reload_config() {
  local ret=$(curl -s -X POST http://localhost:9090/-/reload)

  if [[ $! -ne 0 ]]; then
    echo 0
  else
    echo $ret
  fi
}


reload_config
