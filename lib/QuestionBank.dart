import 'Question.dart';

class QuestionBank {
  int _quesNo = 0;

  final List<Questions> _questionBank = [
    Questions('Question 1:\n The Architecture of Faisal Mosque is', false),
    Questions('Question 2:\n Islamic revolution occur in Iran', true),
    Questions('Question 3:\n Treaty of severs was signed in ', true),
    Questions('Question 4:\n 27 March celebrated as', true),
    Questions('Question 5:\n Largest source of pollution in the world', false),
    Questions('Question 6:\n Name of Agency', false),
    Questions('Question 7:\n Makran Medical College Located', true),
    Questions(
        'Question 8:\n World Pakistan has been used in National Anthem', true),
    Questions(
        'Question 9:\n Nuclear Power Plant located in which Country', true),
    Questions('Question 10:\n Abu Nasir Died', false),
  ];
  void nextQuestion() {
    if (_quesNo < _questionBank.length - 1) {
      _quesNo++;
    }
  }

  String GetQuestions() {
    return _questionBank[_quesNo].question;
  }

  bool CorrectAnswer() {
    return _questionBank[_quesNo].answer;
  }

  bool isFinished() {
    if (_quesNo >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _quesNo = 0;
  }
}
