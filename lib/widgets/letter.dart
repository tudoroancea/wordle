import 'package:flutter/material.dart';

enum LetterStatus {
  correctSpot,
  wrongSpot,
  completelyWrong,
  noStatus,
}

Color colorFromStatus(LetterStatus status) {
  switch (status) {
    case LetterStatus.completelyWrong:
      return Colors.grey;
    case LetterStatus.correctSpot:
      return Colors.green;
    case LetterStatus.noStatus:
      return Colors.white;
    case LetterStatus.wrongSpot:
      return Colors.yellow;
  }
}

class Letter extends StatelessWidget {
  final String value;
  final LetterStatus status;

  const Letter({
    Key? key,
    required this.value,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: status == LetterStatus.noStatus
            ? Border.all(color: Colors.grey.shade300, width: 2.5)
            : null,
        color: colorFromStatus(status),
      ),
      child: Center(
        child: Text(
          value.toUpperCase(),
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color:
                status != LetterStatus.noStatus ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
