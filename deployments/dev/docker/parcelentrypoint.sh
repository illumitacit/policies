#!/bin/bash

set -e

yarn

# Default to running parcel in watch mode. Otherwise, forward args to parcel command.
if [ $# -eq 0 ]; then
  yarn run parcel watch --no-hmr
else
  yarn run parcel "$@"
fi
