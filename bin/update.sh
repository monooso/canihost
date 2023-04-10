#!/usr/bin/env bash
git pull origin main \
  && bash bin/build.sh \
  && bash bin/stop.sh \
  && bash bin/start.sh
