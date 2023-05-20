import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz_question.dart';
import 'package:quiz_app/utils/app_layout.dart';

class QuestionCorrection extends StatelessWidget {
  final int index;
  final QuizQuestion quizQuestion;
  final String answer;

  const QuestionCorrection(
      {Key? key,
      required this.index,
      required this.quizQuestion,
      required this.answer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayWidth = AppLayout.displayWidth(context);
    final double displayHeight =
        AppLayout.displayHeightWithoutStatusBar(context);
    final indexColor = (quizQuestion.answers.first==answer)?Colors.blue:Colors.pinkAccent;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: displayWidth * 0.1,
          height: displayHeight*0.1,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: indexColor,
          ),
          clipBehavior: Clip.hardEdge,
          child: Center(
            child: Text(
              index.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20
              ),
            ),
          ),
        ),
        SizedBox(
          width: displayWidth*0.02,
        ),
        Expanded(
          child: Container(
            // color: Colors.yellowAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  quizQuestion.question,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: displayHeight * 0.01,
                ),
                Text(
                  answer,
                  style: const TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 15,
                      fontWeight: FontWeight.normal
                  ),
                ),
                SizedBox(
                  height: displayHeight * 0.01,
                ),
                Text(
                  quizQuestion.answers.first,
                  style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.normal
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
