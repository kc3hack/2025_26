import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:envied/envied.dart';
import 'package:geoguessur_test/env.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(34.881563, 135.347433);

  @override
  void initState() {
    super.initState();
    _fetchPlaces();
  }

  Set<Marker> _markers = {};
  Future<void> _fetchPlaces() async {
    final String apiKey = Env.pass1; // 取得したAPIキー
    final String url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json"
        "?location=34.881563,135.347433"
        "&radius=50000"
        "&type=place_of_worship"
        "&keyword=寺 OR 神社"
        "&key=$apiKey";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List places = data['results'];

      setState(() {
        _markers = places.map((place) {
          final lat = place['geometry']['location']['lat'];
          final lng = place['geometry']['location']['lng'];
          return Marker(
            markerId: MarkerId(place['name']),
            position: LatLng(lat, lng),
            infoWindow: InfoWindow(title: place['name']),
          );
        }).toSet();
      });
    }
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          markers: _markers,
        ),
      ),
    );
  }
}
