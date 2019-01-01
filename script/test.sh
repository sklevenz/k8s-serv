#!/usr/bin/env bash

set -e

SOURCE="${0%/*}"

watch "figlet -f small snapshot ; curl -sS http://localhost:8081/version ; figlet -f small production ; curl -sS http://localhost:8080/version"
