import 'package:flutter/material.dart';
import 'package:geoguessur_test/interface/place.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.place});
  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 300,
                child: Image.network(
                  place.imageUrl,
                  fit: BoxFit.contain,
                  loadingBuilder: (
                    BuildContext context,
                    Widget child,
                    ImageChunkEvent? loadingProgress,
                  ) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(child: Text('イメージを読み込み中...'));
                    }
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error, color: Colors.red),
                        Text(
                          'イメージが存在しません',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(place.name, style: TextStyle(fontSize: 22)),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('住所:', style: TextStyle(fontSize: 16)),
                  Text('  ${place.address}', style: TextStyle(fontSize: 15)),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('アクセス:', style: TextStyle(fontSize: 16)),
                  Text('  最寄駅〇〇から〇分', style: TextStyle(fontSize: 15)),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('説明:', style: TextStyle(fontSize: 16)),
                  Text('  ', style: TextStyle(fontSize: 15)),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('豆知識:', style: TextStyle(fontSize: 16)),
                  Text('  ', style: TextStyle(fontSize: 15)),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('公式ホームページ:', style: TextStyle(fontSize: 16)),
                  Text('  ', style: TextStyle(fontSize: 15)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
