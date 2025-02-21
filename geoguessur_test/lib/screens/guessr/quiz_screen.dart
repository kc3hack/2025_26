import 'package:flutter/material.dart';
import 'package:geoguessur_test/service/geo_service.dart';
import 'package:geoguessur_test/utils/location_info/calc_score.dart';
import 'package:geoguessur_test/utils/location_info/get_location_info.dart';
import 'package:go_router/go_router.dart';
import 'package:geoguessur_test/interface/place.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.level});
  final int level;

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>
    with SingleTickerProviderStateMixin {
  final GeoService geoService = GeoService();
  final double maxDistance = 50000; // 大阪府の端から端までの長さの半分（メートル）
  late Future<Place> _placeFuture;
  bool _showButton = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _placeFuture = _fetchPlace();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
    _delayedButtonDisplay();
  }

  Future<void> _delayedButtonDisplay() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _showButton = true;
    });
  }

  Future<Place> _fetchPlace() async {
    final location = await getCurrentPosition();
    return await geoService.getRandomPlace(widget.level, location);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("quiz level ${widget.level}")),
      body: FutureBuilder<Place>(
        future: _placeFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final place = snapshot.data!;
            return FadeTransition(
              opacity: _animation,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(place.imageUrl),
                    Text('Place: ${place.name}'),
                    Text('Address: ${place.address}'),
                    if (_showButton)
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            final answerLocation = await getCurrentPosition();
                            final score = await calculateScore(
                              place.address,
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
                        child: const Text('Go To Home'),
                      ),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: Text('No data'));
          }
        },
      ),
    );
  }
}
