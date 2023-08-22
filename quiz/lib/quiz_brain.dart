import 'package:flutter/material.dart';
import 'package:quiz/quiz.dart';


class QuizBrainPage extends StatefulWidget {
  const QuizBrainPage({super.key});

  @override
  State<QuizBrainPage> createState() => _QuizBrainPageState();
}

class _QuizBrainPageState extends State<QuizBrainPage> {

  int currentIndex = 0;
  String result = "";

  // todo: change font

  void logic(bool answer) {
    setState(() {
      if (Quiz.samples[currentIndex].correctAnswer == answer) {
        result += "✅";
      } else {
        result += "❌";
      }

      if (currentIndex < Quiz.samples.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                Quiz.samples[currentIndex].question,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(Colors.green[700]!),
                            shape: MaterialStateProperty.all<BeveledRectangleBorder>(
                                BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(2),
                                )
                            ),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(vertical: 20),
                            ),
                          ),
                          onPressed: () => logic(true),
                          child: const Text(
                            'Verdadero',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(Colors.red[900]!),
                            shape: MaterialStateProperty.all<BeveledRectangleBorder>(
                                BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(2),
                                )
                            ),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(vertical: 20),
                            ),
                          ),
                          onPressed: () => logic(false),
                          child: const Text(
                            'Falso',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(result,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
