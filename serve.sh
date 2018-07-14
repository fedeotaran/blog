#!/bin/bash
docker run --rm -it -v $PWD:/src -p 1313:1313 -u hugo \
  jguyomard/hugo-builder hugo server -w -t cocoa \
  --bind=0.0.0.0 --verbose --baseUrl=http://192.168.1.105 \
  --disableFastRender
