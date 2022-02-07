import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

// ignore: unused_element
Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/counter.txt');
}
