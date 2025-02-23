import 'dart:math';
import 'package:geoguessur_test/interface/place.dart';
import 'package:geoguessur_test/service/database/firestore_service.dart';
import 'package:geoguessur_test/utils/location_info/translate_location.dart';
import 'package:geolocator/geolocator.dart';

class GeoService {
  final FirestoreService _firestoreService = FirestoreService();
  Future<Place> getRandomPlace(int level, Position location) async {
    final currentAddress = await transLateLocateToAddress(location);
    final prefecture = currentAddress.administrativeArea;

    if (prefecture == null) {
      throw Exception('Failed to get prefecture');
    }
    print(prefecture);

   // Firestoreからデータを取得
    List<Place> places = await _firestoreService.getAllPlaces();
    // レベルによって絞り込み
    List<Place> filteredPlaces;
    if (level == 3) {
      filteredPlaces = places;
    } else if (level == 2) {
      filteredPlaces =
          places.where((place) => place.address.contains(prefecture)).toList();
    } else {
      filteredPlaces = places.where((place) => place.popularity == 5).toList();
    }

    // ランダムに一つのPlaceを選択
    Random random = Random();
    int randomIndex = random.nextInt(filteredPlaces.length);
    Place selectedPlace = filteredPlaces[randomIndex];

    return selectedPlace;
  }
}
