part of 'main.dart';

setupPub(ArgParser parser) {
  var command = parser.addCommand('pub');
  command.addFlag('publish', abbr: 'p');
  command.addFlag('lint', abbr: 'l');
}

runPub(results) {
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

_publish() {
  Process.run('pub', ['publish', '--server', 'https://pub.dev/'])
      .then((ProcessResult results) {
    print(Helper.output(results));
  }).catchError((e) {
    if (_debug) {
      print("publish error = $e");
    } else {
      print("command pub not found.");
    }
  });
}

_lint() {
  Process.run('pub', ['publish', '--dry-run']).then((ProcessResult results) {
    print(Helper.output(results));
  }).catchError((e) {
    if (_debug) {
      print("lint error = $e");
    } else {
      print("command pub not found.");
    }
  });
}