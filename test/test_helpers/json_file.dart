import 'dart:io';

class FileDummy {
  static Future<String> readJsonFile(String fileName) {
    final file = File('test_resources/$fileName.json');
    return file.readAsString();
  }
}
