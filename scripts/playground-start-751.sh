#!/bin/bash
~/.tiup/bin/tiup playground v7.5.1 \
  --tag classroom \
  --db 2 \
  --pd 3 \
  --kv 3 \
  --tiflash 1
