import 'dart:io';

import 'package:args/args.dart';
import 'package:dart_inquirer/dart_inquirer.dart';

part 'npm.dart';

main(List<String> arguments) {
  var parser = new ArgParser();
  var command = parser.addCommand('npm');
  command.addFlag('server', abbr: 's');
  command.addFlag('version', abbr: 'v');

  try {
    var results = parser.parse(arguments);
    switch (results.command.name) {
      case 'npm':
        runNpm(results.command);
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
  sb.writeln("\$ ibox pub -s, --server    set pub server.");
  return sb.toString();
}
