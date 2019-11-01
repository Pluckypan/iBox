import 'dart:io';

class Helper {
  Helper._();

  static String output(ProcessResult results) {
    return "${results.stderr != null && results.stderr.length > 0 ? results.stderr : results.stdout}";
  }
}
