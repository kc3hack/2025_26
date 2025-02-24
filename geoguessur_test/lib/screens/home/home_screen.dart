import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:geoguessur_test/interface/place.dart';
import 'package:geoguessur_test/screens/home/detail_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:geoguessur_test/env.dart';
import 'package:geoguessur_test/component/header/header.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoguessur_test/service/database/firestore_service.dart';
import 'package:go_router/go_router.dart';
import 'package:geoguessur_test/component/button/keyword_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController mapController;
  List<Place> places = [];

  final LatLng _center = const LatLng(34.881563, 135.347433);
  SortBy sortBy = SortBy.id;

  @override
  void initState() {
    super.initState();
    _fetchPlaces(places);
  }

  void onSort(SortBy sortBy, bool sortUp) {
    setState(() {
      this.sortBy = sortBy;
      places = sortPlaces(sortUp);
    });
  }

  List<Place> sortPlaces(bool sortUp) {
    List<Place> sortedPlaces = places;
    switch (sortBy) {
      case SortBy.id:
        sortedPlaces.sort(
          (a, b) => sortUp ? a.id.compareTo(b.id) : b.id.compareTo(a.id),
        );
        return sortedPlaces;
      case SortBy.year:
        sortedPlaces.sort(
          (a, b) =>
              sortUp ? a.year.compareTo(b.year) : b.year.compareTo(a.year),
        );
        return sortedPlaces;
      case SortBy.popularity:
        sortedPlaces.sort(
          (a, b) =>
              sortUp
                  ? a.popularity.compareTo(b.popularity)
                  : b.popularity.compareTo(a.popularity),
        );
        return sortedPlaces;
    }
  }

  Set<Marker> _markers = {};

  Future<void> _fetchPlaces(List<Place> places) async {
    final String apiKey = Env.pass1; // 取得したAPIキー
    // const List<String> keywords = [];

    FirestoreService firestoreService = FirestoreService();
    places = await firestoreService.getAllPlaces();

    for (var place in places) {
      var tmp = place.address;
      var url =
          "https://maps.googleapis.com/maps/api/place/textsearch/json"
          "?query=${Uri.encodeComponent(tmp)}"
          "&key=$apiKey";

      print(url);

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List places2 = data['results'];

        setState(() {
          _markers.addAll(
            places2.map((place2) {
              final lat = place2['geometry']['location']['lat'];
              final lng = place2['geometry']['location']['lng'];
              return Marker(
                markerId: MarkerId(place.id.toString()),
                position: LatLng(lat, lng),
                infoWindow: InfoWindow(
                  title: place.name,
                  snippet: 'ここをタップして詳細情報を見る',
                  onTap: () => context.go('/detail', extra: place),
                ),
              );
            }).toSet(),
          );
        });
      }
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
 Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: Header(),
          body: Stack(
            children: [
              GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
                markers: _markers,
              ),
              Positioned(
                top: 10,
                left: 10,
                right: 10,
                child: Expanded(
                  //padding: EdgeInsets.all(8),
                  child: KeyWordSearch(onSort: onSort, sortBy: sortBy),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
