#!/bin/bash
set -eu

declare -a targets=("appfog" "anynines" "atos" "bluemix" "predix" "pws" "swisscom")

function set_image {
  pushd img/screenshots > /dev/null
  cp $1.png app-1.png
  popd > /dev/null
}

function push_app {
  cf set-target $1
  cf push
}

for t in ${targets[@]}
do
  echo "Deploying to $t"
  set_image $t
  push_app $t
done

rm img/screenshots/app-1.png

echo "App has been pushed to all targets."
