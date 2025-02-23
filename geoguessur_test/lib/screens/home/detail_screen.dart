import 'package:flutter/material.dart';
import 'package:geoguessur_test/interface/place.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.place});
  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail")),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Image.network(place.imageUrl),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(place.name,style: TextStyle(fontSize: 22),),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('住所:',style: TextStyle(fontSize: 16),),
              Text('  〇〇県〇〇市AA区BB町CC', style: TextStyle(fontSize: 15),),
            ],
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('アクセス:',style: TextStyle(fontSize: 16),),
              Text('  〇〇県〇〇市AA区BB町CC', style: TextStyle(fontSize: 15),),
            ],
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('説明:',style: TextStyle(fontSize: 16),),
              Text('  〇〇県〇〇市AA区BB町CC', style: TextStyle(fontSize: 15),),
            ],
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('豆知識:',style: TextStyle(fontSize: 16),),
              Text('  〇〇県〇〇市AA区BB町CC', style: TextStyle(fontSize: 15),),
            ],
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('公式ホームページ:',style: TextStyle(fontSize: 16),),
              Text('  〇〇県〇〇市AA区BB町CC', style: TextStyle(fontSize: 15),),
            ],
          ),
        ),
      ],)
    );
  }
}
