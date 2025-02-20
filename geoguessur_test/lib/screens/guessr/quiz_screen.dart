import 'package:flutter/material.dart';
import 'package:geoguessur_test/service/geo_service.dart';
import 'package:geoguessur_test/utils/location_info/calc_score.dart';
import 'package:geoguessur_test/utils/location_info/get_location_info.dart';
import 'package:go_router/go_router.dart';
import 'package:geoguessur_test/interface/place.dart';

class QuizScreen extends StatelessWidget {
  QuizScreen({super.key, required this.level});
  final int level;
  final GeoService geoService = GeoService();
  final double maxDistance = 50000; // 大阪府の端から端までの長さの半分（メートル）　何度によって変更

  Future<Place> _fetchPlace() async {
    final startLocation = await getCurrentPosition();
    return await geoService.getRandomPlace(level, startLocation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("quiz level $level")),
      body: FutureBuilder<Place>(
        future: _fetchPlace(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final place = snapshot.data!;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(place.imageUrl),
                  Text('Place: ${place.name}'),
                  Text('Address: ${place.address}'),
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
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text('Error: $e')));
                      }
                    },
                    child: const Text('Go To Home'),
                  ),
                ],
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
