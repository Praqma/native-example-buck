#!/usr/bin/env bash

set -x

export DEBIAN_FRONTEND=noninteractive
export WORKSPACE_DIR=/workspace
export THIRDPARTY_DIR=${WORKSPACE_DIR}/3rdparty

export GOOGLETEST_DIR=${THIRDPARTY_DIR}/googletest-master
export GTEST_DIR=${GOOGLETEST_DIR}/googletest
export GMOCK_DIR=${GOOGLETEST_DIR}/googlemock

export BUCK_DIR=${THIRDPARTY_DIR}/buck-master

if [ "$PWD" != "$WORKSPACE_DIR" ]; then
  echo "Build helper script to be run inside a container."
  echo "Go to $WORKSPACE_DIR directory before running this script."
  exit 1
fi

buck targets

buck build //:mainy --verbose 1 --no-cache

buck run //:mainy x y z --no-cache
