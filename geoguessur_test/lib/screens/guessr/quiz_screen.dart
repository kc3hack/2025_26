import 'package:flutter/material.dart';
import 'package:geoguessur_test/utils/location_info/get_location_info.dart';
import 'package:geoguessur_test/utils/location_info/translate_location.dart';
import 'package:go_router/go_router.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key, required this.level});
  final int level;
  final testAdressString = '大阪府大阪市住吉区住吉２丁目９−８９';
  final double maxDistance = 50000; // 大阪府の端から端までの長さの半分（メートル）
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("quiz level $level")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              final location = await getCurrentPosition();
              final quizeLocation = await transLateAddressToLocate(
                testAdressString,
              );
              final distance = await getDistanceBetweenTwoPoints(
                location.latitude,
                location.longitude,
                quizeLocation.latitude,
                quizeLocation.longitude,
              );
              final score =
                  ((maxDistance - distance) / maxDistance * 100)
                      .clamp(0, 100)
                      .toInt();
              context.go('./result', extra: score);
            } catch (e) {
              // エラー処理
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
