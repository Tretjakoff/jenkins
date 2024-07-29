#!/bin/sh
set -e

if [ "$1" = 'dockerd' ]; then
  if [ -n "$DOCKERD_ROOTLESS" ]; then
    if ! command -v rootlesskit > /dev/null 2>&1; then
      echo "error: rootlesskit (dependency for rootless mode) not found"
      exit 1
    fi
    exec rootlesskit --net=slirp4netns --disable-host-loopback --mtu=65520 \
      --slirp4netns-sandbox=auto --copy-up=/etc --copy-up=/run \
      dockerd-rootless.sh "$@"
  else
    exec dockerd "$@"
  fi
fi

exec "$@"
