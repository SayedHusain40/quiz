import 'package:quiz/models/quiz_questions.dart';
import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget {
  final List<QuizQuestions> questions;

  final Function(String) onClickNext;

  final Function(String, int) onUpdateAnswer;

  final Function() onFinish;

  const QuestionsScreen({
    super.key,
    required this.questions,
    required this.onClickNext,
    required this.onUpdateAnswer,
    required this.onFinish,
  });

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;
  List<String> saveUserAnswers = [];
  String? userAnswer;

  void onText() {
    if (userAnswer == null) {
      return;
    }

    if (currentQuestionIndex == widget.questions.length - 1) {
      widget.onFinish();
      return;
    }

    bool isNextAnswered = currentQuestionIndex + 1 < saveUserAnswers.length;

    setState(() {
      currentQuestionIndex++;
      if (isNextAnswered) {
        userAnswer = saveUserAnswers[currentQuestionIndex];
      } else {
        userAnswer = null;
      }
    });
  }

  void onPrevious() {
    if (currentQuestionIndex == 0) {
      return;
    }

    setState(() {
      currentQuestionIndex--;
    });
    userAnswer = saveUserAnswers[currentQuestionIndex];
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.questions[currentQuestionIndex];
    final isNextDisabled = userAnswer == null;
    final isPreviousDisabled = currentQuestionIndex == 0;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Quiz App'),
          Text(
            'Questions ${currentQuestionIndex + 1} of ${widget.questions.length}',
          ),
          Text(currentQuestion.question),
          RadioGroup(
            groupValue: userAnswer,
            onChanged: (value) {
              setState(() {
                userAnswer = value!;
                if (currentQuestionIndex < saveUserAnswers.length) {
                  saveUserAnswers[currentQuestionIndex] = userAnswer!;
                  widget.onUpdateAnswer(userAnswer!, currentQuestionIndex);
                } else {
                  saveUserAnswers.add(userAnswer!);
                  widget.onClickNext(userAnswer!);
                }
              });
            },
            child: Column(
              children: currentQuestion.answers.map((e) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: RadioListTile(
                    value: e,
                    visualDensity: VisualDensity(horizontal: -4),
                    title: Text(e),
                  ),
                );
              }).toList(),
            ),
          ),

          SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: CustomButton(
                  name: 'Previous',
                  onClick: onPrevious,
                  isDisabled: isPreviousDisabled,
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: CustomButton(
                  name: 'Next',
                  onClick: onText,
                  isDisabled: isNextDisabled,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String name;
  final VoidCallback onClick;

  final bool isDisabled;

  const CustomButton({
    super.key,
    required this.name,
    required this.onClick,
    required this.isDisabled,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        decoration: BoxDecoration(
          color: isDisabled == true ? Colors.grey : null,
          gradient: isDisabled == false
              ? LinearGradient(
                  colors: [Colors.deepPurpleAccent, Colors.purpleAccent],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
              : null,
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onClick,
          hoverColor: Colors.white.withValues(alpha: 0.1),
          splashColor: Colors.white.withValues(alpha: 0.2),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
