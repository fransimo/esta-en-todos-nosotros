#!/usr/bin/env bash

docker run --rm -it \
  -v $(pwd):/src \
  -p 1313:1313 \
  hugomods/hugo:latest \
  server