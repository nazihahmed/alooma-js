import alooma from '../../src/loader-module';

alooma.init("FAKE_TOKEN", {
    debug: true,
    loaded: function() {
        alooma.track('loaded() callback works but is unnecessary');
        alert("Alooma loaded successfully via ES2015 Modules/Babelify");
    }
});

alooma.track('Tracking after alooma.init');
