import 'question.dart';

class AppBrain {
  int _questionNumber = 0;

  final List<Question> _questionGroup = [
    Question(
        q: 'Le langage Python a été créé en 1991.',
        i: 'images/image1.jpg',
        a: true),
    Question(
        q: 'HTML est un langage de programmation.',
        i: 'images/image2.jpg',
        a: false),
    Question(
        q: 'Le premier iPhone a été lancé en 2007.',
        i: 'images/image3.jpeg',
        a: true),
    Question(
        q: 'Wi-Fi signifie « Fidélité sans fil ».',
        i: 'images/image4.jpg',
        a: false),
    Question(
        q: 'La Terre est la troisième planète du système solaire.',
        i: 'images/image5.jpeg',
        a: true),
    Question(
        q: 'L’ADN humain est composé de 4 types de bases azotées.',
        i: 'images/image6.jpeg',
        a: true),
    Question(
        q: 'Le cerveau humain est composé de 78 % d’eau.',
        i: 'images/image7.jpeg',
        a: false),
    Question(
        q: 'La vitesse de la lumière est d’environ 300 000 kilomètres par seconde.',
        i: 'images/image8.jpeg',
        a: true),
    Question(
        q: 'L’Australie est à la fois un pays et un continent.',
        i: 'images/image9.jpeg',
        a: true),
    Question(
        q: 'Le Nil est le fleuve le plus long du monde.',
        i: 'images/image10.jpeg',
        a: true),
    Question(
        q: 'La capitale du Canada est Toronto.',
        i: 'images/image11.jpeg',
        a: false),
    Question(
        q: 'Le mont Everest se trouve en Inde.',
        i: 'images/image12.jpeg',
        a: false),
  ];

  String? getQuestionText() {
    return _questionGroup[_questionNumber].questionText;
  }

  String? getQuestionImage() {
    return _questionGroup[_questionNumber].questionImage;
  }

  bool? getQuestionAnswer() {
    return _questionGroup[_questionNumber].questionAnswer;
  }

  void nextQuestion() {
    if (_questionNumber < _questionGroup.length - 1) {
      _questionNumber++;
    }
  }

  bool isLastQuestion() {
    return _questionNumber == _questionGroup.length - 1;
  }

  void resetQuiz() {
    _questionNumber = 0;
  }

  int getTotalQuestions() {
    return _questionGroup.length;
  }
}
