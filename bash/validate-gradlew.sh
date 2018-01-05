#!/bin/bash

set -e

# ci looks for $OUTPUT
OUTPUT_DIR="$(pwd)/output"
[ ! -d OUTPUT_DIR ] && mkdir -p OUTPUT_DIR
OUTPUT=$OUTDIR/validate.log
touch $OUTPUT

cd $1
./gradlew test | tee -a $OUTPUT
