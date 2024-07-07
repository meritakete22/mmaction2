#!/usr/bin/env bash

set -e

DATA_DIR="../../../data/ava/test"
ANNO_DIR="../../../data/ava/annotations"

if [[ ! -d "${DATA_DIR}" ]]; then
  echo "${DATA_DIR} does not exist. Creating";
  mkdir -p ${DATA_DIR}
fi

cat ${ANNO_DIR}/ava_test_v2.2.txt |
while read vid;
    do wget -c "https://s3.amazonaws.com/ava-dataset/test/${vid}.mkv" -P ${DATA_DIR} || true;
done

echo "Downloading finished."