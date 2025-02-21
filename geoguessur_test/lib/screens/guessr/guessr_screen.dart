import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GuessrScreen extends StatelessWidget {
  const GuessrScreen({super.key});
  final imgLPosition = -0.3;
  final buttonMargin = 150.0;
  final Map<String, double> buttonSize = const {
    "horizontal": 100.0,
    "vertical": 40.0,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('guessr')),
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              "assets/images/guessur_thumbnail.JPG",
              fit: BoxFit.cover,
              alignment: Alignment(imgLPosition, 0),
            ),
          ),
          Align(
            alignment: const Alignment(0.0, 1.0),
            child: Container(
              margin: EdgeInsets.only(bottom: buttonMargin),
              child: GestureDetector(
                onTap: () {
                  context.go('/guessr/level');
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/images/wood.png',
                      width: buttonSize["horizontal"]! * 3,
                      height: buttonSize["vertical"]! * 3,
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      '開始',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Tamanegi',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
