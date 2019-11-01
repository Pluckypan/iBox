import 'dart:io';

import 'package:args/args.dart';
import 'package:dart_inquirer/dart_inquirer.dart';

import 'helper.dart';

part 'npm.dart';

part 'pub.dart';

main(List<String> arguments) {
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
    print(getHelperTips());
  }
}

String getHelperTips() {
  StringBuffer sb = StringBuffer();
  sb.writeln("----- iBox(0.0.1) -----");
  sb.writeln("\$ ibox npm -s, --server    set npm server.");
  sb.writeln("\$ ibox pub -l, --lint      pub publish --dry-run.");
  sb.writeln("\$ ibox pub -p, --publish   pub publish.");
  return sb.toString();
}
