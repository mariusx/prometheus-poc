#!/usr/bin/env bash
# TODO: cleanup

target_seed_data=seed_data_h1.txt
targte_hash=h1

docker_instance=redis_redis_1

function generate_data() {
  local hash_name=${1}
  local target=${2}

  echo "HSET ${hash_name} field1 \"0.000002\"" > ${target}
  echo "HSET ${hash_name} field2 \"13\""       >> ${target}
  echo "HSET ${hash_name} field3 \"3.1415\""   >> ${target}
  echo "HSET ${hash_name} field4 \"TRUE\""     >> ${target}
  echo "HSET ${hash_name} field5 \"FALSE\""    >> ${target}
  echo "HSET ${hash_name} field6 \"UP\""       >> ${target}
  echo "HSET ${hash_name} field7 \"DOWN\""     >> ${target}
  echo "HSET ${hash_name} field8 \"0\""        >> ${target}
  echo "HSET ${hash_name} field9 \"1\""        >> ${target}

  for (( i = 9; i < 20; i++ )); do
    echo "HSET ${hash_name} field${i} \"${RANDOM}\" " >> ${target}
  done
}

ret=$(generate_data "${targte_hash}" "${target_seed_data}")

if [[ $! -ne 0 ]]; then
  echo "Failed to generate data: ${ret}"
  exit 1
else
  echo "Generated data"
fi

ret=$(docker exec -i ${docker_instance} /opt/bitnami/redis/bin/redis-cli < ${target_seed_data})

if [[ $! -ne 0 ]]; then
  echo "Failed to update data: ${ret}"
  exit 1
else
  echo "Updated data"
fi
