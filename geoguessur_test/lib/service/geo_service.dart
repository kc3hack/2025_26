import 'dart:math';
import 'package:geoguessur_test/interface/place.dart';
import 'package:geoguessur_test/utils/location_info/translate_location.dart';
import 'package:geolocator/geolocator.dart';

class GeoService {
  Future<Place> getRandomPlace(int level, Position location) async {
    // ハードコードされたPlaceリスト
    final places = [
      Place(
        id: 1,
        name: '住吉大社',
        address: '大阪府大阪市住吉区住吉2丁目9-89',
        category: Category.shrine,
        popularity: 5,
        year: '211',
        imageUrl: 'assets/images/sumiyoshi.jpg',
      ),
      Place(
        id: 2,
        name: '四天王寺',
        address: '大阪府大阪市天王寺区四天王寺1丁目11-18',
        category: Category.temple,
        popularity: 4,
        year: '593',
      ),
      Place(
        id: 3,
        name: '平城宮跡',
        address: '奈良県奈良市佐紀町',
        category: Category.ruins,
        popularity: 3,
        year: '710',
      ),
      Place(
        id: 4,
        name: '大仙陵古墳',
        address: '大阪府堺市堺区大仙町',
        category: Category.tomb,
        popularity: 2,
        year: '5世紀',
      ),
      Place(
        id: 5,
        name: '伏見稲荷大社',
        address: '京都府京都市伏見区深草薮之内町68',
        category: Category.shrine,
        popularity: 5,
        year: '711',
        imageUrl: 'assets/images/fusimiinari.jpg',
      ),
      Place(
        id: 6,
        name: '東大寺',
        address: '奈良県奈良市雑司町406-1',
        category: Category.temple,
        popularity: 5,
        year: '752',
        imageUrl: 'assets/images/todaiji.jpg',
      ),
      Place(
        id: 7,
        name: '吉野ヶ里遺跡',
        address: '奈良県吉野郡吉野町吉野山',
        category: Category.ruins,
        popularity: 4,
        year: '3世紀',
      ),
      Place(
        id: 8,
        name: '高松塚古墳',
        address: '奈良県高市郡明日香村平田',
        category: Category.tomb,
        popularity: 3,
        year: '7世紀',
      ),
    ];

    final currentAddress = await transLateLocateToAddress(location);
    final prefecture = currentAddress.administrativeArea;

    if (prefecture == null) {
      throw Exception('Failed to get prefecture');
    }
    print(prefecture);

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
