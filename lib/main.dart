import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wordle/word_grid.dart';
import 'package:wordle/todays_word.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: FutureProvider<Dictionary>(
          create: (context) => getDictionary(),
          initialData: const <String, String>{},
          child: const WordGrid(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
