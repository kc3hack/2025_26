import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoguessur_test/interface/place.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Create a new place
  Future<void> createPlace(Place place) async {
    await _firestore.collection('places').add({
      'name': place.name,
      'address': place.address,
      'category': place.category.toString().split('.').last,
      'popularity': place.popularity,
      'year': place.year,
      'imageUrl': place.imageUrl,
      'eventName': place.eventName,
      'eventDescription': place.eventDescription,
      'eventImageUrl': place.eventImageUrl,
    });
  }

  // Read a place by ID
  Future<Place?> getPlaceById(String id) async {
    DocumentSnapshot doc = await _firestore.collection('places').doc(id).get();
    if (doc.exists) {
      return Place(
        id: doc['id'],
        name: doc['name'],
        address: doc['address'],
        category: Category.values.firstWhere(
          (e) => e.toString() == 'Category.${doc['category']}',
        ),
        popularity: doc['popularity'],
        year: doc['year'],
        imageUrl: doc['imageUrl'],
        eventName: doc['eventName'],
        eventDescription: doc['eventDescription'],
        eventImageUrl: doc['eventImageUrl'],
      );
    }
    return null;
  }

  // Update a place
  Future<void> updatePlace(String id, Place place) async {
    await _firestore.collection('places').doc(id).update({
      'name': place.name,
      'address': place.address,
      'category': place.category.toString().split('.').last,
      'popularity': place.popularity,
      'year': place.year,
      'imageUrl': place.imageUrl,
      'eventName': place.eventName,
      'eventDescription': place.eventDescription,
      'eventImageUrl': place.eventImageUrl,
    });
  }

  // Delete a place
  Future<void> deletePlace(String id) async {
    await _firestore.collection('places').doc(id).delete();
  }

  // Delete all places
  Future<void> deleteAllPlaces() async {
    QuerySnapshot querySnapshot = await _firestore.collection('places').get();
    for (DocumentSnapshot doc in querySnapshot.docs) {
      await doc.reference.delete();
    }
  }

  // Get all places
  Future<List<Place>> getAllPlaces() async {
    QuerySnapshot querySnapshot = await _firestore.collection('places').get();
    return querySnapshot.docs.map((doc) {
      return Place(
        id: doc['id'],
        name: doc['name'],
        address: doc['address'],
        category: Category.values.firstWhere(
          (e) => e.toString() == 'Category.${doc['category']}',
        ),
        popularity: doc['popularity'],
        year: doc['year'],
        imageUrl: doc['imageUrl'],
        eventName: doc['eventName'],
        eventDescription: doc['eventDescription'],
        eventImageUrl: doc['eventImageUrl'],
      );
    }).toList();
  }
}
