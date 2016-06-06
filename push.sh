#!/bin/bash
set -eu

TARGETS=(atos bluemix pws)

for t in $TARGETS
do
  echo "Pushing to $t"
  cf set-target $t
  cf push
done

echo "App has been pushed to all targets."
