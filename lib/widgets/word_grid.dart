import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordle/todays_word.dart';
import 'package:wordle/widgets/letter.dart';

class WordGrid extends StatefulWidget {
  const WordGrid({Key? key}) : super(key: key);

  @override
  _WordGridState createState() => _WordGridState();
}

class _WordGridState extends State<WordGrid> {
  List<String> _words = <String>[];
  final _text = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Widget getLetter(int index) {
    int wordIndex = index ~/ 5;
    int charIndex = index % 5;

    if (wordIndex >= _words.length || charIndex >= _words[wordIndex].length) {
      return const Letter(value: '', status: LetterStatus.noStatus);
    } else {
      final String char = _words[wordIndex][charIndex];
      String todaysWord = getTodaysWord(Provider.of<Dictionary>(context));
      if (kDebugMode) {
        print(todaysWord);
      }
      if (todaysWord.isEmpty) {
        // today's word has not been completely fetched yet (the dictionary has not yet been loaded)
        return Letter(value: char, status: LetterStatus.noStatus);
      } else {
        var truePositions = <int>[];
        for (int i = 0; i < todaysWord.length; i++) {
          if (todaysWord[i] == char) {
            truePositions.add(i);
          }
        }
        // return the Letter widget with the correct status
        if (truePositions.isEmpty) {
          return Letter(value: char, status: LetterStatus.completelyWrong);
        } else if (truePositions.contains(charIndex)) {
          return Letter(
            value: char,
            status: LetterStatus.correctSpot,
          );
        } else {
          return Letter(value: char, status: LetterStatus.wrongSpot);
        }
      }
    }
  }

  void enterWord(String word) {
    setState(() {
      _words.add(word);
    });
  }

  bool hasWon() {
    return _words.isNotEmpty &&
        _words.length <= 6 &&
        _words.last == getTodaysWord(Provider.of<Dictionary>(context));
  }

  bool hasLost() {
    return _words.length >= 6 &&
        _words.last != getTodaysWord(Provider.of<Dictionary>(context));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // FIXME : the WordGrid is too small for iPhone SE2
      child: SizedBox(
        width: 300.0,
        height: 500.0,
        child: Column(
          children: [
            GridView.count(
              primary: false,
              padding: const EdgeInsets.all(10.0),
              shrinkWrap: true,
              crossAxisCount: 5,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              children: List<Widget>.generate(
                30,
                getLetter,
                growable: false,
              ),
            ),
            !(hasWon() || hasLost())
                ? Form(
                    key: _formKey,
                    child: TextFormField(
                      decoration: const InputDecoration(helperText: ' '),
                      onEditingComplete: () {
                        if (_formKey.currentState!.validate()) {
                          enterWord(_text.text);
                          _text.clear();
                        }
                      },
                      controller: _text,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a word';
                        } else if (value.length != 5) {
                          return 'Please enter a 5 letter word';
                        } else if (value.contains(' ')) {
                          return 'Please enter a word without spaces';
                        } else {
                          return null;
                        }
                      },
                    ),
                  )
                : SizedBox(
                    height: 60.0,
                    child: Center(
                      child: hasLost()
                          ? const Text(
                              '🙁 You lost 🙁',
                              style: TextStyle(fontSize: 30.0),
                            )
                          : const Text(
                              '🎉 You won 🎉',
                              style: TextStyle(
                                  fontSize: 30.0, fontWeight: FontWeight.bold),
                            ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
