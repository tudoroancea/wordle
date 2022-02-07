import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wordle/widgets/word_grid.dart';
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
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Wordle',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              // TODO : add help screen
            },
            icon: Icon(
              Icons.help,
              color: Theme.of(context).primaryColor,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                // TODO : add stats screen
              },
              icon: Icon(
                Icons.bar_chart_outlined,
                color: Theme.of(context).primaryColor,
              ),
            ),
            IconButton(
              onPressed: () {
                // TODO : add settings screen
              },
              icon: Icon(
                Icons.settings,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
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
