#!/usr/bin/env bash

set -ex
set -o pipefail

HOME_ASSISTANT_CUSTOM_COMPONENTS="$1"

cp custom_components/aerogarden.py $HOME_ASSISTANT_CUSTOM_COMPONENTS/.
cp custom_components/binary_sensor/aerogarden.py $HOME_ASSISTANT_CUSTOM_COMPONENTS/binary_sensor/.
cp custom_components/light/aerogarden.py $HOME_ASSISTANT_CUSTOM_COMPONENTS/light/.
cp custom_components/sensor/aerogarden.py $HOME_ASSISTANT_CUSTOM_COMPONENTS/sensor/.
