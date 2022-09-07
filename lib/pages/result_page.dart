import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int score;
  final Function restartGame;

  const ResultPage({Key? key, required this.score, required this.restartGame})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Scored $score Out Of 10',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => restartGame(),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
              ),
              child: const Text('Restart'),
            ),
          ],
        ),
      ),
    );
  }
}
