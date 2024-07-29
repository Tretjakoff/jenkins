#!/bin/bash

# Запускаем Docker daemon в фоновом режиме
dockerd-entrypoint.sh &

# Запускаем SSH сервер
/usr/sbin/sshd -D
