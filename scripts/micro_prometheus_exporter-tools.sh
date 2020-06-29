#!/usr/bin/env bash

## Trigger a scrape

# -- constants
base_url=http://localhost:8080
m_url=${base_url}/metrics
p_url=${base_url}/prometheus

function usage() {
  echo "Trigger metrics (default) or prometheus endpoint"
  echo "Metrics: >micro_prometheus_exporter-tools.sh"
  echo "Prometheus: >micro_prometheus_exporter-tools.sh p"
  echo "Help: >micro_prometheus_exporter-tools.sh h"
}

function get_url() {
  local url=${1}
  local ret=$(curl -s ${url} 2>&1)
  #echo "got this: ${1} ${ret}"
  if [[ $! -ne 0 ]]; then
    echo 0
  else
    echo $ret
  fi
}

if [[ "h" == ${1} ]]; then
  usage
elif [[ -z ${1} ]]; then
  get_url ${m_url}
else
  get_url ${p_url}
fi
