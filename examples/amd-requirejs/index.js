requirejs(['./alooma.amd'], function(alooma) {

    alooma.init("FAKE_TOKEN", {
        debug: true,
        loaded: function() {
            alooma.track('loaded() callback works but is unnecessary');
            alert("Alooma loaded successfully via RequireJS/AMD");
        }
    });

    alooma.track('Tracking after alooma.init');

});
