import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GuessrScreen extends StatelessWidget {
  const GuessrScreen({super.key});
  final imgLPosition = -0.3;
  final buttonMargin = 150.0;
  final Map<String, double> buttonSize = const {
    "horizontal": 50.0,
    "vertical": 20.0,
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
            alignment: new Alignment(0.0, 1.0),
            child: Container(
              margin: new EdgeInsets.only(bottom: buttonMargin),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // 四角にする
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: buttonSize["horizontal"]!,
                    vertical: buttonSize["vertical"]!,
                  ), // サイズを大きくする
                ),
                onPressed: () {
                  context.go('/guessr/level');
                },
                child: const Text(
                  '開始',
                  style: TextStyle(fontSize: 20, fontFamily: 'Tamanegi'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
