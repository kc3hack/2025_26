import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.score, required this.place});

  final int score;
  final place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("quiz result")),
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Opacity(
              opacity: 0.5,
              child: Image.asset(
                "assets/images/guessur_thumbnail.JPG",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.grey,

                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  child: Column(
                    children: [
                      Text(
                        '答え: ${place.name}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '得点: ${score}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 20.0),
                      Image.asset(place.imageUrl),
                      Text(
                        '番地: ${place.address}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    context.go('/');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade500,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0), // 楕円形に設定
                    ),
                  ),
                  child: const Text('最初に戻る'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
