#!/bin/bash

set -e

# ci looks for $OUTPUT
OUTPUT_DIR="$(pwd)/output"
[ ! -d OUTPUT_DIR ] && mkdir -p $OUTPUT_DIR
OUTPUT=$OUTPUT_DIR/validate.log
touch $OUTPUT

cd $1
gradle build | tee -a $OUTPUT