#!/bin/bash
# Запуск Docker демона
dockerd &

exec "$@"
