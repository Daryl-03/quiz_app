import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/utils/app_layout.dart';
import 'package:quiz_app/widgets/question_correction.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedAnswers =
        ModalRoute.of(context)!.settings.arguments as List<String>;

    int correctAnswersNumber = 0;
    for (int i = 0; i < questions.length; i++) {
      if (questions[i].answers.first == selectedAnswers[i]) {
        correctAnswersNumber++;
      }
    }

    final displayHeight = AppLayout.displayHeightWithoutStatusBar(context);
    final displayWidth = AppLayout.displayWidth(context);
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SizedBox(
        width: displayWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrap(
              runAlignment: WrapAlignment.center,
              children: [
                Text(
                  "You have answered $correctAnswersNumber out of ${questions.length} correctly",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(
              height: displayHeight * 0.05,
            ),
            SizedBox(
              height: displayHeight * 0.5,
              width: displayWidth * 0.8,
              child: ListView(
                children: [
                  for(int i = 0; i<questions.length; i++)
                    Column(
                      children: [
                        QuestionCorrection(
                          index: i+1,
                          quizQuestion: questions[i],
                          answer: selectedAnswers[i],
                        ),
                        SizedBox(
                          height: displayHeight*0.05,
                        )
                      ],
                    )
                  // QuestionCorrection(
                  //   index: 1,
                  //   quizQuestion: questions.first,
                  //   answer: selectedAnswers.first,
                  // )
                ],
              ),
            ),
            SizedBox(
              height: displayHeight * 0.05,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context){
                      return const QuestionScreen();
                    }),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.refresh),
                    Text(
                      "Restart Quiz",
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
