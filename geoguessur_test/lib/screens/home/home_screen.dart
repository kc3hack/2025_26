import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                context.go('/guessr');
              },
              child: const Text("Go To Guessr Screen"),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/list');
              },
              child: const Text("Go To About Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
