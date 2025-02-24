import 'package:flutter/material.dart';
import 'package:geoguessur_test/component/level/level_tile.dart';

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
            alignment: Alignment(0.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // 中央に配置
              children: [
                LevelTile(
                  leadingText: '簡単',
                  levelTitle: '初級',
                  levelSubtitle: '簡単なレベルのクイズです。',
                  route: '/guessr/level/1/quiz',
                ),
                const SizedBox(height: 20),
                LevelTile(
                  leadingText: '府県内',
                  levelTitle: '中級',
                  levelSubtitle: '中級レベルのクイズです。',
                  route: '/guessr/level/2/quiz',
                ),
                const SizedBox(height: 20),
                LevelTile(
                  leadingText: '近畿',
                  levelTitle: ' 上級',
                  levelSubtitle: '難しいレベルのクイズです。',
                  route: '/guessr/level/3/quiz',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
