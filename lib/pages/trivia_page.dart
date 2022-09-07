import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_app/models/trivia_model.dart';
import 'package:quiz_app/pages/result_page.dart';
import 'package:quiz_app/pages/trivia.dart';

class TriviaPage extends StatefulWidget {
  const TriviaPage({Key? key}) : super(key: key);

  @override
  State<TriviaPage> createState() => _TriviaPageState();
}

class _TriviaPageState extends State<TriviaPage> {
  late List<TriviaModel> _triviaList;
  late TriviaModel _trivia;
  bool loaded = false;
  int currentScore = 0;
  int answeredQuestions = 0;

  Random random = Random();

  @override
  void initState() {
    super.initState();
    fetchTrivia(context).then(
      (value) => setState(
        () {
          _triviaList = value;
          _trivia = _triviaList[random.nextInt(_triviaList.length)];
          loaded = true;
        },
      ),
    );
  }

  answerQuestion({
    required bool choice,
    required bool correctAnswer,
  }) {
    if (choice == correctAnswer) {
      setState(() {
        currentScore++;
      });
    }

    evaluateAnswer();
  }

  evaluateAnswer() {
    if (answeredQuestions < 10) {
      setState(() {
        _trivia = _triviaList[random.nextInt(_triviaList.length)];
        answeredQuestions++;
      });
    }
  }

  restartGame() {
    setState(() {
      currentScore = 0;
      answeredQuestions = 0;
      _trivia = _triviaList[random.nextInt(_triviaList.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Trivia Game'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: answeredQuestions == 10
          ? ResultPage(
              score: currentScore,
              restartGame: restartGame,
            )
          : loaded
              ? Trivia(
                  trivia: _trivia.trivia,
                  answer: _trivia.answer,
                  answerQuestion: answerQuestion,
                  currentQuestionIndex: answeredQuestions,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
    );
  }
}

Future<List<TriviaModel>> fetchTrivia(BuildContext context) async {
  final response = await DefaultAssetBundle.of(context)
      .loadString('assets/database/database.json');

  final decodedData = jsonDecode(response) as List;

  return decodedData.map((json) => TriviaModel.fromJson(json)).toList();
}
