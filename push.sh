#!/bin/bash
set -eu

declare -a targets=("atos" "bluemix" "predix" "pws")

for t in ${targets[@]}
do
  echo "Deploying to $t"
  cf set-target $t
  cf push
done

echo "App has been pushed to all targets."
