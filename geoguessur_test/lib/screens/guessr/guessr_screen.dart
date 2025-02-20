import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GuessrScreen extends StatelessWidget {
  const GuessrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('guessr')),
      body: new Stack(
        children: <Widget>[
          new Image.asset("images/guessur_thumbnail.JPG", fit: BoxFit.cover),
          new Center(
            child: ElevatedButton(
              onPressed: () {
                context.go('/guessr/level');
              },
              child: const Text('Go To level'),
            ),
          ),
        ],
        fit: StackFit.expand,
      ),
    );
  }
}
