#!/bin/bash

# Очистка предыдущих результатов и отчетов
rm -rf ${DOCKER_HOME}/allure-results/* ${DOCKER_HOME}/allure-report/*

# Запуск тестов Maven
mvn clean test -Dtest=RunnerTest -DbaseUrl=${BASE_URL} -DbrowserName=${BROWSER_NAME} -DbrowserVersion=${BROWSER_VERSION} -Dmaven.repo.local=${MAVEN_LOCAL_REPO}

# Генерация Allure отчета
allure generate ${DOCKER_HOME}/allure-results --clean -o ${DOCKER_HOME}/allure-report
