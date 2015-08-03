#!/bin/bash

if [ -z "$1" ]; then
    echo "Please supply a path to the Google Closure Compiler .jar"
    exit 1
fi

java -jar $1 --js alooma.js --js_output_file alooma.min.js --compilation_level ADVANCED_OPTIMIZATIONS --output_wrapper "(function() {
%output%
})();"

java -jar $1 --js alooma-jslib-snippet.js --js_output_file alooma-jslib-snippet.min.js --compilation_level ADVANCED_OPTIMIZATIONS

java -jar $1 --js alooma-jslib-snippet.js --js_output_file alooma-jslib-snippet.min.test.js --compilation_level ADVANCED_OPTIMIZATIONS --define='ALOOMA_LIB_URL="../alooma.min.js"'
