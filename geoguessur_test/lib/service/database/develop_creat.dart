import 'package:geoguessur_test/interface/place.dart';
import 'package:geoguessur_test/service/database/firestore_service.dart';

class DevelopCreat {
  final FirestoreService _firestoreService = FirestoreService();

  Future<void> savePlacesToFirestore() async {
    final places = [
      Place(
        id: 1,
        name: '住吉大社',
        address: '大阪府大阪市住吉区住吉2丁目9-89',
        category: Category.shrine,
        popularity: 5,
        year: '211',
        imageUrl:
            'gs://shrines-and-temples-app.firebasestorage.app/sumiyoshi.jpg',
      ),
      Place(
        id: 2,
        name: '四天王寺',
        address: '大阪府大阪市天王寺区四天王寺1丁目11-18',
        category: Category.temple,
        popularity: 4,
        year: '593',
        imageUrl:
            'gs://shrines-and-temples-app.firebasestorage.app/shitennouji.jpg',
      ),
      Place(
        id: 3,
        name: '平城宮跡',
        address: '奈良県奈良市佐紀町',
        category: Category.ruins,
        popularity: 3,
        year: '710',
        imageUrl: 'assets/images/default.jpg',
      ),
      Place(
        id: 4,
        name: '大仙陵古墳',
        address: '大阪府堺市堺区大仙町',
        category: Category.tomb,
        popularity: 2,
        year: '5世紀',
        imageUrl: 'assets/images/default.jpg',
      ),
      Place(
        id: 5,
        name: '伏見稲荷大社',
        address: '京都府京都市伏見区深草薮之内町68',
        category: Category.shrine,
        popularity: 5,
        year: '711',
        imageUrl:
            'gs://shrines-and-temples-app.firebasestorage.app/fushimiinari.jpg',
      ),
      Place(
        id: 6,
        name: '東大寺',
        address: '奈良県奈良市雑司町406-1',
        category: Category.temple,
        popularity: 5,
        year: '752',
        imageUrl:
            'gs://shrines-and-temples-app.firebasestorage.app/toudaiji.jpg',
      ),
      Place(
        id: 7,
        name: '高松塚古墳',
        address: '奈良県高市郡明日香村平田',
        category: Category.tomb,
        popularity: 3,
        year: '7世紀',
        imageUrl: 'assets/images/default.jpg',
      ),
    ];

    for (var place in places) {
      await _firestoreService.createPlace(place);
    }
  }
}
