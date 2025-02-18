import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LevelScreen extends StatelessWidget {
  const LevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('level')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go('/guessr/level/quiz');
          },
          child: const Text('Go To quiz'),
        ),
      ),
    );
  }
}
