#!/bin/bash
set -e

flutter pub get
dart run intl_utils:generate

echo "Build Data Done !!!"