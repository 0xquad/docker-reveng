#!/bin/sh
exec docker-compose -H unix:///var/run/docker0.sock "$@"
