import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<Placemark> transLateLocateToAddress(Position location) async {
  List<Placemark> placeMarks = await placemarkFromCoordinates(
    location.latitude,
    location.longitude,
  );
  final placeMark = placeMarks[0];

  return placeMark;
}

// transLateAddressToLocate(String address) async {
//   final placeMarks = await geoCoding.placemarkFromCoordinates(address);
//   final placeMark = placeMarks[0];

//   return placeMark;
// }
