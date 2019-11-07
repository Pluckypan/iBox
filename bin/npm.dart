part of 'main.dart';

var _debug = false;

void setupNpm(ArgParser parser) {
  var command = parser.addCommand('npm');
  command.addFlag('server', abbr: 's');
  command.addFlag('version', abbr: 'v');
}

void runNpm(ArgResults results) {
  var command = results.command;
  _debug = results['debug'];
  if (command['server']) {
    _changeServer();
  } else if (command['version']) {
    _changeVersion();
  } else {
    print(getHelperTips());
  }
}

void _changeServer() async {
  List<Question> questions = [
    ListQuestion('server', 'select a server',
        ['https://registry.npmjs.org', 'https://registry.npm.taobao.org']),
  ];
  Prompt prompt = Prompt(questions);
  String server = (await prompt.execute())["server"];
  Process.run('npm', ['config', 'set', 'registry', server])
      .then((ProcessResult results) {
    _handleChangeServerResult();
  }).catchError((e) {
    print(red.wrap("command npm not found."));
  });
}

void _handleChangeServerResult() {
  Process.run('npm', ['config', 'get', 'registry'])
      .then((ProcessResult results) {
    print(green.wrap("registry => ${Helper.output(results)}"));
  }).catchError((e) {
    print(red.wrap("command npm not found."));
  });
}

void _changeVersion() async {
  List<Question> questions = [InputQuestion('version', 'input a version')];
  Prompt prompt = Prompt(questions);
  var version = (await prompt.execute())["version"];
  print(version);
}
