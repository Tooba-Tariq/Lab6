import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'QuestionBank.dart';
import 'package:flutter/src/material/theme.dart';
import 'Question.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Theme(
        data: ThemeData(
          splashColor: Colors.white,
        ),
        child: Scaffold(
          backgroundColor: Color(0xFF37393E),
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              ' Quiz App',
              style: TextStyle(fontSize: 40, fontWeight: (FontWeight.bold)),
            ),
            backgroundColor: Color(0xFF322727),
          ),
          body: SafeArea(
            child: MyQuiz(),
          ),
        ),
      ),
    );
  }
}

class MyQuiz extends StatefulWidget {
  @override
  _MyQuizState createState() => _MyQuizState();
}

class _MyQuizState extends State<MyQuiz> {
  QuestionBank obj = QuestionBank();
  List<int> score = [0, 0];
  List<Widget> scoreholder = [];
  void compareAnswer(bool answer) {
    bool corretAnswer = obj.CorrectAnswer();
    if (obj.isFinished() == true) {
      obj.reset();
      score = [0, 0];
      scoreholder = [];
    } else {
      if (corretAnswer == answer) {
        score[0]++;
        scoreholder.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        score[1]++;
        scoreholder.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      setState(() {
        obj.nextQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Text(
                obj.GetQuestions(),
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  compareAnswer(true);
                },
                child: Text(
                  'True',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF6DB46B))),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  compareAnswer(false);
                },
                child: Text(
                  'False',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFFE95B48))),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Row(
                children: scoreholder,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                        Text(score[0].toString()),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(score[1].toString()),
                        Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
