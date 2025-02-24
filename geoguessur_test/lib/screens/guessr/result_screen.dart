import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class ResultScreen extends HookWidget {
  const ResultScreen({super.key, required this.score, required this.place});

  final int score;
  final place;

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(seconds: 2),
    );

    final animation = IntTween(
      begin: 0,
      end: score,
    ).animate(animationController);

    useEffect(() {
      animationController.forward();
      return () => animationController.dispose();
    }, [animationController]);

    return Scaffold(
      appBar: AppBar(title: Text("結果発表")),
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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/wood2.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
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
                      AnimatedBuilder(
                        animation: animation,
                        builder: (context, child) {
                          return Text(
                            '得点: ${animation.value}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 20.0),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final imageWidth = 400.0;
                          final imageHeight = 300.0;
                          final isOverflowing =
                              imageWidth > constraints.maxWidth ||
                              imageHeight > constraints.maxHeight;

                          return SizedBox(
                            width:
                                isOverflowing
                                    ? constraints.maxWidth
                                    : imageWidth,
                            height:
                                isOverflowing
                                    ? constraints.maxHeight
                                    : imageHeight,
                            child: Image.network(
                              place.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
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
