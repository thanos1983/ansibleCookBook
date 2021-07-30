#!/usr/bin/env bash
# set -x
# set -e

docker info | grep 'Server Version'
docker info | grep 'Storage Driver'
docker info | grep 'Docker Root Dir'
