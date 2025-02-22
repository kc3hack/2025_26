import 'package:firebase_storage/firebase_storage.dart';
import 'package:geoguessur_test/interface/place.dart';
import 'package:geoguessur_test/service/database/firestore_service.dart';

class DevelopCreat {
  final FirestoreService _firestoreService = FirestoreService();
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> savePlacesToFirestore() async {
    // 既存のデータを全消去
    await _firestoreService.deleteAllPlaces();

    final places = [
      Place(
        id: 1,
        name: '住吉大社',
        address: '大阪府大阪市住吉区住吉2丁目9-89',
        category: Category.shrine,
        popularity: 5,
        year: '211',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/sumiyoshi.jpg?alt=media&token=59bd2191-e220-46a0-a637-c1dc3f3965ee',
      ),
      Place(
        id: 2,
        name: '四天王寺',
        address: '大阪府大阪市天王寺区四天王寺1丁目11-18',
        category: Category.temple,
        popularity: 4,
        year: '593',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/shitennouji.jpg?alt=media&token=d5112e91-3ec4-4078-a54b-46bc01386452',
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
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/fushimiinari.jpg?alt=media&token=96b21d49-96de-425f-ae4f-33a7c3225d1c',
      ),
      Place(
        id: 6,
        name: '東大寺',
        address: '奈良県奈良市雑司町406-1',
        category: Category.temple,
        popularity: 5,
        year: '752',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/toudaiji.jpg?alt=media&token=59d2c3a8-03c7-4a13-a808-07920e904dde',
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
