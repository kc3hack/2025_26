import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Debug Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.go('/guessr');
              },
              child: const Text('Go to Guessr'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.go('/list');
              },
              child: const Text('Go to List'),
            ),
          ],
        ),
      ),
    );
  }
}
