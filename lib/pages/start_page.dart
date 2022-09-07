import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/pages/trivia_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimateGradient(
        duration: const Duration(seconds: 5),
        primaryColors: const [
          Colors.purple,
          Colors.black,
        ],
        secondaryColors: const [
          Colors.black,
          Colors.purple,
        ],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Random Trivia Game',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TriviaPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow,
                  onPrimary: Colors.black,
                ),
                child: const Text('Start Game'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
