import 'package:flutter/material.dart';
import 'package:quiz_app/utils/app_layout.dart';

class QuestionAnswerButton extends StatelessWidget {
  const QuestionAnswerButton(this.answerText, this.onTap, {Key? key})
      : super(key: key);
  final String answerText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final double displayWidth = AppLayout.displayWidth(context);
    final double displayHeight =
        AppLayout.displayHeightWithoutStatusBar(context);
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        minimumSize: Size(displayWidth * 0.9, displayHeight * 0.08),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(displayWidth * 0.05),
        ),
      ),
      child: Wrap(
        children: [
          Text(
            answerText,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
