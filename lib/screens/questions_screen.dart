import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/results_screen.dart';
import 'package:quiz_app/utils/app_layout.dart';
import 'package:quiz_app/widgets/question_answer_button.dart';
import 'dart:developer' as developer;


class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var _currentQuestionIndex = 0;
  final selectedAnswers = <String>[];

  @override
  Widget build(BuildContext context) {
    final double displayWidth = AppLayout.displayWidth(context);
    final double displayHeight =
        AppLayout.displayHeightWithoutStatusBar(context);

    final currentQuestion = questions[_currentQuestionIndex];

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: displayWidth * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Wrap(
                children: [
                  Text(
                    currentQuestion.question,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.visible,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(
                height: displayHeight * 0.03,
              ),
              // question answer buttons and sized boxes using loop
              for (final answer in currentQuestion.getShuffledAnswers())
                Column(
                  children: [
                    QuestionAnswerButton(
                      answer,
                      () {
                        setState(() {
                          selectedAnswers.add(answer);
                          if (_currentQuestionIndex + 1 < questions.length) {
                            _currentQuestionIndex++;
                          } else {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return ResultScreen();
                                },
                                settings:
                                    RouteSettings(arguments: selectedAnswers),
                              ),
                            );
                          }
                        });
                      },
                    ),
                    SizedBox(
                      height: displayHeight * 0.02,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
