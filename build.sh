#!/usr/bin/env bash
set -e
cd -- "$(dirname -- "$0")"

OUTDIR=_build

rm -rf -- "${OUTDIR}"

mkdir -p -- "${OUTDIR}"
cp -r static  -- "${OUTDIR}"/

cd generator
cabal run
