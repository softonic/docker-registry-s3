#!/bin/sh -e

config_file=/etc/docker/registry/config.yml

if [ -z ${AWS_BUCKET+x} ]; then
    echo "Variable AWS_BUCKET is missing"
    failure=1
fi

if [ -z ${AWS_REGION+x} ]; then
    echo "Variable AWS_REGION is missing"
    failure=1
fi

if [ -z ${AWS_KEY+x} ]; then
    echo "Variable AWS_KEY is missing"
    failure=1
fi

if [ -z ${AWS_SECRET+x} ]; then
    echo "Variable AWS_SECRET is missing"
    failure=1
fi

if [ $failure == 1 ]; then
    exit 1
fi

cat $config_file | \
    sed "s@#STORAGE_PATH#@$STORAGE_PATH@g" |\
    sed "s/#AWS_BUCKET#/$AWS_BUCKET/g" |\
    sed "s/#AWS_REGION#/$AWS_REGION/g" |\
    sed "s/#AWS_KEY#/$AWS_KEY/g" |\
    sed "s/#AWS_SECRET#/$AWS_SECRET/g" > /tmp/config-registry.yml

mv /tmp/config-registry.yml $config_file

exec /entrypoint.sh "$@"
