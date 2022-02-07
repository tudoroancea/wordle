import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

typedef Dictionary = Map<String, dynamic>;

Future<Dictionary> getDictionary() {
  return rootBundle.loadString('assets/words.json').then((jsonString) {
    var json = jsonDecode(jsonString);
    return json;
  });
}

String getTodaysWord(Dictionary words) {
  var todaysDate = DateFormat('ddMMyyyy').format(DateTime.now());
  if (words.keys.contains(todaysDate)) {
    return words[todaysDate]!;
  } else {
    return '';
  }
}
