QUnit.config.autostart = false;

requirejs(['../build/alooma.amd'], function(alooma) {

    $('#qunit-tests').addClass('hidepass');
    alooma.init("ALOOMA_TOKEN", {
        cookie_name: "test",
        reset_cookie: true,
        debug: true
    });

    test_alooma(alooma);

    test('alooma object is not attached to window', 1, function() {
        ok(_.isUndefined(window.alooma), "window.alooma should be undefined");
    });

    QUnit.start();

});
