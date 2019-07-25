import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'You did it!';
    if (resultScore <= 3) {
      resultText = 'test failed <=3';
    } else if (resultScore <= 7) {
      resultText = 'needs improvement <=7';
    } else if (resultScore <= 11) {
      resultText = 'fair enough <=11';
    } else if (resultScore <= 21) {
      resultText = 'You did it!';
    } else {
      resultText = 'weird score';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          FlatButton(
              child: Text('Restart Quiz',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              onPressed: resetHandler)
        ],
      ),
    );
  }
}
