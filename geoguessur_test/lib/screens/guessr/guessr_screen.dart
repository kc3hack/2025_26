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
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            height: 50,
            child: Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: const Text(
                'いざ、推測遊戯',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
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
                      width: buttonSize["horizontal"]! * 2,
                      height: buttonSize["vertical"]! * 2,
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
