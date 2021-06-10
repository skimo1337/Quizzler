import 'package:flutter/material.dart';
import 'quesiton.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scorer = [];

  List<Question> question = [
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: true),
    Question(q: 'A slug\'s blood is green.', a: true),
  ];

  int x = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              question[x].qtext,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              onPressed: () {
                if (question[x].answer == false) {
                  scorer.add(
                    Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  );
                } else {
                  scorer.add(
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  );
                }
                setState(() {
                  if (x < 2) {
                    x++;
                  }
                });
              },
              color: Colors.yellow,
              child: Text('True'),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              onPressed: () {
                if (question[x].answer == true) {
                  scorer.add(
                    Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  );
                } else {
                  scorer.add(
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  );
                }
                setState(() {
                  if (x < 2) {
                    x++;
                  }
                });
              },
              color: Colors.red,
              child: Text('False'),
            ),
          ),
        ),
        Row(
          children: scorer,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
