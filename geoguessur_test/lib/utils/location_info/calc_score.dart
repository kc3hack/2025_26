import 'package:geoguessur_test/utils/location_info/get_location_info.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geoguessur_test/utils/location_info/translate_location.dart';

Future<int> calculateScore(
  String address,
  double maxDistance,
  Position location,
) async {
  try {
    final quizeLocation = await transLateAddressToLocate(address);
    print(location);
    print(quizeLocation);
    final distance = await getDistanceBetweenTwoPoints(
      location.latitude,
      location.longitude,
      quizeLocation.latitude,
      quizeLocation.longitude,
    );

    // 距離に基づいて点数を計算
    final score =
        ((maxDistance - distance) / maxDistance * 100).clamp(0, 100).toInt();
    return score;
  } catch (e) {
    throw Exception('Error calculating score: $e');
  }
}
