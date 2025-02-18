import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.Location});

  final Location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("quiz result")),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text('Go To Home'),
            ),
          ),
          Center(child: Text('Latitude: ${Location.latitude.toString()}')),
          Center(child: Text('Longitude: ${Location.longitude.toString()}')),
        ],
      ),
    );
  }
}
