IN: temporary
USING: io.unix.launcher tools.test ;

[ "" tokenize-command ] must-fail
[ "   " tokenize-command ] must-fail
[ { "a" } ] [ "a" tokenize-command ] unit-test
[ { "abc" } ] [ "abc" tokenize-command ] unit-test
[ { "abc" } ] [ "abc   " tokenize-command ] unit-test
[ { "abc" } ] [ "   abc" tokenize-command ] unit-test
[ { "abc" "def" } ] [ "abc def" tokenize-command ] unit-test
[ { "abc def" } ] [ "abc\\ def" tokenize-command ] unit-test
[ { "abc\\" "def" } ] [ "abc\\\\ def" tokenize-command ] unit-test
[ { "abc\\ def" } ] [ "'abc\\\\ def'" tokenize-command ] unit-test
[ { "abc\\ def" } ] [ "  'abc\\\\ def'" tokenize-command ] unit-test
[ { "abc\\ def" "hey" } ] [ "'abc\\\\ def' hey" tokenize-command ] unit-test
[ { "abc def" "hey" } ] [ "'abc def' \"hey\"" tokenize-command ] unit-test
[ "'abc def' \"hey" tokenize-command ] must-fail
[ "'abc def" tokenize-command ] must-fail
[ { "abc def" "h\"ey" } ] [ "'abc def' \"h\\\"ey\"  " tokenize-command ] unit-test

[
    {
        "Hello world.app/Contents/MacOS/hello-ui"
        "-i=boot.macosx-ppc.image"
        "-include= math compiler ui"
        "-deploy-vocab=hello-ui"
        "-output-image=Hello world.app/Contents/Resources/hello-ui.image"
        "-no-stack-traces"
        "-no-user-init"
    }
] [
    "\"Hello world.app/Contents/MacOS/hello-ui\" -i=boot.macosx-ppc.image \"-include= math compiler ui\" -deploy-vocab=hello-ui \"-output-image=Hello world.app/Contents/Resources/hello-ui.image\" -no-stack-traces -no-user-init" tokenize-command
] unit-test
