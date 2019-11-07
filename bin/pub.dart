part of 'main.dart';

void setupPub(ArgParser parser) {
  var command = parser.addCommand('pub');
  command.addFlag('publish', abbr: 'p');
  command.addFlag('lint', abbr: 'l');
}

void runPub(ArgResults results) {
  var command = results.command;
  _debug = results['debug'];
  if (command['publish']) {
    _publish();
  } else if (command['lint']) {
    _lint();
  } else {
    print(getHelperTips());
  }
}

void _publish() {
  Process.start('pub', ['publish', '--server', 'https://pub.dev/'])
      .then((process) {
    stdout.addStream(process.stdout);
    stderr.addStream(process.stderr);
    process.stdin.addStream(stdin);
    process.exitCode.then((code) {
      if (code == 0) {
        print(green.wrap("publish success."));
      }
    });
  }).catchError((e) {
    if (_debug) {
      print(red.wrap("publish error = $e"));
    } else {
      print(red.wrap("command pub not found."));
    }
  });
}

void _lint() {
  Process.run('pub', ['publish', '--dry-run']).then((ProcessResult results) {
    print(Helper.output(results));
  }).catchError((e) {
    if (_debug) {
      print(red.wrap("lint error = $e"));
    } else {
      print(red.wrap("command pub not found."));
    }
  });
}
