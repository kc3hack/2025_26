import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geoguessur_test/service/geo_service.dart';
import 'package:geoguessur_test/utils/location_info/calc_score.dart';
import 'package:geoguessur_test/utils/location_info/get_location_info.dart';
import 'package:go_router/go_router.dart';
import 'package:geoguessur_test/interface/place.dart';

class QuizScreen extends HookWidget {
  const QuizScreen({super.key, required this.level});
  final int level;

  Future<Place> _fetchPlace(GeoService geoService, int level) async {
    final location = await getCurrentPosition();
    return await geoService.getRandomPlace(level, location);
  }

  @override
  Widget build(BuildContext context) {
    final geoService = GeoService();
    final maxDistance = 50000.0; // 大阪府の端から端までの長さの半分（メートル）
    final placeData = useMemoized(() => _fetchPlace(geoService, level));
    final placeFuture = useFuture(placeData);
    final showButton = useState(false);

    useEffect(() {
      Future.delayed(const Duration(seconds: 2), () {
        showButton.value = true;
      });
      return null;
    }, []);

    final animationController = useAnimationController(
      duration: const Duration(seconds: 1),
    )..forward();

    return Scaffold(
      appBar: AppBar(title: Text("quiz level $level")),
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
          if (placeFuture.connectionState == ConnectionState.waiting)
            Center(child: CircularProgressIndicator())
          else if (placeFuture.hasError)
            Center(child: Text('Error: ${placeFuture.error}'))
          else if (placeFuture.hasData)
            FadeTransition(
              opacity: animationController,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
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
                                  '此処は何処',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                FutureBuilder(
                                  future: precacheImage(
                                    NetworkImage(placeFuture.data!.imageUrl),
                                    context,
                                  ),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      return LayoutBuilder(
                                        builder: (context, constraints) {
                                          final imageWidth = 400.0;
                                          final imageHeight = 300.0;
                                          final isOverflowing =
                                              imageWidth >
                                                  constraints.maxWidth ||
                                              imageHeight >
                                                  constraints.maxHeight;

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
                                              placeFuture.data!.imageUrl,
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return CircularProgressIndicator();
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      if (showButton.value)
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade500,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                30.0,
                              ), // 楕円形に設定
                            ),
                          ),
                          onPressed: () async {
                            try {
                              final answerLocation = await getCurrentPosition();
                              final score = await calculateScore(
                                placeFuture.data!.address,
                                maxDistance,
                                answerLocation,
                              );
                              context.go(
                                './result',
                                extra: (score, placeFuture.data),
                              );
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Error: $e')),
                              );
                            }
                          },
                          child: const Text('回答'),
                        ),
                    ],
                  ),
                ),
              ),
            )
          else
            Center(child: Text('No data')),
          if (showButton.value)
            Positioned(
              top: 60,
              right: 20,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue, // 背景色を水色に設定
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // 楕円形に設定
                  ),
                ),
                icon: Icon(Icons.info_outline, color: Colors.white),
                label: Text('ヒント', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('説明'),
                        content: Text('ここに説明を入力します。'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('閉じる'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
