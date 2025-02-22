// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dart:math';
// import 'package:geoguessur_test/interface/place.dart';

// class FirestoreService {
//   final FirebaseFirestore _db = FirebaseFirestore.instance;

//   Future<Place> getRandomPlace(int level) async {
//     Query query;

//     // レベルによってクエリを設定
//     if (level == 1) {
//       query = _db.collection('places').where('region', isEqualTo: '近畿地方');
//     } else if (level == 2) {
//       query = _db.collection('places').where('region', isEqualTo: '大阪府');
//     } else {
//       query = _db.collection('places').where('category', isEqualTo: '有名な場所');
//     }

//     // クエリを実行してドキュメントを取得
//     QuerySnapshot querySnapshot = await query.get();
//     List<QueryDocumentSnapshot> docs = querySnapshot.docs;

//     // ランダムに一つのドキュメントを選択
//     Random random = Random();
//     int randomIndex = random.nextInt(docs.length);
//     DocumentSnapshot randomDoc = docs[randomIndex];

//     // ドキュメントをPlaceオブジェクトに変換
//     Place place = Place(
//       id: randomDoc['id'],
//       name: randomDoc['name'],
//       address: randomDoc['address'],
//       category: randomDoc['category'],
//       year: randomDoc['year'],
//     );

//     return place;
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dart:math';
// import 'package:geoguessur_test/interface/place.dart';

// class FirestoreService {
//   final FirebaseFirestore _db = FirebaseFirestore.instance;

//   Future<List<Place>> getAllPlaces() async {
//     QuerySnapshot querySnapshot = await _db.collection('places').get();
//     List<QueryDocumentSnapshot> docs = querySnapshot.docs;

//     List<Place> places = docs.map((doc) {
//       return Place(
//         id: doc['id'],
//         name: doc['name'],
//         address: doc['address'],
//         category: doc['category'],
//         year: doc['year'],
//       );
//     }).toList();

//     return places;
//   }
// }
