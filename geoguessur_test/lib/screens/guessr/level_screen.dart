import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LevelScreen extends StatelessWidget {
  const LevelScreen({super.key});
  final imgLPosition = -0.3;
  final buttonMargin = 150.0;
  final Map<String, double> buttonSize = const {
    "horizontal": 50.0,
    "vertical": 20.0,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('level')),
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Opacity(
              opacity: 0.5,
              child: Image.asset(
                "assets/images/guessur_thumbnail.JPG",
                fit: BoxFit.cover,
                alignment: Alignment(imgLPosition, 0),
              ),
            ),
          ),
          Align(
            alignment: new Alignment(0.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // 中央に配置
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/guessr/level/1/quiz');
                    },
                    child: const Text('Go To quiz level 1'),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/guessr/level/2/quiz');
                    },
                    child: const Text('Go To quiz level 2'),
                  ),
                ),
                const SizedBox(height: 20),
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
        ],
      ),
    );
  }
}
