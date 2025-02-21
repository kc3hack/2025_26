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
            alignment: Alignment(0.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // 中央に配置
              children: [
                Center(
                  child: ListTile(
                    leading: Container(
                      width: 110, // 幅を固定
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/wood.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Text(
                        '簡単',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      'Level 1: 初級',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '簡単なレベルのクイズです。',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    onTap: () {
                      context.go('/guessr/level/1/quiz');
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ListTile(
                    leading: Container(
                      width: 110, // 幅を固定
                      padding: const EdgeInsets.all(8.0),

                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/wood.png'),
                          fit: BoxFit.cover,
                        ),
                      ),

                      child: Text(
                        '府県内',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      'Level 2: 中級',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '中級レベルのクイズです。',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    onTap: () {
                      context.go('/guessr/level/2/quiz');
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ListTile(
                    leading: Container(
                      width: 110, // 幅を固定
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/wood.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Text(
                        '近畿',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      'Level 3: 上級',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '難しいレベルのクイズです。',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    onTap: () {
                      context.go('/guessr/level/3/quiz');
                    },
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
