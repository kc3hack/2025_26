import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('quiz')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go('/');
          },
          child: const Text('Go To Home'),
        ),
      ),
    );
  }
}
