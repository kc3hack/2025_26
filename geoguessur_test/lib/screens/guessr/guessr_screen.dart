import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GuessrScreen extends StatelessWidget {
  const GuessrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('guessr')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go('/level');
          },
          child: const Text('Go To level'),
        ),
      ),
    );
  }
}
