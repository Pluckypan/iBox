import 'dart:io';

import 'package:args/args.dart';
import 'package:dart_inquirer/dart_inquirer.dart';
import 'package:io/ansi.dart';
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
      print(yellow.wrap("current mode = debug"));
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
    print(getHelperTips());
  }
}

String getHelperTips() {
  String version = getVersion();
  StringBuffer sb = StringBuffer();
  sb.writeln(
      "-------------- iBox${version != null ? '(' + version + ')' : ''} --------------");
  sb.writeln("\$ ibox npm -s, --server    set npm server.");
  sb.writeln("\$ ibox pub -l, --lint      pub publish --dry-run.");
  sb.writeln("\$ ibox pub -p, --publish   pub publish.");
  return sb.toString();
}

String getVersion() {
  try {
    File f = File(p.join(_rootPath, "pubspec.yaml"));
    if (f.existsSync()) {
      var yaml = f.readAsStringSync();
      var config = loadYaml(yaml);
      return (config is Map) ? config['version'] : null;
    } else {
      var lockF = File(p.join(_rootPath, "pubspec.lock"));
      if (lockF.existsSync()) {
        var yaml = lockF.readAsStringSync();
        var config = loadYaml(yaml);
        return (config is Map) ? config['packages']['ibox']['version'] : null;
      } else {
        return null;
      }
    }
  } catch (e) {
    if (_debug) {
      print(red.wrap("$e"));
    }
    return null;
  }
}
