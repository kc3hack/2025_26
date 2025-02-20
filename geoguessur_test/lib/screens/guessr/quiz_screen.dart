import 'package:flutter/material.dart';
import 'package:geoguessur_test/service/geo_service.dart';
import 'package:geoguessur_test/utils/location_info/calc_score.dart';
import 'package:geoguessur_test/utils/location_info/get_location_info.dart';
import 'package:go_router/go_router.dart';

class QuizScreen extends StatelessWidget {
  QuizScreen({super.key, required this.level});
  final int level;
  final GeoService geoService = GeoService();
  final double maxDistance = 50000; // 大阪府の端から端までの長さの半分（メートル）　何度によって変更
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("quiz level $level")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              final location = await getCurrentPosition();
              final place = await geoService.getRandomPlace(level, location);
              print(place.name + "," + place.address);

              final score = await calculateScore(
                place.address,
                maxDistance,
                location,
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
      ),
    );
  }
}
