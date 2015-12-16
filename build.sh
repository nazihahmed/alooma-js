#!/bin/bash

echo 'Building module and globals bundles'
./node_modules/.bin/rollup -i src/loader-module.js -f amd -o build/alooma.amd.js
./node_modules/.bin/rollup -i src/loader-module.js -f cjs -o build/alooma.cjs.js
./node_modules/.bin/rollup -i src/loader-module.js -f umd -o build/alooma.umd.js -n alooma
./node_modules/.bin/rollup -i src/loader-globals.js -f iife -o build/alooma.globals.js -n alooma

echo 'Minifying globals build and snippets'
if [ -z "$1" ]; then
    COMPILER=vendor/closure-compiler/compiler.jar
else
    COMPILER=$1
fi
java -jar $COMPILER --js alooma.js --js_output_file alooma.min.js --compilation_level ADVANCED_OPTIMIZATIONS --output_wrapper "(function() {
%output%
})();"
java -jar $COMPILER --js alooma-jslib-snippet.js --js_output_file alooma-jslib-snippet.min.js --compilation_level ADVANCED_OPTIMIZATIONS
java -jar $COMPILER --js alooma-jslib-snippet.js --js_output_file alooma-jslib-snippet.min.test.js --compilation_level ADVANCED_OPTIMIZATIONS --define='ALOOMA_LIB_URL="../alooma.min.js"'

echo 'Bundling module-loader test runners'
./node_modules/.bin/webpack tests/module-cjs.js tests/module-cjs.bundle.js
./node_modules/.bin/browserify tests/module-es2015.js -t [ babelify --compact false ] --outfile tests/module-es2015.bundle.js

echo 'Bundling module-loader examples'
pushd examples/commonjs-browserify; npm install && npm run build; popd
pushd examples/es2015-babelify; npm install && npm run build; popd
pushd examples/umd-webpack; npm install && npm run build; popd
