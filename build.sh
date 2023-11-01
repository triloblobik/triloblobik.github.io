#!/usr/bin/env bash
set -e
cd -- "$(dirname -- "$0")"

rm -rf result

mkdir -p result
cp -r static result/
cp -r articles/. result/
