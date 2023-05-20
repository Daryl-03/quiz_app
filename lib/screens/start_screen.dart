import 'package:flutter/material.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/utils/app_layout.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double displayWidth = AppLayout.displayWidth(context);
    final double displayHeight =
        AppLayout.displayHeightWithoutStatusBar(context);
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [
        //       Colors.deepPurple,
        //       Colors.deepPurpleAccent,
        //       Colors.deepPurple,
        //     ],
        //   ),
        // ),
        width: AppLayout.displayWidth(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              height: displayHeight * 0.3,
              color: Color.fromRGBO(255, 255, 255, 0.6),
            ),
            SizedBox(
              height: AppLayout.displayHeightWithoutStatusBar(context) * 0.08,
            ),
            const Text(
              "Learn Flutter the fun way !",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: AppLayout.displayHeightWithoutStatusBar(context) * 0.04,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context){
                    return QuestionScreen();
                  })
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.arrow_right_alt,
                    color: Colors.white,
                  ),
                  Text(
                    "Start Quiz",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
