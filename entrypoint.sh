#!/bin/bash

set -e

sonar-scanner \
  -Dsonar.host.url=${INPUT_HOST} \
  -Dsonar.projectKey=${INPUT_PROJECTKEY} \
  -Dsonar.projectBaseDir=${INPUT_PROJECTBASEDIR} \
  -Dsonar.login=${INPUT_TOKEN} \
  -Dsonar.sources=. \
  -Dsonar.sourceEncoding=UTF-8

