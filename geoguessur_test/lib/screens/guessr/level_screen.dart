import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LevelScreen extends StatelessWidget {
  const LevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('level')),
      body: Center(
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.go('/guessr/level/1/quiz');
                },
                child: const Text('Go To quiz level 1'),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.go('/guessr/level/2/quiz');
                },
                child: const Text('Go To quiz level 2'),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.go('/guessr/level/3/quiz');
                },
                child: const Text('Go To quiz level 3'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
