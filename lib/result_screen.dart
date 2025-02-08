import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final List<String> answers;

  const ResultScreen({Key? key, required this.answers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommendations'),
      ),
      body: Center(
        child: Text(
          'Your choices: ${answers.join(', ')}',
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
