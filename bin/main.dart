import 'dart:io';

import 'package:args/args.dart';
import 'package:dart_inquirer/dart_inquirer.dart';
import 'package:yaml/yaml.dart';
import 'package:path/path.dart' as p;

import '../lib/src/helper.dart';

part 'npm.dart';

part 'pub.dart';

var _binPath = p.dirname(Platform.script.path);
var _rootPath = p.dirname(_binPath);

void main(List<String> arguments) {
  var parser = new ArgParser();
  parser.addFlag("debug", abbr: 'd', defaultsTo: false);
  setupNpm(parser);
  setupPub(parser);
  try {
    var results = parser.parse(arguments);
    var debug = results['debug'];
    if (debug) {
      print("current mode = debug");
    }
    switch (results.command.name) {
      case 'npm':
        runNpm(results);
        break;
      case 'pub':
        runPub(results);
        break;
    }
  } catch (e) {
    getHelperTips().then(print).catchError((e) {
      if (_debug) {
        print(e);
      }
    });
  }
}

Future<String> getHelperTips() async {
  File f = new File(p.join(_rootPath, "pubspec.yaml"));
  var yaml = await f.exists() ? await f.readAsString() : "";
  var config = loadYaml(yaml);
  StringBuffer sb = StringBuffer();
  if (config is Map) {
    sb.writeln(
        "-------------- ${config['name']}(${config['version']}) --------------");
  }
  sb.writeln("\$ ibox npm -s, --server    set npm server.");
  sb.writeln("\$ ibox pub -l, --lint      pub publish --dry-run.");
  sb.writeln("\$ ibox pub -p, --publish   pub publish.");

  return sb.toString();
}
