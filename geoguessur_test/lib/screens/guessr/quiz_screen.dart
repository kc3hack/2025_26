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

  @override
  Widget build(BuildContext context) {
    final geoService = GeoService();
    final maxDistance = 50000.0; // 大阪府の端から端までの長さの半分（メートル）
    final placeFuture = useMemoized(() => _fetchPlace(geoService, level));
    final snapshot = useFuture(placeFuture);
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
          if (snapshot.connectionState == ConnectionState.waiting)
            Center(child: CircularProgressIndicator())
          else if (snapshot.hasError)
            Center(child: Text('Error: ${snapshot.error}'))
          else if (snapshot.hasData)
            FadeTransition(
              opacity: animationController,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.grey,
                      padding: const EdgeInsets.symmetric(vertical: 50.0),
                      child: Image.asset(snapshot.data!.imageUrl),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        children: [
                          Text('Place: ${snapshot.data!.name}'),
                          Text('Address: ${snapshot.data!.address}'),
                        ],
                      ),
                    ),
                    if (showButton.value)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade500,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () async {
                          try {
                            final answerLocation = await getCurrentPosition();
                            final score = await calculateScore(
                              snapshot.data!.address,
                              maxDistance,
                              answerLocation,
                            );
                            context.go('./result', extra: score);
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
            )
          else
            Center(child: Text('No data')),
        ],
      ),
    );
  }

  Future<Place> _fetchPlace(GeoService geoService, int level) async {
    final location = await getCurrentPosition();
    return await geoService.getRandomPlace(level, location);
  }
}
