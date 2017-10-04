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
  echo "Test helper script to be run inside a container."
  echo "Go to $WORKSPACE_DIR directory before running this script."
  exit 1
fi

cp -v ${THIRDPARTY_DIR}/googletest_BUCK ${GOOGLETEST_DIR}/BUCK

buck targets

buck build //3rdparty/googletest-master:gtest

buck test //:greety_test --verbose 1 --num-threads 1 --no-cache --xml \
  ${PWD}/buck-out/gen/greety_test_results.xml
