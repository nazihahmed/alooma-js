var alooma = require('../../build/alooma.cjs.js');

alooma.init("FAKE_TOKEN", {
    debug: true,
    loaded: function() {
        alooma.track('loaded() callback works but is unnecessary');
        alert("Alooma loaded successfully via Browserify/CommonJS");
    }
});

alooma.track('Tracking after alooma.init');
