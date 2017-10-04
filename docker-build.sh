#!/usr/bin/env bash

docker build --tag praqma/native-buck:latest --file ${PWD}/Dockerfile ${PWD}
