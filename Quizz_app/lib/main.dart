import 'package:flutter/material.dart';
import 'app_brain.dart';

AppBrain appBrain = AppBrain();

void main() {
  runApp(ExamApp());
}

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text('Quizz'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: ExamPage(),
        ),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  int rightAnswers = 0;

  void CheckAnswer(bool whatUserPicked) {
    bool? correctAnswer = appBrain.getQuestionAnswer();

    // Incrémenter les bonnes réponses uniquement si la réponse est correcte
    if (whatUserPicked == correctAnswer) {
      rightAnswers++;
    }

    setState(() {
      // Passer à la question suivante
      appBrain.nextQuestion();

      // Si c'est la dernière question, réinitialiser le quiz
      if (appBrain.isLastQuestion()) {
        Future.delayed(const Duration(seconds: 1), () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Fin du quiz"),
                content: Text("Vous avez $rightAnswers réponses correctes"),
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        rightAnswers = 0;
                        appBrain.resetQuiz();
                      });
                      Navigator.of(context).pop();
                    },
                    child: const Text('Recommencer'),
                  ),
                ],
              );
            },
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Image.asset(
                appBrain.getQuestionImage() ?? 'default_image_path.jpg',
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                appBrain.getQuestionText() ?? 'Texte par défaut',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextButton(
              onPressed: () {
                CheckAnswer(true);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text(
                'VRAI',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextButton(
              onPressed: () {
                CheckAnswer(false);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                'FAUX',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
