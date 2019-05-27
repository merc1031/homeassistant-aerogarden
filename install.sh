#!/usr/bin/env bash

set -ex
set -o pipefail

HOME_ASSISTANT_CUSTOM_COMPONENTS="$1"

rm $HOME_ASSISTANT_CUSTOM_COMPONENTS/aerogarden.py || true
rm $HOME_ASSISTANT_CUSTOM_COMPONENTS/binary_sensor/aerogarden.py || true
rm $HOME_ASSISTANT_CUSTOM_COMPONENTS/sensor/aerogarden.py || true
rm $HOME_ASSISTANT_CUSTOM_COMPONENTS/light/aerogarden.py || true

sudo rm -rf $HOME_ASSISTANT_CUSTOM_COMPONENTS/aerogarden || true
cp -r custom_components/aerogarden $HOME_ASSISTANT_CUSTOM_COMPONENTS/aerogarden
