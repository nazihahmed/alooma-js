# Alooma JavaScript Library
The Alooma JavaScript Library is a set of methods attached to a global `Alooma` object
intended to be used by websites wishing to send data to Alooma projects. A full reference
is available [here](https://support.alooma.com/hc/en-us/articles/214522465-Javascript-SDK-integration).

## Alternative installation via Bower
`alooma-js` is also available via front-end package manager [Bower](http://bower.io/). After installing Bower, fetch into your project's `bower_components` dir with:
```sh
bower install alooma
```

### Using Bower to load the snippet
You can then load the lib via the embed code (snippet) with a script reference:
```html
<script src="bower_components/alooma/alooma-jslib-snippet.min.js"></script>
```
which loads the _latest_ library version from the Alooma CDN ([http://cdn.alooma.com/libs/alooma-latest.min.js](http://cdn.alooma.com/libs/alooma-latest.min.js)).

### Using Bower to load the entire library
If you wish to load the specific version downloaded in your Bower package, there are two options.

1) Override the CDN library location with the global `ALOOMA_CUSTOM_LIB_URL` var:
```html
<script>
  window.ALOOMA_CUSTOM_LIB_URL = 'bower_components/alooma/alooma.js';
</script>
<script src="bower_components/alooma/alooma-jslib-snippet.min.js"></script>
```
or

2) Recompile the snippet with a custom `ALOOMA_LIB_URL` using [Closure Compiler](https://developers.google.com/closure/compiler/):
```sh
java -jar compiler.jar --js alooma-jslib-snippet.js --js_output_file alooma-jslib-snippet.min.js --compilation_level ADVANCED_OPTIMIZATIONS --define='ALOOMA_LIB_URL="bower_components/alooma/alooma.js"'
```

## Running tests
- Install development dependencies: `npm install`
- Start test server: `npm start`
- Browse to [http://localhost:3000/tests/](http://localhost:3000/tests/) and choose a scenario to run

In the future we plan to automate the last step with a headless browser to streamline development (although
Alooma production releases are tested against a large matrix of browsers and operating systems).
